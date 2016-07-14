if (isDedicated) exitWith {};scriptName "fn_playerMenuUseItem";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuUseItem.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuUseItem.sqf"
disableSerialization;

_inv = uiNamespace getVariable "playerMenu_MyInventory";

if (!dialog) exitWith {};
if ((lbCurSel _inv) < 0) exitWith {call dz_fnc_playerMenuBtnAvailable};

dz_tooFast = diag_tickTime;

_item = _inv lbData (lbCurSel _inv);

_wasUsed = false;
{
	if ((_x select 0) == _item AND !_wasUsed) then {
		if (call (_x select 2)) then {[_item] spawn (_x select 1);};
		_wasUsed = true;
	};
} forEach dz_useableItems;

if (!_wasUsed) then {
	["<t color='#ffff00'>I cannot use this item</t>"] call dz_fnc_addToFeed;
};