if (isDedicated) exitWith {};scriptName "fn_onPauseSave";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_onPauseSave.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_onPauseSave.sqf"

[] spawn {
	with missionNamespace do {
		if (isNil "dz_lastManualSave") then {dz_lastManualSave = -999};

		if (diag_tickTime - dz_lastManualSave > 180) then {
			dz_lastManualSave = diag_tickTime;
			[] spawn dz_fnc_savePlayerData;
		};
	};
};

[] spawn {
	with missionNamespace do {
		if (!isServer AND alive player) exitWith {
			(findDisplay 49) displayAddEventHandler ["KeyDown", {
				_ctrl = _this select 0;
				_code = _this select 1;
				_shift = _this select 2;
				_ctrlKey = _this select 3;
				_alt = _this select 4;

				if (_code == 62 AND _alt) then {
					true
				};
			}];
			disableSerialization;
			_toWait = dz_antiCombatLogTimer;
			_abortButton = (findDisplay 49) displayCtrl (104);
			_abortButton ctrlEnable false;
			while {_toWait > 0} do {
				uisleep 1;
				_toWait = _toWait - 1;
				_abortButton ctrlSetText format ["ABORT AVAILABLE IN %1",_toWait];
			};
			_abortButton ctrlSetText "ABORT";
			_abortButton ctrlEnable true;
		};
	};
};