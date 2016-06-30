_overridePos = param[0,[],[[]]];

_randomMarker = dz_sv_droppoints_prefix + str(floor (random dz_sv_droppoints_amount));
_dropPosition = getMarkerPos _randomMarker;

if (count _overridePos > 0) then {
	_dropPosition = _overridePos;
};

diag_log format ["Crashing at %1",_dropPosition];

_plane = createVehicle ["CUP_B_CH53E_USMC",[4000,0,0],[],0,"FLY"];
_plane setDir ([_plane,_dropPosition] call BIS_fnc_dirTo);
_groupPlane = [[7950, 9667, 0], CIVILIAN, ["O_G_Soldier_SL_F"],[],[],[],[],[],180] call BIS_fnc_spawnGroup;
{_x moveInDriver _plane} forEach units _groupPlane;

_plane flyinHeight 200;
_plane limitSpeed 190;

_groupPlane addWaypoint [_dropPosition, 0];
_groupPlane addWaypoint [[15360.9,15360.3,0.00143433], 1];


waitUntil {(_plane distance2D _dropPosition) < 750};

// Wait for heli to be near the crash point


{deleteVehicle _x} forEach units _groupPlane;
"HelicopterExploSmall" createVehicle getPosATL _plane;

waitUntil {((getPosATL _plane) select 2) < 10};
_pos = getpos _plane;
_plane setPos _pos;
_plane setDamage 1;
uisleep 0.5;
_pos set [2,0];
//deleteVehicle _plane;
//_plane = createVehicle ["xcam_Wreck_UH60",_pos,[],0,"CAN_COLLIDE"];
[[_plane],{_ret = [[(getPosATL (_this select 0)) select 0,(getPosATL (_this select 0)) select 1,0],"FIRE_BIG"] call BIS_fn_createFireEffect;}] remoteExecCall ["BIS_FNC_SPAWN"];

/*_loot = [
	["hlc_rifle_Colt727","W"],
	["hlc_rifle_honeybadger","W"],
	["hlc_rifle_bcmjack","W"],
	["hlc_rifle_FAL5061","W"],
	["hlc_muzzle_snds_fal","I"],
	["hlc_optic_suit","I"],
	["hlc_rifle_FAL5061Rail","W"],
	["hlc_rifle_LAR","W"],
	["arifle_SA_m4a1_sopmod","W"],
	["hlc_smg_mp5k_PDW","W"],
	["hlc_muzzle_Tundra","I"],
	["hlc_smg_mp5a3","W"],
	["hlc_rifle_SLR","W"],
	["DayZero_Item_Antibiotic","I"],
	["ItemGPS","I"],
	["hlc_rifle_M4","W"],
	["hlc_rifle_Bushmaster300","W"],
	["hlc_rifle_vendimus","W"],
	["DayZero_Item_Blueprint_SHL3","I"],
	["DayZero_Item_Blueprint_SHL3","I"]
	//["hlc_muzzle_Agendasix10mm","W"]
];*/

_radius = 15;

_pos = [(((getPos _plane) select 0) - _radius) + (random _radius),(((getPos _plane) select 1) - _radius) + (random _radius),0];
_wh = createVehicle ["Box_East_Support_F", _pos, [], 0, "CAN_COLLIDE"];

clearWeaponCargoGlobal _wh;
clearMagazineCargoGlobal _wh;
clearItemCargoGlobal _wh;
clearBackpackCargoGlobal _wh;

_wh setPos _pos;

_wh addItemCargoGlobal ["DayZero_Item_Blueprint_SHL3",1];

// Items
_possibleItems = ["DayZero_Item_Bandage","DayZero_Item_Bloodbag","DayZero_Item_Antibiotic","DayZero_Item_Waterpure","DayZero_Item_Morphine","DayZero_Item_Pasta","DayZero_Item_Canteen_Purified","ItemMap","ItemCompass","hlc_muzzle_Agendasix10mm","DayZero_Item_Antibiotic","hlc_muzzle_Tundra","hlc_optic_suit","hlc_muzzle_snds_fal","CUP_optic_LeupoldMk4","optic_LRPS","NVGoggles"];
for "_i" from 1 to (5 + (round (random 5))) step 1 do
{
    _wh addItemCargoGlobal [_possibleItems call BIS_FNC_selectRandom,1];
};

// Items
_possibleItems = ["hlc_rifle_Colt727","hlc_rifle_honeybadger","hlc_rifle_bcmjack","hlc_smg_mp5a3","hlc_rifle_FAL5061","hlc_rifle_M4","hlc_rifle_Bushmaster300","hlc_rifle_vendimus","hlc_smg_mp5k_PDW","hlc_rifle_SLR"];
for "_i" from 1 to (1 + (round (random 6))) step 1 do
{
    _wh addItemCargoGlobal [_possibleItems call BIS_FNC_selectRandom,1];
};

//_pos = [(((getPos _plane) select 0) - _radius) + (random _radius),(((getPos _plane) select 1) - _radius) + (random _radius),0];
//_wh = createVehicle ["Box_East_Support_F", _pos, [], 0, "CAN_COLLIDE"];
//clearWeaponCargoGlobal _wh;
//clearMagazineCargoGlobal _wh;
//clearItemCargoGlobal _wh;
//clearBackpackCargoGlobal _wh;

_weapons = (getWeaponCargo _wh) select 0;
// Magazines
{
	_magazine = ([_x] call dz_fnc_itemDetails select 7) select 0;
	_wh addMagazineCargoGlobal [_magazine,10];
} forEach _weapons;