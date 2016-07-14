scriptName "fn_cleanUp";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_cleanUp.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_cleanUp.sqf"

// Parameters


// Exceptions


// Code
[[{
	while {true} do {
		diag_log "Cleaning world from zombies and weaponholders...";

		{
			_agent = agent _x;
			if (({(_x distance _agent) < 200} count AllPlayers) < 1) then {
				deleteVehicle (agent _x);
			};
		} forEach agents;

		diag_log format ["DEBUG: SERVERFPS: %1",diag_fps];

		uisleep 15;
		{
			if (!alive _x) then {
				if (!(_x getVariable ["isZombie",false]) AND !(_x getVariable ["isPlayer",false]) AND !(_x getVariable ["isAI",false]) AND !(_x getVariable ["isAnimal",false])) then {
					deleteVehicle _x;
				} else {
					if (_x getVariable ["isPlayer",false]) then {
						if (isNil {_x getVariable "isPlayerCorpse"}) then {
							deleteVehicle _x;
						} else {
							if (serverTime - (_x getVariable "timeSinceDeath") > 1200) then {
								deleteVehicle _x;
							};
						};
					} else {
						if (_x getVariable ["isAnimal",false]) then {
							if (serverTime - (_x getVariable "timeSinceDeath") > 600) then {
								deleteVehicle _x;
							};
						} else {
							if (serverTime - (_x getVariable "timeSinceDeath") > 60) then {
								deleteVehicle _x;
							};
						};
					};
				};
			} else {
				if (_x getVariable ["isZombie",false] AND !(_x getVariable ["isAI",false])) then {
					if (!(isNull (_x getVariable ["zombieOwner",objNull]))) then {
						_unit = _x;
						_countNearPlayers = {_unit distance _x < dz_sv_zombies_maxRadius} count AllPlayers;
						if (_countNearPlayers < 1) then {
							deleteVehicle _x;
						};
					} else {
						deleteVehicle _x;
					};
				};
				if (_x getVariable ["isAI",false]) then {
					_unit = _x;
					_countNearPlayers = {_unit distance _x < 2000} count AllPlayers;
					if (_countNearPlayers < 1) then {
						deleteVehicle _x;
					};
				};
			};
		} forEach (AllMIssionObjects "Man");

		{
			_curWH = _x;
			if (({(_x distance _curWH) < 125} count AllPlayers) < 1 AND (isNil {_x getVariable "doNotDeleteMe"}) AND !isNull _curWH) then {
				_house = nearestBuilding (getPos _curWH);
				if (!isNil {_house getVariable "dz_timeSinceLastLootSpawn"}) then {
					_house setVariable ["dz_timeSinceLastLootSpawn",nil,true];
				};
				diag_log format ["Deleting Weaponholder at %1",getpos _curWH];
				deleteVehicle _curWH;
			};
		} forEach ((allMissionObjects "GroundWeaponHolder") + (allMissionObjects "WeaponHolder") + (allMissionObjects "WeaponHolderSimulated"));


		// Delete empty groups
		{
			if ((count units _x) == 0) then {
				if (local _x) then {
					deleteGroup _x;
				};
			};
		} forEach AllGroups;
	};
}],{
	dz_fnc_cleanUpScript = (_this select 0);
	[] spawn dz_fnc_cleanUpScript;
}] remoteExec ["BIS_FNC_SPAWN",2];


