if (isDedicated) exitWith {};scriptName "fn_items_JerryCan";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_JerryCan.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_JerryCan.sqf"

// Parameters

// Exceptions


// Code
if ((_this select 0) == "DayZero_Item_JerryCan") then {
	_fuelCapacity = getNumber(configfile >> "CfgVehicles" >> (typeOf dz_cursorTarget) >> "fuelCapacity");
	_jerryCanCapacity = 30;

	_upper = (_jerryCanCapacity/_fuelCapacity);
	closeDialog 0;
	player say3D "z_refuel_0";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	dz_inAction = true;
	[dz_cursorTarget,_upper] spawn {
		uisleep 4.5;
		dz_inAction = false;
		["<t color='#A3FB26'>I have refilled the vehicle with 30 liters of fuel</t>"] call dz_fnc_addToFeed;
		player removeItem "DayZero_Item_Jerrycan";
		player addItem "DayZero_Item_JerryCan_Empty";
		[(_this select 0),((fuel (_this select 0)) + (_this select 1))] remoteExec ["dz_fnc_setVehicleFuel"];
	};
} else {
	player say3D "z_refuel_0";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	dz_inAction = true;
	closeDialog 0;
	[] spawn {
		uisleep 4.5;
		dz_inAction = false;
		["<t color='#A3FB26'>The jerrycan is now filled with 30 liters of fuel</t>"] call dz_fnc_addToFeed;
		player removeItem "DayZero_Item_Jerrycan_Empty";
		player addItem "DayZero_Item_JerryCan";
	};
};