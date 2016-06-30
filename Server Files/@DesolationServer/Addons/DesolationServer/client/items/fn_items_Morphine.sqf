if (isDedicated) exitWith {};scriptName "fn_Morphine";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_Morphine.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_Morphine.sqf"

// Parameters
_item = param[0,"DayZero_Item_Morphine",[""]];

// Exceptions
if (!(player getVariable ["brokenLegs",false]) AND !(cursorTarget getVariable ["brokenLegs",false])) exitWith {};

// Code
player removeItem _item;

if (player getVariable ["brokenLegs",false]) then {
	player say3D "z_bandage_0";
	closeDialog 0;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	dz_inAction = true;
	[] spawn {
		uisleep 4.5;
		dz_inAction = false;
		player setVariable ["brokenLegs",nil,true];
		dz_brokenLegs = false;
		["<t color='#A3FB26'>My leg feels better</t>"] call dz_fnc_addToFeed;
		player setHitPointDamage ["HitLegs",0];
	};
} else {
	player say3D "z_bandage_0";
	closeDialog 0;
	_ct = cursorTarget;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	dz_inAction = true;
	_ct spawn {
		[format ["<t color='#A3FB26'>I started giving morphine to %1</t>",name _this]] call dz_fnc_addToFeed;
		uisleep 4.5;
		dz_inAction = false;
		_this setVariable ["brokenLegs",nil,true];
		[format ["<t color='#A3FB26'>I have injected the morphine into %1</t>",name _this]] call dz_fnc_addToFeed;
		{
			["<t color='#A3FB26'>My leg feels better</t>"] call dz_fnc_addToFeed;
			dz_brokenLegs = false;
			player setHitPointDamage ["HitLegs",0];
		} remoteExec ["BIS_FNC_SPAWN",_this];
	};
};