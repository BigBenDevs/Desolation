scriptName "fn_openPlayerList";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_openPlayerList.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_openPlayerList.sqf"

// Parameters


// Exceptions
if (!hasInterface) exitWith {};

// Create playerlist dialog in case it is not open yet
if ((findDisplay 1820) isEqualTo displayNull) then {
	createDialog "playerList";
};

// Receive controls from display
_listbox = (findDisplay 1820) displayCtrl 1;
_serverName = (findDisplay 1820) displayCtrl 2;

// Clear listbox
lbClear _listbox;

// Display server name
_serverName ctrlSetText serverName;

// Display player names and ingame name
{
	_listbox lbAdd format["%1 (%2)",name _x, _x getVariable ["profileNameSteam","No Steam Name Available"]];
} forEach AllPlayers;