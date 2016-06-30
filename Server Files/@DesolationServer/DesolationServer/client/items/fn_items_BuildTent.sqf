if (isDedicated) exitWith {};scriptName "fn_items_BuildTent";
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
#define __filename "fn_items_BuildTent.sqf"

// Parameters


// Exceptions


// Code
/*_pos = player modelToWorld [0,2,0];
_preview = "DayZero_Object_OldTent";

// Spawn Tent
_tent = "DayZero_Object_OldTent" createVehicle position player;
_tent setPos (player modelToWorld [0,2,0]);
_tent setDir getDir player;
_tent setPos getPos _tent;*/

if (((player modelToWorld [0,0,0]) select 2) > 0.1) exitWith {
	["<t color='#ffff00'>I cannot build a tent here</t>"] call dz_fnc_addToFeed;
};

_itemsPlayer = (vestItems player) + (backpackITems player) + (uniformItems player);

if !("DayZero_Item_Hammer" in _itemsPlayer) exitWith {
	["<t color='#A3FB26'>I need a hammer to pitch this tent</t>"] call dz_fnc_addToFeed;
};

closeDialog 0;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
dz_inAction = true;
[player,"z_tentunpack_0"] remoteExec ["say3D"];
[] spawn {
	uisleep 4.5;
	dz_inAction = false;
	["<t color='#A3FB26'>I have build a tent</t>"] call dz_fnc_addToFeed;
	player removeItem "DayZero_Item_Tent";
	[-1,[(player modelToWorld [0,2,0]) select 0,(player modelToWorld [0,2,0]) select 1,0],getDir player,nil,true] remoteExec ["dz_fnc_initializeTent",2];

};