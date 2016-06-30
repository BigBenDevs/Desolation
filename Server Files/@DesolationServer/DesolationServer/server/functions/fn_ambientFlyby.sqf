scriptName "fn_ambientFlyby";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_ambientFlyby.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_ambientFlyby.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};

// Code
while {true} do {
	uisleep 1800;
	_randomMarker = dz_sv_droppoints_prefix + str(floor (random dz_sv_droppoints_amount));
	_dropPosition = getMarkerPos _randomMarker;

	//"CUP_B_MV22_USMC"
	[[0,0,0],[25600.4,21498.3,-2.15891],100,"FULL","CUP_B_UH60M_US",EAST] spawn BIS_FNC_ambientFlyby;
};