/*

if (!isServer) exitWith {}; // isn't server

#define COMPONENT repetitiveCleanup
#define DOUBLES(A,B) ##A##_##B
#define TRIPLES(A,B,C) ##A##_##B##_##C
#define QUOTE(A) #A
#define GVAR(A) DOUBLES(COMPONENT,A)
#define QGVAR(A) QUOTE(GVAR(A))


if (!isNil{GVAR(isRunning)} && {GVAR(isRunning)}) then { // reset if already running
	GVAR(isRunning)=false;
	waitUntil{isNil{GVAR(isRunning)}};
};
GVAR(isRunning)=true;

//==================================================================================//
//=============================== CNFIGURATION start ===============================//
//==================================================================================//


_ttdBodies = 20*60; // seconds to delete dead bodies (0 means don't delete)
_ttdVehiclesDead = 4*60; // seconds to delete dead vehicles (0 means don't delete)
_ttdVehiclesImmobile = 0*60; // seconds to delete immobile vehicles (0 means don't delete)

GVAR(deleteClassesConfig) = [
	//[5*60, ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"]],
	[60*60, ["TimeBombCore"]],
	[10*60, ["SmokeShell"]],
	[5*60, ["CraterLong_small","CraterLong"]],
	[20*60, ["AGM_SpareWheel","AGM_JerryCan","AGM_SpareTrack","AGM_FastRoping_Helper"]],
	[20*60, ["#dynamicsound","#destructioneffects","#track"]]
];

GVAR(resetTimeIfPlayerIsWithin) = 100; // how far away from object player needs to be so it can delete

//==================================================================================//
//=============================== CNFIGURATION end =================================//
//==================================================================================//




GVAR(objectsToCleanup)=[];
GVAR(timesWhenToCleanup)=[];
GVAR(originalCleanupDelays)=[];
GVAR(resetTimeIfPlayerNearby)=[]; // might want to do it on my own in more effective way

GVAR(deleteThoseIndexes)=[];


private ["_markArraysForCleanupAt", "_cleanupArrays"];

#define IS_SANE(OBJECT) !isNil{OBJECT} && {!isNull(OBJECT)}

_markArraysForCleanupAt = {
	params [
		"_index"
	];
	GVAR(deleteThoseIndexes) pushBack _index;
};

_cleanupArrays = {
	GVAR(deleteThoseIndexes) sort false;
	{
		GVAR(objectsToCleanup) deleteAt _x;
		GVAR(timesWhenToCleanup) deleteAt _x;
		GVAR(originalCleanupDelays) deleteAt _x;
		GVAR(resetTimeIfPlayerNearby) deleteAt _x;
	} forEach GVAR(deleteThoseIndexes);
	GVAR(deleteThoseIndexes) = [];
};



GVAR(addToCleanup) = {
	params [
		"_object",
		["_delay", 60, [0]],
		["_resetTimerIfPlayerNearby", true, [true,false]],
		["_resetValuesIfObjectAlreadyPresent", false, [true,false]]
	];
	private ["_newTime", "_index", "_currentTime"];
	if(IS_SANE(_object) && {!(_object getVariable["persistent",false])}) then {
		_newTime = _delay + time;
		_index = GVAR(objectsToCleanup) find _object;
		if(_index == -1) then {
			GVAR(objectsToCleanup) pushBack _object;
			GVAR(timesWhenToCleanup) pushBack _newTime;
			GVAR(originalCleanupDelays) pushBack _delay;
			GVAR(resetTimeIfPlayerNearby) pushBack _resetTimerIfPlayerNearby;
		} else {
			if(_resetValuesIfObjectAlreadyPresent) then {
				GVAR(timesWhenToCleanup) set[_index, _newTime];
				GVAR(originalCleanupDelays) set[_index, _delay];
				GVAR(resetTimeIfPlayerNearby) set[_index, _resetTimerIfPlayerNearby];
			};
		};
	};
};

GVAR(removeFromCleanup) = {
	params [
		"_object"
	];
	if(!isNil{_object} && {!isNull(_object)}) then {
		_index = GVAR(objectsToCleanup) find _object;
		if(_index!=-1) then {
			[_index] call _markArraysForCleanupAt;
		};
	};
};


private ["_playerPositions", "_unit", "_myPos", "_delay", "_newTime", "_object", "_objectIndex"];

while{GVAR(isRunning)} do {

    uisleep 2;

    {
    	_object = _x;
		{
	    	_timeToDelete = _x select 0;
	    	_clasesToDelete = _x select 1;
	    	if(_timeToDelete>0) then {
		    	{
					if( (typeof _object == _x) || {(_object isKindOf _x)} ) then {
						[_object, _timeToDelete, true, false] call GVAR(addToCleanup);
					};
				} forEach _clasesToDelete;
			};
	    } forEach GVAR(deleteClassesConfig);
	} forEach allMissionObjects "";


	if (_ttdBodies>0) then {
		{
			[_x, _ttdBodies, true, false] call GVAR(addToCleanup);
		} forEach allDeadMen;
	};

	if (_ttdVehiclesDead>0) then {
		{
			if(_x == vehicle _x) then { // make sure its vehicle
				[_x, _ttdVehiclesDead, true, false] call GVAR(addToCleanup);
			};
		} forEach (allDead - allDeadMen); // all dead without dead men == mostly dead vehicles
	};

	if (_ttdVehiclesImmobile>0) then {
		{
			if(!canMove _x && {alive _x}count crew _x==0) then {
				[_x, _ttdVehiclesImmobile, true, false] call GVAR(addToCleanup);
			} else {
				[_x] call GVAR(removeFromCleanup);
			};
		} forEach vehicles;
	};

	_playerPositions = [];
	{
		_playerPositions pushBack (getPosATL _x);
	} forEach allPlayers;


	GVAR(resetTimeIfPlayerIsWithin)Sqr = GVAR(resetTimeIfPlayerIsWithin) * GVAR(resetTimeIfPlayerIsWithin);

	call _cleanupArrays;
	{
		_object = _x;
		_objectIndex = _forEachIndex;
		if(IS_SANE(_object)) then {
			[_objectIndex] call _markArraysForCleanupAt;
		} else {
			if((GVAR(timesWhenToCleanup) select _objectIndex) < time) then {
				[_objectIndex] call _markArraysForCleanupAt;
				deleteVehicle _object; // hideBody _object; sometimes doesn't work while deleteVehicle works always
			} else {
				if(GVAR(resetTimeIfPlayerNearby) select _objectIndex) then {
					_myPos = getPosATL _object;
					{
						if( (_myPos distanceSqr _x) < GVAR(resetTimeIfPlayerIsWithin)Sqr) exitWith {
							_delay = GVAR(originalCleanupDelays) select _objectIndex;
							_newTime = _delay + time;
							GVAR(timesWhenToCleanup) set[_objectIndex, _newTime];
						};
					} forEach _playerPositions;
				};
			};
		};
	} forEach GVAR(objectsToCleanup);
	call _cleanupArrays;

};

GVAR(isRunning) = nil;*/