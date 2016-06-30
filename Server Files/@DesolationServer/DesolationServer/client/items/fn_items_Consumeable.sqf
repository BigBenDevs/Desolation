if (isDedicated) exitWith {};scriptName "fn_items_Consumeable";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_Consumeable.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_Consumeable.sqf"

// Parameters
_type = param[0,"",[""]];

if (_type == "DayZero_Item_Antibiotic") exitWith {
	dz_infected = false;
	["<t color='#A3FB26'>I feel better</t>"] call dz_fnc_addToFeed;
	player removeItem _type;
	call dz_fnc_playerMenuLoadInventory;
};

// Exceptions
if (_type == "") exitWith {};
if (_type in ["DayZero_Item_Canteen_Purified","DayZero_Item_Canteen_Boiled","DayZero_Item_Canteen"] AND (cursorTarget isKindOf "DayZero_Object_CampFire") AND !(isNil {cursorTarget getVariable "burning"})) exitWith {
	[cursorTarget,false] remoteExecCall ["dz_fnc_campfireEffect"];
	["<t color='#A3FB26'>I have extinguished the campfire</t>"] call dz_fnc_addToFeed;
	player addItem "DayZero_Item_Canteen_Empty";
	player removeItem _type;
	call dz_fnc_playerMenuLoadInventory;
};

// Code
_values = switch (_type) do {
	// Drinks
	case "DayZero_Item_Canteen_Boiled": {["drink",0,35,100]};
	case "DayZero_Item_Canteen_Purified": {["drink",0,25,100]};
	case "DayZero_Item_Canteen": {["drink",0,25,100]};
	case "DayZero_Item_Franta": {["drink",0,15,100]};
	case "DayZero_Item_Spirit": {["drink",0,15,100]};
	case "DayZero_Item_Redgull": {["drink",5,15,100]};
	case "DayZero_Item_MountainDew": {["drink",0,15,100]};
	case "DayZero_Item_TaviCola": {["drink",0,15,100]};

	// Food
	case "DayZero_Item_ChocBar": {["food",25,-5,500]};
	case "DayZero_Item_Meat_Cooked": {["food",80,0,2500]};
	case "DayZero_Item_Meat_Raw": {["food",20,20,500]};
	case "DayZero_Item_RiceBox": {["food",45,-10,100]};
	case "DayZero_Item_TacticalBacon": {["food",25,3,100]};
	case "DayZero_Item_Pasta": {["food",25,3,100]};
	case "DayZero_Item_Sardines": {["food",25,3,100]};
	case "DayZero_Item_BakedBeans": {["food",25,3,100]};
	case "DayZero_Item_Cereal": {["food",25,-5,100]};
	case "DayZero_Item_Meat_Cooked": {["food",60,0,100]};
};

switch (_values select 0) do {
	case "drink": {
		["<t color='#ffff00'>I have consumed: " + (([_type] call dz_fnc_itemDetails) select 1) + "</t>"] call dz_fnc_addToFeed;
		[(_values select 1),(_values select 2)] call dz_fnc_changeHungerThirst;
		if (_type in ["DayZero_Item_Canteen_Boiled","DayZero_Item_Canteen_Purified","DayZero_Item_Canteen"]) then {
			player say3D "z_fillwater_0";
		} else {
			player say3D "z_soda_0";
		};
	};
	case "food": {
		["<t color='#ffff00'>I have consumed: " + (([_type] call dz_fnc_itemDetails) select 1) + "</t>"] call dz_fnc_addToFeed;
		[(_values select 1),(_values select 2)] call dz_fnc_changeHungerThirst;
		_toSay = format["z_eat_%1",floor(random 4)];
		player say3D _toSay;
	};
};

player setDamage (damage player - ((_values select 3)/10000));

if (vehicle player == player) then {player playmove "AinvPknlMstpSlayWrflDnon";};

// Special actions

if (_type in ["DayZero_Item_Canteen_Purified","DayZero_Item_Canteen_Boiled","DayZero_Item_Canteen"]) then {
	player addItem "DayZero_Item_Canteen_Empty";
};

if (_type in ["DayZero_Item_Canteen","DayZero_Item_Meat_Raw"]) then {
	[] spawn dz_fnc_infectMe;
};

player removeItem _type;
call dz_fnc_playerMenuLoadInventory;