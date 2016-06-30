_randomMarker = dz_sv_droppoints_prefix + str(floor (random dz_sv_droppoints_amount));
_dropPosition = getMarkerPos _randomMarker;

diag_log format ["Crashing at %1",_dropPosition];

_plane = createVehicle ["CUP_C_C47_CIV",[0,0,0],[],0,"FLY"];
_plane setDir ([_plane,_dropPosition] call BIS_fnc_dirTo);
_groupPlane = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{_x moveInDriver _plane} forEach units _groupPlane;

_plane flyInHeight 350;

_groupPlane addWaypoint [_dropPosition, 0];
_groupPlane addWaypoint [[15360.9,15360.3,0.00143433], 1];

_plane allowDamage false;

[_plane] spawn {
	_flare = objNull;
	while {alive (_this select 0)} do {
		_flare = "F_40mm_Yellow" createVehicle (position (_this select 0));
		_flare attachTo [(_this select 0),[0,0,-5]];
		uisleep 4;
	};
};

waitUntil {(_plane distance2D _dropPosition) < 500};

_plane setDamage 1;

uisleep 90;
[[_plane],{_ret = [[(getPosATL (_this select 0)) select 0,(getPosATL (_this select 0)) select 1,((getPosATL (_this select 0)) select 2)],"SMOKE_BIG"] call BIS_fn_createFireEffect;}] remoteExecCall ["BIS_FNC_SPAWN"];

_box = createVehicle ["CargoNet_01_box_F", position _plane, [], 0, "CAN_COLLIDE"];
_positionNow = getPos _box;
_positionNow set [0,(_positionNow select 0) + 20];
_positionNow set [1,(_positionNow select 1) + 20];
_box setPos _positionNow;

/*_box addItemCargoGlobal ["DayZero_Item_Bandage",5];
_box addItemCargoGlobal ["DayZero_Item_Bloodbag",5];
_box addItemCargoGlobal ["DayZero_Item_HeatPack",5];
_box addItemCargoGlobal ["DayZero_Item_Antibiotic",1];
_box addItemCargoGlobal ["DayZero_Item_Waterpure",5];
_box addItemCargoGlobal ["DayZero_Item_Morphine",5];
_box addItemCargoGlobal ["DayZero_Item_Pasta",20];
_box addItemCargoGlobal ["DayZero_Item_Canteen_Purified",30];
_box addItemCargoGlobal ["ItemMap",1];
_box addItemCargoGlobal ["ItemCompass",1];
_box addWeaponCargoGlobal ["CUP_srifle_CZ550",1];
_box addWeaponCargoGlobal ["CUP_hgun_Glock17",1];*/
_box addItemCargoGlobal ["DayZero_Item_Blueprint_SHL2",1];

// Items
_possibleItems = ["DayZero_Item_Bandage","DayZero_Item_Bloodbag","DayZero_Item_Antibiotic","DayZero_Item_Waterpure","DayZero_Item_Morphine","DayZero_Item_Pasta","DayZero_Item_Canteen_Purified","ItemMap","ItemCompass","NVGoggles"];
for "_i" from 1 to (30 + (round (random 10))) step 1 do
{
    _box addItemCargoGlobal [_possibleItems call BIS_FNC_selectRandom,1];
};

// Items
_possibleItems = ["CUP_hgun_Glock17","hlc_rifle_ak74","hlc_rifle_akm","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_g3ka4","CUP_arifle_CZ805_A2"];
for "_i" from 1 to (1 + (round (random 4))) step 1 do
{
    _box addItemCargoGlobal [_possibleItems call BIS_FNC_selectRandom,1];
};

_weapons = (getWeaponCargo _box) select 0;
// Magazines
{
	_magazine = ([_x] call dz_fnc_itemDetails select 7) select 0;
	_box addMagazineCargoGlobal [_magazine,5];
} forEach _weapons;