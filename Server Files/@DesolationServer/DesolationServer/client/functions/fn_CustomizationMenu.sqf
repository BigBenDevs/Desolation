if (isDedicated) exitWith {};scriptName "fn_CustomizationMenu";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_CustomizationMenu.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_CustomizationMenu.sqf"

// Parameters


// Exceptions


// Code
createDialog "customizeCharacter";

// Bring camera to correct location
INTRO_CAM camSetTarget [(player modelToWorld [0.7,0,1]) select 0,(player modelToWorld [0.7,0,1]) select 1,1];
INTRO_CAM camSetPos [(player modelToWorld [0.0,2,1]) select 0,(player modelToWorld [0.0,2,1]) select 1,1];
INTRO_CAM camSetFOV .65;
INTRO_CAM camSetFocus [50, 0];
INTRO_CAM camCommit 1;