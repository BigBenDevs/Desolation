if (isDedicated) exitWith {};scriptName "fn_playerMenuDrag";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_playerMenuDrag.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_playerMenuDrag.sqf"

// Parameters
disableSerialization;
_ctrl = _this select 0;
_data = (_this select 1) select 0;

// Exceptions
if (!dialog) exitWith {};

// Code
_item = _data select 2;
dz_dragDropItem = _item;