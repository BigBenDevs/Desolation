if (isDedicated) exitWith {};scriptName "fn_helpMenu";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_helpMenu.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_helpMenu.sqf"
disableSerialization;

// Parameters
_data = param[0,[],[[]]];

// Exceptions

// Code
if (dialog) then {
	_contentText = "";
	_selectedTopic = (_data select 0) lbText (_data select 1);
	{
		if (_selectedTopic == (_x select 0)) then {
			_contentText = _x select 1;
		};
	} forEach dz_helpTextContent;

	((findDisplay 1030) displayCtrl 2) ctrlSetStructuredText parseText _contentText;
} else {
	createDialog "helpMenu";
	{
		((findDisplay 1030) displayCtrl 1) lbAdd (_x select 0);
	} forEach dz_helpTextContent;

	((findDisplay 1030) displayCtrl 1) lbSetCurSel 0;
};