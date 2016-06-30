scriptName "fn_createEvent";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_createEvent.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_createEvent.sqf"

// Parameters


// Exceptions


// Code

// endlocation [15360.9,15360.3,0.00143433]

_randomMarker = dz_sv_droppoints_prefix + str(floor (random dz_sv_droppoints_amount));
_dropPosition = getMarkerPos _randomMarker;

diag_log format ["Dropping at %1",_dropPosition];

_plane = createVehicle ["CUP_B_C130J_USMC",[0,0,0],[],0,"FLY"];
_plane setDir ([_plane,_dropPosition] call BIS_fnc_dirTo);
_groupPlane = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{_x moveInDriver _plane} forEach units _groupPlane;

_plane flyInHeight 600;

_groupPlane addWaypoint [_dropPosition, 0];
_groupPlane addWaypoint [[15360.9,15360.3,0.00143433], 1];

_plane allowDamage false;

/*
[_plane] spawn {
	while {!isNull (_this select 0)} do {
		_flare = "F_40mm_Red" createVehicle (position (_this select 0));
		_flare attachTo [(_this select 0),[0,0,-5]];
		uisleep 10;
	};
};
*/

[_plane] spawn {
	_flare = objNull;
	while {!isNull (_this select 0)} do {
		if ((_this select 0) getVariable ["dropped",false]) then {
			_flare = "F_40mm_Red" createVehicle (position (_this select 0));
			_flare attachTo [(_this select 0),[0,0,-5]];
		} else {
			_flare = "F_40mm_Green" createVehicle (position (_this select 0));
			_flare attachTo [(_this select 0),[0,0,-5]];
		};
		uisleep 5;
		//deleteVehicle _flare;
	};
};

[[_dropPosition],{
	_itemsPlayer = (vestItems player) + (backpackITems player) + (uniformItems player);
	if (("DayZero_Item_MobilePhone" in _itemsPlayer) OR ("ItemRadio" in _itemsPlayer) OR ("ItemRadio" in assignedItems player)) exitWith {
		[format["<t color='#A3FB26'>*RADIO TRANSMISSION*<br/>MILITARY SUPPLY DROP AT %1</t>",mapGridPosition (_this select 0)]] call dz_fnc_addToFeed;
	};
}] remoteExec ["BIS_FNC_SPAWN"];

waitUntil {(_plane distance2D _dropPosition) < 100};

_plane action ["useWeapon",_plane,driver _plane,1];

_box = createVehicle ["CargoNet_01_box_F", position _plane, [], 0, "CAN_COLLIDE"];

/*_smoke = "SmokeShellRed" createVehicle getPos _box;
_flare = "F_40mm_Red" createVehicle getPos _box;
_smoke attachTo [_box,[0,0,0]];
_flare attachTo [_box,[0,0,0]];*/

_para = createVehicle ["O_Parachute_02_F", [getPos _plane select 0, getPos _plane select 1, (getPos _plane select 2) - 30], [], 0, ""];
_para setPosATL [(getPosATL _plane) select 0,(getPosATL _plane) select 1,((getPosATL _plane) select 2) - 30];
_box attachTo [_para,[0,0,-4]];
_plane setVariable ["dropped",true];

[_box] spawn {
	while {((getPos (_this select 0)) select 2) > 2} do {
		uisleep 15;
		_smoke = "SmokeShellYellow" createVehicle getPos (_this select 0);
		_flare = "F_40mm_Yellow" createVehicle getPos (_this select 0);
		_smoke attachTo [(_this select 0),[0,0,0]];
		_flare attachTo [(_this select 0),[0,0,0]];
	};
};

/*_box addItemCargoGlobal ["DayZero_Item_Bandage",5];
_box addItemCargoGlobal ["DayZero_Item_Bloodbag",5];
_box addItemCargoGlobal ["DayZero_Item_HeatPack",5];
_box addItemCargoGlobal ["DayZero_Item_Antibiotic",5];
_box addItemCargoGlobal ["DayZero_Item_Waterpure",5];
_box addItemCargoGlobal ["DayZero_Item_Morphine",5];
_box addItemCargoGlobal ["DayZero_Item_Pasta",10];
_box addItemCargoGlobal ["DayZero_Item_Canteen_Purified",10];
_box addItemCargoGlobal ["ItemMap",1];
_box addItemCargoGlobal ["ItemCompass",1];
_box addWeaponCargoGlobal ["CUP_srifle_DMR",floor random 1];
_box addWeaponCargoGlobal ["CUP_srifle_M14",floor random 1];
_box addWeaponCargoGlobal ["CUP_arifle_M4A1_black",floor random 1];
_box addWeaponCargoGlobal ["CUP_arifle_L85A2",floor random 1];
_box addWeaponCargoGlobal ["CUP_hgun_Glock17",floor random 1];*/
// DayZero_Item_Blueprint_SHL2

//Airdrop

// Items
_possibleItems = ["DayZero_Item_Bandage","DayZero_Item_Bloodbag","DayZero_Item_Antibiotic","DayZero_Item_Waterpure","DayZero_Item_Morphine","DayZero_Item_Pasta","DayZero_Item_Canteen_Purified","ItemMap","ItemCompass","hlc_muzzle_300blk_KAC","hlc_optic_artel_m14","CUP_optic_LeupoldMk4","HLC_Optic_ZFSG1","NVGoggles"];
for "_i" from 1 to (10 + (round (random 10))) step 1 do
{
    _box addItemCargoGlobal [_possibleItems call BIS_FNC_selectRandom,1];
};

// Items
_possibleItems = ["CUP_hgun_Glock17","hlc_rifle_m14dmr","hlc_rifle_M14_Rail","hlc_rifle_augsrcarb","hlc_rifle_auga1_t","hlc_rifle_auga1carb_B","hlc_rifle_auga3","hlc_rifle_Bushmaster300","hlc_rifle_hk51","hlc_rifle_g3ka4","hlc_rifle_SAMR","CUP_arifle_CZ805_B","CUP_srifle_CZ750","CUP_arifle_G36C","hlc_rifle_g3sg1","hlc_rifle_g3a3","CUP_arifle_CZ805_A2"];
for "_i" from 1 to (1 + (round (random 3))) step 1 do
{
    _box addItemCargoGlobal [_possibleItems call BIS_FNC_selectRandom,1];
};


_weapons = (getWeaponCargo _box) select 0;
// Magazines
{
	_magazine = ([_x] call dz_fnc_itemDetails select 7) select 0;
	_box addMagazineCargoGlobal [_magazine,10];
} forEach _weapons;

waitUntil {(_plane distance2D [15360.9,15360.3,0.00143433]) < 100};
deleteVehicle _plane;













//"hlc_rifle_Colt727";
//hlc_rifle_honeybadger
//hlc_rifle_bcmjack
//  "hlc_rifle_FAL5061";
//  "hlc_muzzle_snds_fal";
//  "hlc_optic_suit";
//"hlc_rifle_FAL5061Rail";
//"hlc_rifle_LAR";
//"arifle_SA_m4a1_sopmod";
//"hlc_smg_mp5k_PDW";
//"hlc_muzzle_Tundra";
//"hlc_smg_mp5a3";
//"hlc_rifle_SLR";
