if (isDedicated) exitWith {};scriptName "fn_showCharacter";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_showCharacter.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_showCharacter.sqf"


_closeSpectator = param[0,false,[false]];

if (vehicle player != player) exitWith {};

if (!_closeSpectator) then {
	if (dialog) exitWith {};
	if (!alive player) exitWith {};
	if (dz_inAction) exitWith {};
	if (dz_isSpectating) exitWith {};

	CHARACTER_CAM = "camera" camCreate (getPos player);
	showCinemaBorder false;
	CHARACTER_CAM cameraEffect ["Internal", "Back"];
	CHARACTER_CAM camSetPos ASLToAGL (eyePos player);
	CHARACTER_CAM camSetTarget [(player modelToWorld [0.7,0,0]) select 0,(player modelToWorld [0.7,0,1]) select 1,(player modelToWorld [0.7,0,1]) select 2];
	if (stance player == "PRONE") then {
		CHARACTER_CAM camSetTarget [(player modelToWorld [0.7,0,1]) select 0,(player modelToWorld [0.7,0,1]) select 1,(player modelToWorld [0.7,0,1]) select 2];
	};
	CHARACTER_CAM camCommit 0;
	CHARACTER_CAM camSetPos [(player modelToWorld [0.0,2,1]) select 0,(player modelToWorld [0.0,2,1]) select 1,(player modelToWorld [0.7,0,1]) select 2];
	CHARACTER_CAM camSetFOV .65;
	CHARACTER_CAM camSetFocus [2, 1];
	CHARACTER_CAM camCommit 1;
	uisleep 0.1;
	showCinemaBorder false;
	{
		if (_x != player) then {
			_x hideObject true;
		};
	} forEach AllPlayers;
	dz_isSpectating = true;
} else {
	[] spawn {
		CHARACTER_CAM camSetPos ASLToAGL (eyePos player);
		CHARACTER_CAM camSetTarget (screenToWorld [0.5,0.5]);
		CHARACTER_CAM camSetFOV .65;
		CHARACTER_CAM camSetFocus [2, 0];
		CHARACTER_CAM camCommit 1;
		uisleep 1;
		CHARACTER_CAM cameraEffect ["TERMINATE","BACK"];
		camDestroy CHARACTER_CAM;
		{
			if (_x != player) then {
				_x hideObject false;
			};
		} forEach AllPlayers;
	};
	dz_isSpectating = false;
};