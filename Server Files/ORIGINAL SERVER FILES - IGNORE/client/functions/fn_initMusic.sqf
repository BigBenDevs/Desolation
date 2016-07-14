if (isDedicated) exitWith {};scriptName "fn_initMusic";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_initMusic.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_initMusic.sqf"

// Parameters


// Exceptions

// Code
addMusicEventHandler ["MusicStop", {
	_index = round(random 7);

    if (_index > 2) then {
        playMusic "z_suspense_empty";
    } else {
        playMusic format ["z_suspense_%1",_index];
    };
}];