if (isDedicated) exitWith {};scriptName "fn_items_buildStash";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_BuildTent.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_buildStash.sqf"

// Parameters


// Exceptions


// Code
if (((player modelToWorld [0,0,0]) select 2) > 0.1) exitWith {
	["<t color='#ffff00'>I cannot build a stash here</t>"] call dz_fnc_addToFeed;
};

_itemsPlayer = (vestItems player) + (backpackITems player) + (uniformItems player);

if !("DayZero_Item_Shovel" in _itemsPlayer) exitWith {
	["<t color='#A3FB26'>I need a shovel to build a stash</t>"] call dz_fnc_addToFeed;
};

closeDialog 0;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
dz_inAction = true;
//[player,"z_tentunpack_0"] remoteExec ["say3D"];
[] spawn {
	uisleep 4.5;
	dz_inAction = false;
	["<t color='#A3FB26'>I have build a stash</t>"] call dz_fnc_addToFeed;
	player removeItem "DayZero_Item_SmallStash";
	[-1,[(player modelToWorld [0,2,0]) select 0,(player modelToWorld [0,2,0]) select 1,0],getDir player,nil,true,"DayZero_Object_SmallStash"] remoteExec ["dz_fnc_initializeTent",2];

};