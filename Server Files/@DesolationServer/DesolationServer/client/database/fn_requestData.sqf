if (isDedicated) exitWith {};scriptName "fn_requestData";
/*-------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_requestData.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_requestData.sqf"

[player] remoteExec ["dz_fnc_requestPlayerData",2];