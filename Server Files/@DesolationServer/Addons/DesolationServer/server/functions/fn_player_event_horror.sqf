scriptName "fn_player_event_horror";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_player_event_horror.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_player_event_horror.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};

// Code
while {true} do {
	waitUntil {daytime > 21 OR daytime < 6};
	while {daytime > 21 OR daytime < 6} do {
		uisleep 300;
		if (true) then { // 10/10 check
			_player = AllPlayers call BIS_FNC_SelectRandom;
			_rID = round random 4;
			_pos = _player modelToWorld [0,-100,0];
			[[_pos],{
				playSound3D [format["mpmissions\__CUR_MP.%2\tmp\%1.ogg",round random 4,worldName],player,false,(_this select 0),1.5,1,0];
			}] remoteExec ["BIS_FNC_SPAWN",_player];
		};
	};
};