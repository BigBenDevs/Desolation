if (isDedicated) exitWith {};scriptName "fn_items_gutAnimal";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_items_gutAnimal.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_items_gutAnimal.sqf"

// Parameters


// Exceptions
if (isDedicated) exitWith {};

// Code

// No further checks required as useitem check already checked for existing animals in the area
player say3D "z_bandage_0";
closeDialog 0;
_nO = (nearestObjects [player, ["Cock_random_F","Hen_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"], 5]);
_ct = [_nO,0,objNull] call BIS_FNC_PARAM;

if (isNull _ct) exitWith {};

player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
dz_inAction = true;
_ct spawn {
	uisleep 4.5;
	dz_inAction = false;
	deleteVehicle _this;
	["<t color='#A3FB26'>There is some meat on the ground</t>"] call dz_fnc_addToFeed;
	_wh = createVehicle ["groundWeaponHolder", getpos player, [], 0, "CAN_COLLIDE"];
	_wh setPosATL getPosATL player;
	_wh addItemCargoGlobal ["DayZero_Item_Meat_Raw",2];
	for "_i" from 0 to (round random 2) step 1 do
	{
		_wh addItemCargoGlobal ["DayZero_Item_Cloth",1];
	};
};