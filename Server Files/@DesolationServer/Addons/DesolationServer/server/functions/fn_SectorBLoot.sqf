scriptName "fn_SectorBLoot";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_SectorBLoot.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_SectorBLoot.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};

// Code
_loot_weapons = [
	"hlc_rifle_samr2",
	"hlc_rifle_m14dmr",
	"hlc_rifle_STG58F",
	"hlc_rifle_aek971worn",
	"hlc_rifle_RPK12",
	"hlc_rifle_ak12",
	"hlc_smg_mp5a4",
	"hlc_rifle_vendimus",
	"hlc_rifle_ak74_dirty2",
	"CUP_srifle_M110",
	"CUP_srifle_G22_des",
	"hlc_rifle_SLR",
	"CUP_srifle_M40A3",
	"hlc_rifle_Colt727",
	"hlc_rifle_honeybadger",
	"hlc_rifle_bcmjack",
	"hlc_rifle_FAL5061",
	"hlc_rifle_FAL5061Rail",
	"hlc_rifle_LAR",
	"arifle_SA_m4a1_sopmod",
	"hlc_smg_mp5k_PDW",
	"hlc_muzzle_Tundra",
	"hlc_smg_mp5a3",
	"hlc_rifle_SLR",
	"hlc_rifle_M4",
	"hlc_rifle_Bushmaster300",
	"hlc_rifle_vendimus",
	"CUP_launch_M136"
];

_items = [
	"ItemGPS",
	"ItemMap",
	"ItemGPS",
	"NVGoogles",
	"Binocular"
];

_wh = createVehicle ["Box_East_Support_F", dz_sv_sectorBLootPos, [], 0, "CAN_COLLIDE"];
_wh setPosATL dz_sv_sectorBLootPos;
clearWeaponCargoGlobal _wh;
clearMagazineCargoGlobal _wh;
clearItemCargoGlobal _wh;
clearBackpackCargoGlobal _wh;

{
	if ((random 1) > 0.3) then {
		_wh addWeaponCargoGlobal [_x,1];
		_magazine = ([_x] call dz_fnc_itemDetails select 7) select 0;
		if (!isNil "_magazine") then {
			_wh addMagazineCargoGlobal [_magazine,5];
		};
	};
} forEach _loot_weapons;

{
	_wh addItemCargoGlobal [_x,5];
} forEach _items;

_wh addItemCargoGlobal ["DayZero_Item_Blueprint_SHL1",1];