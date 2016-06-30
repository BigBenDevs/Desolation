if (isDedicated) exitWith {};scriptName "fn_tavianaIntroCam";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_tavianaIntroCam.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_tavianaIntroCam.sqf"

// Parameters


// Exceptions
if (!alive player) exitWith {};

// Code

2500 cutRsc ["blackbackground","PLAIN"];

uisleep 3;
playSound "taviana_intro";
uisleep 3;

// INTRO CAMS
INTRO_CAM = "camera" camCreate (getPos player);
showCinemaBorder false;
INTRO_CAM cameraEffect ["Internal", "Back"];
INTRO_CAM camSetFOV .65;
INTRO_CAM camSetFocus [50, 0];

//1
INTRO_CAM camSetTarget [1877.45,17258.3,6];
INTRO_CAM camSetPos [1868.57,17233.3,1];
INTRO_CAM camCommit 0;
INTRO_CAM camPrepareTarget [2113.57,17242.3,0.00146484];
INTRO_CAM camPreparePos [1896.07,17233.5,1];
INTRO_CAM camCommitPrepared 20;

uisleep 0.1;
2500 cutRsc ["blackbackgroundfadein","PLAIN"];
uisleep 10;

2000 cutRsc ["introcamfades","PLAIN"];
uisleep 1;

//2
INTRO_CAM camSetTarget [9937.74,7531.31,0];
INTRO_CAM camSetPos [9923.14,7525.51,1];
INTRO_CAM camCommit 0;
INTRO_CAM camPrepareTarget [9937.74,7531.31,20];
INTRO_CAM camPreparePos [9904.43,7518.32,0.3];
INTRO_CAM camCommitPrepared 20;

uisleep 11.8;
2000 cutRsc ["introcamfades","PLAIN"];
uisleep 1;

//3
INTRO_CAM camSetTarget [14831.8,9928.63,2];
INTRO_CAM camSetPos [14851.4,9927.03,1.18972];
INTRO_CAM camCommit 0;
INTRO_CAM camPrepareTarget [14831.8,9928.63,8];
INTRO_CAM camPreparePos [14840.1,9928.09,1.18972];
INTRO_CAM camCommitPrepared 20;

uisleep 11;
2000 cutRsc ["introcamfades","PLAIN"];
uisleep 1;

//3
INTRO_CAM camSetTarget [11666.4,15975.3,4];
INTRO_CAM camSetPos [11660.4,15986.7,1];
INTRO_CAM camCommit 0;
INTRO_CAM camPrepareTarget [11642.2,15990,2];
INTRO_CAM camPreparePos [11653.9,15994.4,1];
INTRO_CAM camCommitPrepared 20;

uisleep 7.8;
8000 cutRsc ["blackbackground","PLAIN"];
//player setpos [22167,19239.5,0.00143862];
//player setdir 48.6251;
INTRO_CAM camSetTarget [22167,19239.5,0];
INTRO_CAM camSetPos [22167,19239.5,1];
INTRO_CAM camCommit 0;
INTRO_CAM camPrepareTarget [22167,19239.5,7];
INTRO_CAM camPreparePos [22154.2,19228.9,0.1];
INTRO_CAM camCommitPrepared 20;
uisleep 2;
8000 cutRsc ["blackbackgroundfadein","PLAIN"];
uisleep 8;
8000 cutRsc ["blackbackgroundfadeout","PLAIN"];
uisleep 2.8;
8001 cutRsc ["blackbackground","PLAIN"];
uisleep 0.1;
INTRO_CAM cameraEffect ["TERMINATE","BACK"];
camDestroy INTRO_CAM;
[] spawn {
	uisleep 0.4;
	8001 cutRsc ["blackbackgroundfadein","PLAIN"];
};