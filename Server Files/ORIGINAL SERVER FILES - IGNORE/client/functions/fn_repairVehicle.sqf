if (isDedicated) exitWith {};scriptName "fn_repairVehicle";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_repairVehicle.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_repairVehicle.sqf"

// Parameters
_ID = param[0,-1,[0]];

// Exceptions
//systemChat str dz_cursorTarget;

// Code
_itemsPlayer = (vestItems player) + (backpackITems player) + (uniformItems player);

if (_ID > -1) then {
	if !("DayZero_Item_ToolBox" in _itemsPlayer) exitWith {
		["<t color='#A3FB26'>I don't have a adjustable wrench</t>"] call dz_fnc_addToFeed;
	};

	// Get hit points
	_hitPoints = [];
	{
		if ((_x select 0) == (typeOf dz_cursorTarget)) then {
			_hitPoints = (_x select 1);
		};
	} forEach dz_sv_vehicleHitPoints;
	if (count _hitPoints == 0) then {
		_hitPoints = dz_sv_vehicleHitPointsDefault;
	};

	_toRepair = _hitPoints select _ID;

	_needItem = switch (_toRepair) do {
		case "HitLFWheel": {"DayZero_Item_Wheel"};
		case "HitLF2Wheel": {"DayZero_Item_Wheel"};
		case "HitRFWheel": {"DayZero_Item_Wheel"};
		case "HitRF2Wheel": {"DayZero_Item_Wheel"};
		case "HitFuel": {"DayZero_Item_Fueltank"};
		case "HitEngine": {"DayZero_Item_Engine"};
		case "HitAvionics": {"DayZero_Item_Scrapmetal"};
		case "HitHRotor": {"DayZero_Item_Rotor"};
		case "HitVRotor": {"DayZero_Item_Rotor"};
		case "HitHull": {"DayZero_Item_Scrapmetal"};
		case "HitBody": {"DayZero_Item_Scrapmetal"};
		case "HitLMWheel": {"DayZero_Item_Wheel"};
		case "HitRMWheel": {"DayZero_Item_Wheel"}; // TODO
	};

	if !(_needItem in _itemsPlayer) exitWith {
		["<t color='#A3FB26'>I don't have the required part...</t>"] call dz_fnc_addToFeed;
	};

	[_toRepair,_needItem] spawn {
		closeDialog 0;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		dz_inAction = true;
		player say3D "z_repair_0";
		uisleep 4.5;
		dz_inAction = false;
		["<t color='#A3FB26'>That part should be good now</t>"] call dz_fnc_addToFeed;
		dz_cursorTarget setHitPointDamage [(_this select 0),0];
		[[dz_cursorTarget,(_this select 0)],{
			(_this select 0) setHitPointDamage [_this select 1,0];
		}] remoteExecCall ["BIS_FNC_SPAWN"];
		player removeItem (_this select 1);
	};

	if (_needItem in ["HitHull","HitBody"]) then {
		[] spawn {
			uisleep 4.5;
			{
				dz_cursorTarget setHitPointDamage [_x,0];
			} forEach [""];
		};
	};
} else {

	if ("DayZero_Item_JerryCan" in _itemsPlayer) then {
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
			[(_this select 0),((fuel (_this select 0)) + (_this select 1))] remoteExec ["dz_fnc_setVehicleFuel"];
			[format["<t color='#A3FB26'>I have refilled the vehicle with 30 liters of fuel (%1)</t>",(_this select 0)]] call dz_fnc_addToFeed;
			if (isNull (_this select 0)) then {

			} else {
				player removeItem "DayZero_Item_Jerrycan";
				player addItem "DayZero_Item_JerryCan_Empty";
			};
		};
	} else {
		["<t color='#A3FB26'>I don't have a Jerry Can with me</t>"] call dz_fnc_addToFeed;
	};
};