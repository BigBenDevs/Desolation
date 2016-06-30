if (isDedicated) exitWith {};scriptName "fn_items_BloodBag";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_BloodBag.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_BloodBag.sqf"

// Parameters
_ct = cursorTarget;
_usedItem = param[0,"DayZero_Item_Bloodbag",[""]];

// Exceptions
if (_usedItem == "DayZero_Item_Bloodbag_Empty") then {
	_itemsPlayer = (vestItems player) + (backpackITems player) + (uniformItems player);
	if !("DayZero_Item_PainKillers" in _itemsPlayer) exitWith {
		[format ["<t color='#A3FB26'>I need painkillers to fill the bloodbag</t>",name _this]] call dz_fnc_addToFeed;
	};
};

// Code
closeDialog 0;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
dz_inAction = true;
if (_usedItem == "DayZero_Item_Bloodbag_Empty") then {
	_ct spawn {
		[format ["<t color='#A3FB26'>I started taking blood from %1</t>",name _this]] call dz_fnc_addToFeed;
		uisleep 4.5;
		dz_inAction = false;
		_this setDamage ((damage _this) + 0.9);
		player removeItem "DayZero_Item_Bloodbag_Empty";
		["<t color='#A3FB26'>The bloodbag is now filled</t>"] remoteExec ["dz_fnc_addToFeed",_this];
		[format ["<t color='#A3FB26'>Someone took blood from me...</t>",name _this]] call dz_fnc_addToFeed;
		player addItem "DayZero_Item_Bloodbag";
		player removeItem "DayZero_Item_PainKillers";
	};
} else {
	_ct spawn {
		[format ["<t color='#A3FB26'>I started giving blood to %1</t>",name _this]] call dz_fnc_addToFeed;
		uisleep 4.5;
		dz_inAction = false;
		_this setDamage 0;
		player removeItem "DayZero_Item_Bloodbag";
		["<t color='#A3FB26'>I was given a bloodbag</t>"] remoteExec ["dz_fnc_addToFeed",_this];
		[format ["<t color='#A3FB26'>Bloodtransfusion has been finished</t>",name _this]] call dz_fnc_addToFeed;
		player addItem "DayZero_Item_Bloodbag_Empty";
	};
};