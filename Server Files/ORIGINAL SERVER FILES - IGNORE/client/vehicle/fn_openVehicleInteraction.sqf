if (isDedicated) exitWith {};scriptName "fn_openVehicleInteraction";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_openVehicleInteraction.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_openVehicleInteraction.sqf"

// Parameters
dz_cursorTarget = cursorTarget;

// Exceptions
if (!(dz_cursorTarget isKindOf "LandVehicle") AND !(dz_cursorTarget isKindOf "Air") AND !(dz_cursorTarget isKindOf "Ship")) exitWith {};

// Code
closeDialog 0;
createDialog "interactionMenu";
_display = findDisplay 600;
uiNamespace setVariable ["dz_interactionMenu_btn0",_display displayCtrl 0];
uiNamespace setVariable ["dz_interactionMenu_btn1",_display displayCtrl 10];
uiNamespace setVariable ["dz_interactionMenu_btn2",_display displayCtrl 11];
uiNamespace setVariable ["dz_interactionMenu_btn3",_display displayCtrl 3];
uiNamespace setVariable ["dz_interactionMenu_btn4",_display displayCtrl 4];
uiNamespace setVariable ["dz_interactionMenu_btn5",_display displayCtrl 5];
uiNamespace setVariable ["dz_interactionMenu_btn6",_display displayCtrl 6];
uiNamespace setVariable ["dz_interactionMenu_btn7",_display displayCtrl 7];
uiNamespace setVariable ["dz_interactionMenu_btn8",_display displayCtrl 8];

//[_x] call dz_fnc_saveVehicle;
[dz_cursorTarget] remoteExec ["dz_fnc_saveVehicle",2];

// Get hit points
_hitPoints = [];
{
	if ((_x select 0) == (typeOf dz_cursorTarget)) then {
		_hitPoints = (_x select 1);
	};
} forEach dz_sv_vehicleHitPoints;
if (count _hitPoints == 0) then {
	_hitPoints = dz_sv_vehicleHitPointsDefault;
};

for "_i" from 0 to 8 step 1 do
{
	// Get current Button
	_btn = uiNamespace getVariable format ["dz_interactionMenu_btn%1",_i];

	_hitPoint = [_hitPoints,_i,""] call BIS_FNC_PARAM;
	if (_hitPoint != "" AND _hitPoint != "NOENTRY") then {
		if (dz_cursorTarget getHitPointDamage _hitPoint == 0) then {
			_btn ctrlSetText "This part is fully repaired";
			_btn ctrlEnable false;
		} else {
			_btn ctrlSetText format ["[%2%3] Repair %1",[_hitPoint] call dz_fnc_getPartName,round ((dz_cursorTarget getHitPointDamage _hitPoint)*100),"%"];
		};
	} else {
		_btn ctrlSetText "Option not available";
		_btn ctrlEnable false;
	};
};