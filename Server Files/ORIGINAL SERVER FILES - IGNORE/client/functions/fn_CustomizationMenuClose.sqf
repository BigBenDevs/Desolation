if (isDedicated) exitWith {};scriptName "fn_CustomizationMenuClose";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_CustomizationMenuClose.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_CustomizationMenuClose.sqf"

// Parameters


// Exceptions


// Code
INTRO_CAM camSetTarget (player modelToWorld [1.5,0,1]);
INTRO_CAM camSetPos (player modelToWorld [0,4,1]);
INTRO_CAM camSetFOV .65;
INTRO_CAM camSetFocus [50, 0];
INTRO_CAM camCommit 1;