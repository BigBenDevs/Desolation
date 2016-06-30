if (isDedicated) exitWith {};scriptName "fn_items_Bandage";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_Bandage.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_Bandage.sqf"

// Parameters


// Exceptions
if (!(player getVariable ["bleeding",false]) AND !(cursorTarget getVariable ["bleeding",false])) exitWith {};

// Code
if (player getVariable ["bleeding",false]) then {
	player say3D "z_bandage_0";
	closeDialog 0;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	dz_inAction = true;
	[] spawn {
		uisleep 4.5;
		dz_inAction = false;
		player setVariable ["bleeding",nil,true];
		["<t color='#A3FB26'>I am no longer bleeding</t>"] call dz_fnc_addToFeed;
		player removeItem "DayZero_Item_Bandage";
		resetCamShake;
	};
} else {
	player say3D "z_bandage_0";
	closeDialog 0;
	_ct = cursorTarget;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	dz_inAction = true;
	_ct spawn {
		[format ["<t color='#A3FB26'>I started bandaging %1</t>",name _this]] call dz_fnc_addToFeed;
		uisleep 4.5;
		dz_inAction = false;
		_this setVariable ["bleeding",nil,true];
		player removeItem "DayZero_Item_Bandage";
		{
			["<t color='#A3FB26'>I am no longer bleeding</t>"] call dz_fnc_addToFeed;
			resetCamShake;
		} remoteExec ["BIS_FNC_SPAWN",_this];
		[format ["<t color='#A3FB26'>I bandaged %1</t>",name _this]] call dz_fnc_addToFeed;
	};
};