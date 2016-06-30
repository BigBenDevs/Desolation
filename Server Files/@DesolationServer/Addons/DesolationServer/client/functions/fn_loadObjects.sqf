if (isDedicated) exitWith {};scriptName "fn_loadObjects";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_loadObjects.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_loadObjects.sqf"

// Parameters


// Exceptions


// Code
1010 cutRsc ["loadingObjects","PLAIN"];
_progressBar = uiNamespace getVariable "loadingObjects";

dz_objectCount_Current = 0;
_objectMax = dz_objectCount;

while {(dz_objectCount_Current/_objectMax) < 1} do {
	_progress = (dz_objectCount_Current/_objectMax);
	_progressBar progressSetPosition _progress;
};

1010 cutRsc ["default","PLAIN"];