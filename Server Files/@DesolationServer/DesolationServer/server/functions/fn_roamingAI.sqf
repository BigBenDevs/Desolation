scriptName "fn_roamingAI";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_roamingAI.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use _unit file without permission from the author!
    You're not allowed to modify _unit file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_roamingAI.sqf"

// Parameters
_checkpointPrefix 	= param[0,"",[""]];
_fromNumber			= param[1,-1,[-1]];
_toNumber			= param[2,-1,[-1]];
_countMaxUnits 		= param[3,0,[0]];

// Exceptions
if (!isServer) exitWith {};

// Code
createCenter EAST;

_checkpointsArray = [];
for "_i" from _fromNumber to _toNumber step 1 do
{
	_checkpointsArray pushBack (format ["%1%2",_checkpointPrefix,_i]);
};

_lastUpdateTime = dayTime;
_lastDetection = -999;
_firstLoop = true;
_myAI = [];
while {true} do {
	_countUnitsAlive = {!isNull _x} count _myAI;
	if (_countUnitsAlive < _countMaxUnits AND (({(getMarkerPos "dz_airoampoint_0") distance _x < 2000} count AllPlayers) > 0)) then {
		for "_i" from 1 to (_countMaxUnits - _countUnitsAlive) step 1 do
		{
			diag_log "RoamingAI: Created unit";

			// Create missing units
			_unit = (createGroup EAST) createUnit ["O_Soldier_F", getMarkerPos (_checkpointsArray call BIS_fnc_selectRandom), [], 0, "FORM"];
			_unit addrating 999999999;
			_unit setVariable ["isZombie",true,true];
			_unit setVariable ["isAI",true,true];
			_unit addEventHandler ["Killed",{
				(_this select 0) setVariable ["timeSinceDeath",serverTime,true];
				(_this select 0) setVariable ["isPlayerCorpse",true,true];
			}];
			removeAllWeapons _unit;
			removeAllItems _unit;
			removeAllAssignedItems _unit;
			removeUniform _unit;
			removeVest _unit;
			removeBackpack _unit;
			removeHeadgear _unit;
			removeGoggles _unit;
			_unit forceAddUniform "TRYK_U_B_BLKBLK_CombatUniform";
			_unit addItemToUniform "hlc_30Rnd_545x39_B_AK";
			_unit addVest "TRYK_V_tacv1LC_MSL_NV";
			for "_i" from 1 to 4 do {_unit addItemToVest "hlc_30Rnd_545x39_B_AK";};
			_unit addHeadgear "TRYK_H_PASGT_BLK";
			_unit addGoggles "TRYK_US_ESS_Glasses_BLK";
			_unit addWeapon "hlc_rifle_ak12";
			_unit addPrimaryWeaponItem "acc_flashlight";
			_unit addPrimaryWeaponItem "CUP_optic_CompM4";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "ItemRadio";
			_unit linkItem "TRYK_balaclava_BLACK_EAR_NV";
			_unit setSpeaker "Male01ENGB";
			[_unit,"BI"] call bis_fnc_setUnitInsignia;
			_unit setSkill ["general",1];

			_myAI pushBack _unit;

			diag_log "RoamingAI: Created AI unit";
			diag_log format ["RoamingAI: Current AI count and group count: %1 at %2 groups",count _myAI, count allGroups];
		};
	};

	{
		if ((({(getMarkerPos "dz_airoampoint_0") distance _x < 2000} count AllPlayers) == 0)) then {
			deleteVehicle _x;
			diag_log "RoamingAI: Deleted not necessary unit";
		};
	} forEach _myAI;

	{
		_curUnit = _x;
		_curUnit enableGunLights "forceOn";
		_curGroup = group _x;
		if (true) then {
			_pos = getMarkerPos (_checkpointsArray call BIS_fnc_selectRandom);
			if (dayTime < 5 OR dayTime > 20) then {
				if (_lastUpdateTime < 20 AND dayTime > 20) then { // In case it became night make the units walk with the weapon raised and flashlights on
					_curGroup setBehaviour "AWARE";
				};
			} else {
				if ((_lastUpdateTime < 5 AND dayTime > 5) OR _firstLoop OR ((serverTime - _lastDetection) > 600) AND (dayTime > 6 AND dayTime < 20)) then { // In case it became day make the units walk with the weapon lowered
					_curGroup setBehaviour "SAFE";
				};
			};

			// If the unit doesnt have more than 3 waypoints give him new ones to follow
			if (count (waypoints _curUnit) < 6) then {
				_wp = _curGroup addWaypoint [_pos, 0];
				_wp setWaypointType "MOVE";
				_wp setWaypointCompletionRadius 20;
				_wp setWaypointSpeed "LIMITED";
				_wp setWaypointFormation "STAG COLUMN";
				diag_log format ["RoamingAI: Added waypoint at %1 for group %2",_pos,_curGroup];
			};

			// Check if unit knows anything about players and in case yes make the other units know about that unit too
			{
				_curPlayer = _x;
				if (_curUnit knowsAbout _curPlayer > 3.7 AND !(lineIntersects [eyePos _curUnit, eyePos _curPlayer, _curUnit, _curPlayer])) then {
					{
						_x reveal _curPlayer;
						_lastDetection = serverTime;
					} forEach _myAI;
				};
			} forEach AllPlayers;
		};
	} forEach _myAI;

	_lastUpdateTime = dayTime;
	_firstLoop = false;

	// Wait 5 seconds
	uisleep 5;

	// Remove all dead units
	_newArray = [];
	{
		if (!isNull _x) then {
			_newArray pushBack _x;
		};
	} forEach _myAI;
	_myAI = _newArray;
};