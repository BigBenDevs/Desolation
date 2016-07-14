scriptName "fn_removePlayer";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_removePlayer.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_removePlayer.sqf"

// Parameters
_player = param[0,objNull,[objNull]];
_mode = param[1,"kick",[""]];

// Exceptions
if (isNull _player) exitWith {};

// Code
"" serverCommand format ["#%2 %1",name _player,_mode];