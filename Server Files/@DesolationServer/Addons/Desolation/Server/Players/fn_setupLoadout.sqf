/*
	Client spawn request handler
*/
params["_unit",["_loadout",[]]];


if(_loadout isEqualTo []) then {
	_unit addMagazine "16Rnd_9x21_Mag";
	_unit addWeapon "hgun_Rook40_F";
	_unit unlinkItem "ItemMap";
	_unit unlinkItem "ItemWatch";
	_unit unlinkItem "ItemCompass";
} else {
	//--- load the chosen loadout
};