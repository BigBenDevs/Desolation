scriptName "fn_removeTent";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_removeTent.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_removeTent.sqf"

// Parameters
_tentID = param[0,-1,[0]];

// Exceptions
if (_tentID == -1) exitWith {};

// Code
//DELETE FROM orders WHERE id_users = 1 AND id_product = 2 LIMIT 1
_query = format["DELETE FROM tents WHERE ID = %1",_tentID];
[_query,1] call dz_fnc_asyncCall;