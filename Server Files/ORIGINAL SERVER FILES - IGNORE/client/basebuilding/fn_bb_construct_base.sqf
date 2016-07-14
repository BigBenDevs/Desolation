if (isDedicated) exitWith {};scriptName "fn_bb_construct_base";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_bb_construct_base.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_bb_construct_base.sqf"

// Parameters
_blueprint = param[0,"",[""]];

// Exceptions
if (vehicle player != player) exitWith {};
if (_blueprint == "") exitWith {};

// Code
closeDialog 0;
_classname = "";
_rotateDegree = 0;
_modelToWorld = [0,5,0];
{
	if ((_x select 0) == _blueprint) exitWith {
		_classname = _x select 1;
		_rotateDegree = _x select 2;
		_modelToWorld = _x select 3;
	};
} forEach dz_sv_basebuilding_data;
if (_classname == "") exitWith {};

player removeItem _blueprint;

dz_inAction = true;

dz_cl_bb_positionSet = false;
dz_cl_bb_cancel = false;
_isFlat = [];
_tempObj = _classname createVehicleLocal (player modelToWorld _modelToWorld);
_t = true;
while {_t} do {
	_tempObj setVectorDir ([vectorDir player, 180 + _rotateDegree] call BIS_fnc_rotateVector2D);
	_tempPos = (player modelToWorld _modelToWorld);
	_tempPos set [2,0];
	_tempObj setPos _tempPos;

	// Check for flat area
	_isFlat = (player modelToWorld [0,(_modelToWorld select 1),0]) isFlatEmpty [1.3,-1,0.2,2,0,false,_tempObj];
	//_isFlat = player modelToWorld [0,(_modelToWorld select 1),0];
	if (count _isFlat > 0) then {
		if (dz_cl_bb_positionSet OR dz_cl_bb_cancel) then {
			_t = false;
		} else {
			hintSilent parseText "<t color='#A3FB26'>Valid position, press F11 to confirm</t>";
			//cutText ["Valid position, press F12 to confirm", "PLAIN DOWN", 0.00001, true];
			_tempObj hideObject false;
		};
	} else {
		if (dz_cl_bb_cancel OR dz_cl_bb_positionSet) then {
			_t = false;
		} else {
			_tempObj hideObject true;
			hintSilent parseText "<t color='#9E1500'>Invalid position, press F10 to cancel</t>";
			//cutText ["Invalid position, press F11 to cancel", "PLAIN DOWN", 0.00001, true];
		};
	};
};

hintSilent "";

if (dz_cl_bb_cancel) exitWith {
	deleteVehicle _tempObj;
	player addItem _blueprint;
	dz_inAction = false;
};

dz_inAction = false;
[-1,_classname,getPosATL _tempObj,getDir _tempObj,nil,true,1,[getPlayerUID player]] remoteExec ["dz_fnc_initializeBuilding",2];
deleteVehicle _tempObj;
["<t color='#A3FB26'>I have constructed a building</t>"] call dz_fnc_addToFeed;