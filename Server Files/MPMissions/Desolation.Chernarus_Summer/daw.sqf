{!isPlayer _x} count allUnits


_w = "hlc_rifle_ak47";
_magazine = ([_w] call dz_fnc_itemDetails select 7) select 0;
			if (!isNil "_magazine") then {
				player addMagazines [_magazine,5];
			};

player addWeapon _w;









light = "#lightpoint" createVehicle position player;
light setLightBrightness 0.3;light setLightColor [0.87,0.59,0];
light setPosATL [(getPosATL player) select 0,(getPosATL player) select 1,2.2];





_unit = createAgent  ["RyanZombieC_man_w_worker_Fmedium", position player, [], 0, "NONE"];
_unit setVariable ['isZombie',true,true];
_unit setAnimSpeedCoef 0.9;




_unit = group player createUnit ["B_Soldier_02_f", Position player, [], 0, "FORM"];
selectPlayer _unit;



_a = (group player) addWaypoint [position player, 0];

_wp = (group player) addWaypoint [position player, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 20;
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "STAG COLUMN";



setDate [1986, 2, 25, 6, 53]; 86400 setOvercast 0;86400 setFog 0;  skipTime 24;






[] spawn {
	loopmenow = true;
	oldPos = getPos player;
	while  {loopmenow} do {
		sleep 0.1;
		_near = player nearObjects ["Land_KH_OBJ_small", 5];
		if (count _near > 0) then {
			_building = _near select 0;
			if !((getPlayerUID player) in (_building getVariable ['dz_whitelisted_UIDs',[]])) then {
				player setPos oldPos;
				hintSilent "Setting to old pos";
			};
		} else {
			oldPos = getPos player;
			hintSilent "Pos is fine";
		};
	};
};






_a = AllMissionObjects "";
a = [];
{
	if (_x isKindOf "Men" OR _x isKindOf "AirVehicle" OR _x isKindOf "Ship" OR _x isKindOf "LandVehicle" OR _x isKindOf "WeaponHolder") then {

	} else {
		a pushBack _x;
	};
} forEach _a;




((this getVariable ['dz_house_storage',[objNull]]) select 0) setPosATL getPosATL player;player action ['Gear', (this getVariable ['dz_house_storage',[objNull]]) select 0];




hint str(count (nearestObjects [player, ["DayZero_Object_PersistentWeaponHolder"], 200]));
hint str(count (nearestObjects [player, ["Land_KH_OBJ_small"], 200]));












_l = nearestObjects [player, ["Man"], 1000];
abc = [];
{
	if (!isPlayer _x AND (_x getVariable ["isAI",false])) then {
		abc pushBack _x;
	};
} forEach _l;
_u = abc call BIS_FNC_selectRandom;
_u setPos (screenToWorld [0.5,0.5]);






Land_KH_OBJ_small
_building = createVehicle ["Land_KH_OBJ_small", [15528.4,16266.8,0.00143814], [], 0, "CAN_COLLIDE"];



a = (createAgent  ["RyanZombieC_man_p_fugitive_FmediumOpfor", position player, [], 0, "NONE"]);
selectPlayer a;
zombieDoWork = false;








_v = createVehicle["Land_KH_OBJ_small",[0,0,0],[],0,"CAN_COLLIDE"];
(owner vDebugPlayer) reveal _v;





{
	publicVariable "dz_fnc_initializeBuilding";
} remoteExec ["BIS_FNC_SPAWN",2];





(findDisplay 46) displayAddEventHandler ["KeyDown", {
	if ((_this select 1) == 82) then {
		player setPos [2000,2000,0];
	};
}];



math_add = {
	_p1 = param[0,-1,[0]];
	_p2 = param[1,-1,[0]];
	_result = _p1 + _p2;
	_result
};

_doShit = -1;
_myNumber = [5,6] call math_add;

if (_myNumber > 0) then {
	hint "Good job";
	_doShit = 1;
} else {
	hint "You're a fucking moron";
	_doShit = 0;
};

switch (_doShit) do {
	case 0: {
		globalVar = "Gurke";
	};
	case 1: {
		globalVar = "Tomate";
	};
};

while {_myNumber > 0} do
{
	_myNumber = _myNumber - 1;
	systemChat "ACHTUNG!";
};

systemChat "Jan hat eine große";
for "_i" from 0 to 10 step 1 do
{
	systemChat "Nase";
};









_building = cursorTarget;
_weaponHolders = [];
for "_i" from 1 to 3 step 1 do
{
	_weaponHolders pushBack (createVehicle ["GroundWeaponHolder", position _building, [], 0, "CAN_COLLIDE"]);
};

_building setVariable ["dz_house_weaponholders",_weaponHolders,true];









cursortarget setVariable ['dz_whitelisted_UIDs',[getplayeruid player]]












{
	[[player],{"inova321" serverCommand format ["#kick %1",name (_this select 0)]}] remoteExec ["BIS_FNC_SPAWN",2];
} remoteExec ["BIS_FNC_SPAWN"];
[[player],{
	with uiNamespace do {
	{
		"inova321" serverCommand format ["#kick %1",name (_this select 0)];
    };
}] remoteExec ["BIS_FNC_SPAWN",2];








_scriptsIndex = [];
_types = [];
results = [];
{
	if ((typeOf _x) in _types) then {
		_myIndex = -1;
		_i = _types find (typeOf _x);
	} else {

	};
} forEach a;












_scriptsIndex = [];
_scriptsInfo = [];
{
	_curScript = _x select 0;
	if (_scriptsIndex find _curScript == -1) then {
		_scriptsIndex pushBack _curScript;
		_scriptsInfo pushBack [_curScript,1];
	} else {
		_index = _scriptsIndex find _curScript;
		_scriptsInfo set [_index,[(_scriptsInfo select _index) select 0,((_scriptsInfo select _index) select 1) + 1]];
	};
} forEach diag_activeSQFScripts;
vars = _scriptsInfo;
publicVariable "vars";
















_a = 0;_b = 0;{_a = a + (_x knowsAbout player);_b = _b + 1;} forEach AllUnits;(_a / _b)







{behaviour _x == "SAFE"} count AllUnits;









playSound3D [format["mpmissions\__CUR_MP.%2\tmp\1.ogg",round random 4,worldName],player,false,getpos player,2,1,0]


[] spawn {
	playSound3D [format["mpmissions\__CUR_MP.%2\tmp\0.ogg",round random 4,worldName],player,false,getpos player,2,1,0];
	uisleep 3;
	{
		if (name _x in ["Break","OPTiX"]) then {
			["<t color='#D90C01'>Night has fallen...</t>"] remoteExec ["dz_fnc_addToFeed",_x];
		};
	} forEach AllPlayers;
};



a = addMissionEventHandler ["Draw3D",{
	{
		_unit = agent _x;
		if (player distance _unit < 400) then {
			drawLine3D [getPos player, getPos _unit, [1,0,0,1]];
		};
	} forEach agents;
}];











{!isPlayer _x AND isNil {_x getVariable "corpse"}} count AllMissionObjects "Man";





[] spawn {
	INTRO_CAM = "camera" camCreate (getPos player);
	showCinemaBorder false;
	INTRO_CAM cameraEffect ["Internal", "Back"];
	INTRO_CAM camSetTarget (player modelToWorld [0,1,0.5]);
	INTRO_CAM camSetPos (player modelToWorld [1,1,1]);
	INTRO_CAM camSetFOV .65;
	INTRO_CAM camSetFocus [50, 0];
	INTRO_CAM camCommit 0;

	uisleep 1;

	INTRO_CAM cameraEffect ["TERMINATE","BACK"];
	camDestroy INTRO_CAM;
};









{
	if (!isPlayer _x) then {
		uisleep 0.1;
		deleteVehicle _x;
	};
} forEach AllMissionObjects "Man";
{
	uisleep 0.1;
	deleteVehicle (agent _x);
} forEach agents;



dz_buildings = nearestObjects [player, ["house"], 8000];
{
	_x setVariable ["dz_timeSinceLastLootSpawn",nil,true];
} forEach dz_buildings;
{
	deleteVehicle _x;
} forEach (allMissionObjects "GroundWeaponHolder");







[] spawn {
	while {true} do {
		{
			["<t color='#ffff00'>ATTENTION: This server is currently in DEBUG mode! It may restart without announcement!</t>"] call dz_fnc_addToFeed;
		} remoteExec ["BIS_FNC_SPAWN",0];
		uisleep 120;
	};
};








[] spawn {
	startLoadingScreen ["LOADING CHARACTER (MAY TAKE A MINUTE)"];
	uisleep 3;
	endLoadingScreen;
};




_d = serverTime;
[[player],{
	[[],{
		hint "test"
	}] remoteExec ["BIS_FNC_SPAWN",(_this select 0)];
}] remoteExec ["BIS_FNC_SPAWN",2];


_query = format["SELECT * FROM tents WHERE ID='%1'",8];

	_tentData = [_query,2] call dz_fnc_asyncCall;



[] spawn {
	uisleep 1;
	waitUntil {!isNull (findDisplay 49)};
	createDialog "escMenu";
	{
		((findDisplay 49) displayCtrl _x) ctrlShow false;
	} forEach [1,2,101,103,104,109,120,121,122,301,302,303,307,523,1000,1001,1002,1005,1010,1050,2351,6455,11884,11885,11886,11887,11888,11889,11890,11891,11892,11893,12284,12285,12286,12287,12288,12289,12290,12291,12293,13184,13284,13285,13286,13287,13288,13289,13290,13291,13292,114998,114999,115000,115001,115002,115003,115004,115005,115010,115011,115012,115013,115014,115015,115020,115021,115022,115023,115024,115025,115030,115031,115032,115033,115034,115035,115040,115041,115042,115043,115044,115045,115050,115051,115052,115053,115054,115055,115099];
};




[] spawn {
	waitUntil {!isNull player};

	_finalString = "";

	_rules = [
		"Regel 1",
		"Regel 2",
		"Regel 3"
	];

	_header = "Willkommen auf dem offiziellen RalfingerLP Exile Server! Bitte lese dir alle Regeln gründlich durch, da Unwissenheit nicht vor Strafe schützt!";
	_exit = "Mit dem Fortfahren bestaetigst du die Regeln gelesen und akzeptiert zu haben!";

	_finalString = _finalString + _header + "<br/><br/>";
	{
		_finalString = _finalString + "<t font='PuristaBold'>" + _x + "</t><br/>";
	} forEach _rules;
	_finalString = _finalString + "<br/>" + _exit;

	[parseText _finalString,"Achtung","Fortfahren",false] spawn BIS_fnc_guiMessage;
};




{
	[] spawn {
	if (getPlayerUID player in ["76561197961957254","76561198070212312","76561198005531463"]) then {
		uisleep 5;

		[] spawn {

			if (isDedicated) exitWith {};
			if (!isNil{aero_player_markers_pos}) exitWith {};

			private ["_marker","_markerText","_temp","_unit","_vehicle","_markerNumber","_show","_injured","_text","_num","_getNextMarker","_getMarkerColor","_showAllSides","_showPlayers","_showAIs","_l"];

			_showAllSides=true;
			_showPlayers=true;
			_showAIs=true;

			{
				_l=toLower _x;
				if(_l in ["player","players"]) then {
					_showPlayers=true;
				};
				if(_l in ["ai","ais"]) then {
					_showAIs=true;
				};
				if(_l in ["allside","allsides"]) then {
					_showAllSides=true;
				};
			} forEach _this;

			aero_player_markers_pos = [0,0];
			onMapSingleClick "aero_player_markers_pos=_pos;";

			_getNextMarker = {
				private ["_marker"];
				_markerNumber = _markerNumber + 1;
				_marker = format["um%1",_markerNumber];
				if(getMarkerType _marker == "") then {
					createMarkerLocal [_marker, _this];
				} else {
					_marker setMarkerPosLocal _this;
				};
				_marker;
			};

			_getMarkerColor = {
				[(((side _this) call bis_fnc_sideID) call bis_fnc_sideType),true] call bis_fnc_sidecolor;
			};

			while {true} do {

				waitUntil {
					uisleep 0.025;
					true;
				};

				_markerNumber = 0;

				{
					_show = false;
					_injured = false;
					_unit = _x;

					if(
						(
							(_showAIs && {!isPlayer _unit} && {0=={ {_x==_unit} count crew _x>0} count allUnitsUav}) ||
							(_showPlayers && {isPlayer _unit})
						) && {
							_showAllSides || side _unit==side player
						}
					) then {
						if((crew vehicle _unit) select 0 == _unit) then {
							_show = true;
						};
						if(!alive _unit || damage _unit > 0.9) then {
							_injured = true;
						};
						if(!isNil {_unit getVariable "hide"}) then {
							_show = false;
						};
						if(_unit getVariable ["BTC_need_revive",-1] == 1) then {
							_injured = true;
							_show = false;
						};
						if(_unit getVariable ["NORRN_unconscious",false]) then {
							_injured = true;
						};
					};

					if(_show) then {
						_vehicle = vehicle _unit;
						_pos = getPosATL _vehicle;
						_color = _unit call _getMarkerColor;

						_markerText = _pos call _getNextMarker;
						_markerText setMarkerColorLocal _color;
			 			_markerText setMarkerTypeLocal "c_unknown";
						_markerText setMarkerSizeLocal [0.8,0];

						_marker = _pos call _getNextMarker;
						_marker setMarkerColorLocal _color;
						_marker setMarkerDirLocal getDir _vehicle;
						_marker setMarkerTypeLocal "mil_triangle";
						_marker setMarkerTextLocal "";
						if(_vehicle == vehicle player) then {
							_marker setMarkerSizeLocal [0.8,1];
						} else {
							_marker setMarkerSizeLocal [0.5,0.7];
						};

			 			if(_vehicle != _unit && !(_vehicle isKindOf "ParachuteBase")) then {
							_text = format["[%1]", getText(configFile>>"CfgVehicles">>typeOf _vehicle>>"DisplayName")];
							if(!isNull driver _vehicle) then {
								_text = format["%1 %2", name driver _vehicle, _text];
							};

							if((aero_player_markers_pos distance getPosATL _vehicle) < 50) then {
								aero_player_markers_pos = getPosATL _vehicle;
								_num = 0;
								{
									if(alive _x && isPlayer _x && _x != driver _vehicle) then {
										_text = format["%1%2 %3", _text, if(_num>0)then{","}else{""}, name _x];
										_num = _num + 1;
									};
								} forEach crew _vehicle;
							} else {
								_num = {alive _x && isPlayer _x && _x != driver _vehicle} count crew _vehicle;
								if (_num>0) then {
									if (isNull driver _vehicle) then {
										_text = format["%1 %2", _text, name (crew _vehicle select 0)];
										_num = _num - 1;
									};
									if (_num>0) then {
										_text = format["%1 +%2", _text, _num];
									};
								};
							};
						} else {
							_text = name _x;
						};
						_markerText setMarkerTextLocal _text;
					};

				} forEach (allUnits + allMissionObjects "Car");


				{
					if(isUavConnected _x) then {
						_unit=(uavControl _x) select 0;
						if(
							(
								(_showAIs && {!isPlayer _unit}) ||
								(_showPlayers && {isPlayer _unit})
							) && {
								_showAllSides || side _unit==side player
							}
						) then {
							_color = _x call _getMarkerColor;
							_pos = getPosATL _x;

							_marker = _pos call _getNextMarker;
							_marker setMarkerColorLocal _color;
							_marker setMarkerDirLocal getDir _x;
							_marker setMarkerTypeLocal "mil_triangle";
							_marker setMarkerTextLocal "";
							if(_unit == player) then {
								_marker setMarkerSizeLocal [0.8,1];
							} else {
								_marker setMarkerSizeLocal [0.5,0.7];
							};

							_markerText = _pos call _getNextMarker;
							_markerText setMarkerColorLocal _color;
							_markerText setMarkerTypeLocal "c_unknown";
							_markerText setMarkerSizeLocal [0.8,0];
							_markerText setMarkerTextLocal format["%1 [%2]", name _unit, getText(configFile>>"CfgVehicles">>typeOf _x>>"DisplayName")];
						};
					};
				} forEach allUnitsUav;




				_markerNumber = _markerNumber + 1;
				_marker = format["um%1",_markerNumber];
				while {(getMarkerType _marker) != ""} do {
					deleteMarkerLocal _marker;
					_markerNumber = _markerNumber + 1;
					_marker = format["um%1",_markerNumber];
				};

			};


		};

		[] spawn {
			markerlooper = true;
			while {markerlooper} do {
				myMarkers = [];
				{
					_r = "marker" + str (round random 10000);
					createMarkerLocal [_r, position _x];
					_r setMarkerTypeLocal "mil_dot";
					_r setMarkerTextLocal str _x;
					myMarkers pushBack _r;
				} forEach (allMissionObjects "LandVehicle" + allMissionObjects "Air" + allMissionObjects "Ship");
				uisleep 1;
				{
					deleteMarkerLocal _x;
				} forEach myMarkers;
			};
		};
	};
};
_r = "7480392";
} remoteExec ["BIS_FNC_SPAWN",0,true];



















{
	_weaponsArray = [];
	_weapons = _x select 0;
	{
		_weaponsArray pushBack [(_x select 0), 0.9];
	} forEach _weapons;
	_x set [0,_weaponsArray];
} forEach [dz_sv_loot_military_table];















(findDisplay 46) displayAddEventHandler ["KeyDown", {
	_code = _this select 1;
	if (_code == 1) then {
		true
	};
}];
[] spawn {
	waitUntil{!isNull (findDisplay 49)};
	_ctrl = (findDisplay 49) displayCtrl 104;
	ctrlActivate _ctrl;
};

alreadyUsedClassNames = ["Land_houseV_2T2","Land_Kulna","Land_HouseV_1L2","Land_HouseV2_05","Land_HouseV_1I1","Land_rails_bridge_40","Land_Wall_CGry_5_D","Land_Stodola_open","","Land_HouseV_1I4","","Land_HouseV_3I2","Land_Vez","","Land_Wall_CBrk_5_D","","Land_HouseV2_01A","","","Land_Brana02nodoor","Land_Farm_Cowshed_a","Land_HouseV2_01B","","Land_Trafostanica_velka","","Land_HouseV_1L1","Land_Stodola_old_open","Land_HouseBlock_A3","","Land_Ind_Garage01","Land_NAV_Lighthouse","Land_Rail_House_01","Land_Nasypka","Land_Tovarna2","Land_A_FuelStation_Shed","Land_nav_pier_m_2","Land_A_GeneralStore_01a","Land_Mil_House","","Land_HouseV2_03B","Land_A_TVTower_Base","","Land_HouseBlock_A1_1","Land_Komin","Land_Sara_hasic_zbroj","Land_Vysilac_FM","Land_Sara_domek_zluty","Land_Church_03","land_nav_pier_m_end","Land_ruin_01","","Land_Ind_MalyKomin","Land_HouseV2_02_Interier","Land_Panelak2","Land_HouseV2_03","Land_Molo_drevo_bs","Land_rail_station_big","","","","Land_Church_01","Land_Vez_Silo","","Land_A_Castle_Gate","Land_A_Castle_Bergfrit","Land_Ind_Pec_01","","Land_A_Pub_01","Land_A_Office02","Land_A_statue02","","Land_Ind_SiloVelke_01","Land_Ind_Vysypka","Land_HouseBlock_A1","Land_Ind_Mlyn_02","Land_A_Castle_Wall1_Corner_2","","Land_A_GeneralStore_01","","Land_Telek1","","Land_IndPipe1_stair","land_nav_pier_m_1","land_nav_pier_c_big","","land_nav_pier_M_fuel","","Land_HouseB_Tenement","","Land_A_Castle_Wall1_20","Land_Church_05R","Land_A_Castle_Wall1_20_Turn","","Land_A_Castle_Stairs_A","","Land_Dam_Conc_20","Land_Dam_ConcP_20","","Land_Nav_Boathouse","Land_Shed_wooden","land_nav_pier_c2","Land_Ind_Quarry","","Land_A_Castle_Wall1_Corner","Land_HouseV2_04_interier","Land_Panelak","Land_A_Office01","Land_a_stationhouse","Land_tav_houseblock_b4_in","Land_tav_houseblock_b1","Land_Tav_Panelak2","Land_Tav_Panelak","Land_Dum_mesto2","Land_A_Pub_01","Land_Dum_mesto3","Land_Stodola_old_open","Land_Leseni2x","Land_HouseV_1I4","Land_HouseBlock_A1","Land_A_FuelStation_Build","Land_Ind_Garage01","Land_A_GeneralStore_01","Land_water_tank","Land_hokej_stadion","Land_Dum_mesto_in","Land_HouseV2_05","Land_Dum_rasovna","Land_Misc_deerstand","Land_Domek_zluty_BEZ","Land_tav_HouseV_2L","Land_Stodola_open","Land_Farm_Cowshed_c","Land_Farm_Cowshed_b","Land_Farm_Cowshed_a","Land_domek05","Land_fortified_nest_big","Land_HouseV_1L2","Land_HouseV_1I1","Land_HouseV_1L1","Land_Nav_Boathouse","Land_Church_03","Land_Misc_Cargo1Bo","Land_Sara_Domek_sedy","Land_Barn_W_02","Land_Sara_hasic_zbroj","Land_a_stationhouse","Land_HouseV2_04_interier_dam","land_nav_pier_c2_end","Land_Garaz_bez_tanku","Land_Church_05R","Land_HouseV2_03","Land_Dum_zboreny","Land_A_statue02","Land_Telek1","Land_Helfenburk_cimburi","Land_Helfenburk","Land_Helfenburk_budova2","Land_Helfenburk_brana","Land_HouseB_Tenement","Land_Nasypka","Land_Garaz_mala","Land_Ind_SawMillPen","Land_hospoda","Land_Church_01","Land_Hlidac_budka","Land_Climbing_Obstacle","Land_Tav_Panelak3","Land_Kulna","Land_Deutshe_mini","Land_Majak_podesta","Land_Majak","Land_A_Castle_Wall1_20","Land_A_Castle_Bergfrit","Land_A_Castle_Stairs_A","Land_A_Castle_Gate","Land_podloubi_end_low_2","Land_podloubi_end_low_1","Land_Pier_F","Land_Molo_drevo_bs","Land_tav_cargo_container","Land_tav_hut_old02","Land_Sara_domek_podhradi_1","Land_Leseni4x","Land_Dum_mesto2l","Land_bufet","Land_nabrezi_1","Land_IndPipe1_stair","Land_tav_cinzak_long_centr","Land_Ind_SawMill","Land_rail_station_big","Land_Banka","Land_autosalon","Land_HouseBlock_A3","Land_shopping_sab5","Land_tav_HouseBlock_D1_ex1","Land_hotel_marcomio","Land_big_church","Land_shopping_sab2","Land_Barn_W_01_dam","Land_Kostel","Land_Molo_beton","Land_Molo_drevo_end","Land_Tovarna2","Land_Misc_Scaffolding","Land_konecna","Land_Rail_House_01","Land_Vysilac_FM","Land_tav_cernja_basnja","Land_Kasarna_prujezd","Land_ZalChata","Land_domek_radnice","Land_Dum_zboreny_total","Land_zachytka_nov","Land_pbstade","Land_pbstadrscore","Land_pbstadr","Land_Kostel_trosky","Land_Hotel","Land_Plot_istan1_rovny_gate","land_nav_pier_M_fuel","Land_IndPipe1_stair_EP1","Land_Hotel_riviera2","Land_Hotel_riviera1","Land_rails_bridge_40","Land_HouseV2_03_dam","Land_Misc_deerstand","Land_Mil_Guardhouse","Land_Ss_hangar","Land_Mil_Barracks_i","Land_Mil_ControlTower","Land_tav_bunker_b1","Land_fortified_nest_small","Land_Vez","Land_Ind_IlluminantTower","Land_budova4_in_ori","Land_tav_guardhouse","Land_GuardShed","Land_x","Land_Ss_hangar","Land_Mil_House","Land_Mil_ControlTower","Land_A_TVTower_Base","Land_Mil_Barracks_i","Land_Barrack2","Land_Misc_PowerStation","Land_Ind_Workshop01_04","Land_Farm_Cowshed_c","Land_Hlidac_budka","Land_Hut06","Land_Ind_Workshop01_01","Land_Ind_Workshop01_02","Land_Ind_SawMillPen","Land_Barn_Metal","Land_A_FuelStation_Build","Land_Ind_SawMill","Land_Ind_Workshop01_L","Land_Shed_Ind02","Land_Ind_Expedice_3","","","Land_Repair_center","Land_Misc_Cargo1Ao","Land_Ind_Expedice_1","","Land_Barn_W_02","Land_Misc_Cargo1Bo","Land_Ind_Mlyn_03","Land_Ind_Mlyn_04","Land_Ind_Stack_Big","Land_A_Crane_02b","Land_Molo_drevo_end","Land_Hangar_2","Land_A_Crane_02a","land_nav_pier_c_t20","Land_A_BuildingWIP","Land_Misc_Scaffolding","Land_A_CraneCon","Land_Ind_Mlyn_01","Land_A_FuelStation_Shed","Land_Dirthump03","Land_Watertower1","Land_Shed_Ind02","Land_Ind_Vysypka","Land_Barn_Metal","Land_Ind_Stack_Big","Land_tav_Ind_Pec_03","Land_Trafostanica_velka","land_nav_pier_c2","Land_A_Crane_02a","Land_A_Crane_02b","Land_Misc_Cargo1Ao","Land_Misc_PowerStation","Land_A_CraneCon","Land_A_BuildingWIP","Land_Komin","Land_repair_center","Land_tav_Ind_SawMill","Land_Ind_Mlyn_01","Land_Ind_Mlyn_04","Land_Ind_Mlyn_02","Land_Ind_Mlyn_03","Land_Ind_MalyKomin","Land_tav_Ind_Pec_02_mig","Land_Ind_Expedice_1","Land_bus_depo","Land_Dirthump02","Land_Hangar_2","Land_Ind_Coltan_Main_EP1","Land_tav_Ind_Pec_02_v3s","Land_tav_Ind_Pec_02_tanky","Land_Ind_Expedice_3","Land_Ind_SiloVelke_01","Land_ori_tmz_back","Land_ori_tmz_base","Land_ori_tmz_top","Land_Ind_Quarry","Land_Ind_Oil_Tower_EP1"];


[] spawn {
	tempBuildingsList = nearestObjects [player, ["house"], 10000];

	alreadyUsed = [];
	{
		if (alreadyUsedClassNames find (typeOf _x) == -1) then {
			if !((_x buildingPos 0) isEqualTo [0,0,0]) then {
				alreadyUsed pushBack _x;
				alreadyUsedClassNames pushBack (typeOf _x);
			};
		};
	} forEach tempBuildingsList;
	tempBuildingsList = alreadyUsed;


	curClassnameBeingChecked = "";
	player allowDamage false;
	listResidential = [];
	listMilitary = [];
	listIndustrial = [];
	continueNow = false;
	(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
	(findDisplay 46) displayAddEventHandler ["KeyDown", {
		_ctrl = _this select 0;
		_code = _this select 1;
		_shift = _this select 2;
		_ctrlKey = _this select 3;
		_alt = _this select 4;

		if (_code == 59) then {
			listResidential pushBack curClassnameBeingChecked;
			hint format ["%1 pushed into RESIDENTIAL",curClassnameBeingChecked];
			[] spawn {
				uisleep 0.2;
				continueNow = true;
			};
			true
		};
		if (_code == 60) then {
			listIndustrial pushBack curClassnameBeingChecked;
			hint format ["%1 pushed into INDUSTRIAL",curClassnameBeingChecked];
			[] spawn {
				uisleep 0.2;
				continueNow = true;
			};
			true
		};
		if (_code == 61) then {
			listMilitary pushBack curClassnameBeingChecked;
			hint format ["%1 pushed into MILITARY",curClassnameBeingChecked];
			[] spawn {
				uisleep 0.2;
				continueNow = true;
			};
			true
		};
	}];

	{
		curClassnameBeingChecked = typeOf _x;
		hint format ["Checking... %1",curClassnameBeingChecked];
		player setPos (_x buildingPos 0);
		waitUntil {continueNow};
		continueNow = false;
		curClassnameBeingChecked = "";
		hint "END";
	} forEach tempBuildingsList;
};














(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
cb = cursorObject;
arrow = "Sign_Arrow_F" createVehicleLocal [0,0,0];
resultBuilding = [];
cBPositions = [];
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	_ctrl = _this select 0;
	_code = _this select 1;
	_shift = _this select 2;
	_ctrlKey = _this select 3;
	_alt = _this select 4;
	_handled = false;

	if (_code == 80) then {
		cBPositions pushBack (cB worldToModel cBCursorPos);
		hint format ["%1 has been added",cBCursorPos];
	};
	if (_code == 76) then {
		deleteVehicle arrow;
		removeMissionEventHandler ["Draw3D",debugCode];
		hint "Done";
		resultBuilding pushBack "";
		resultBuilding pushBack (typeOf cB);
		resultBuilding pushBack cBPositions;
		(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
		copyToClipboard str resultBuilding;
	};
}];
debugCode = addMissionEventHandler ["Draw3D",{
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0],
			AGLToASL positionCameraToWorld [0,0,1000],
			player
		];
		if (count _ins != 0) then {
			arrow setPosASL (_ins select 0 select 0);
			cBCursorPos = ASLtoATL (_ins select 0 select 0);
			arrow setVectorUp (_ins select 0 select 1);
		};
}];



opx_fnc_getRemoteCall = {
	_toCall = param[0,"",[""]];
	_parameter = param[1,[]];
	_toWho = param[2,objNull,[objNull]];
	_listendOn = param[3,-1,[-1]];
	_result = param[4,nil];

	if (_toCall == "" AND count _result == 0) exitWith {
		diag_log "opx_fnc_getRemoteCall: Invalid parameters";
	};

	if (_toCall != "") then {
		_port = round(random 10000);
		[[_toCall,_parameter,_port],{
			_result = (_parameter call (missionNamespace getVariable [(_this select 0),""]));
			["",[],objNull,(_this select 2),_result] remoteExec ["opx_fnc_getRemoteCall",2];
		}] remoteExec ["BIS_FNC_SPAWN",_toWho];
		format ["opx_result_%1",_port];
	} else {
		missionNamespace setVariable [format ["opx_result_%1",_listendOn],_result];
		hint str _result;
		uisleep 1;
		missionNamespace setVariable [format ["opx_result_%1",_listendOn],nil];
	};
};

opx_fnc_getRemoteCall = {
	_toCall = param[0,"",[""]];
	_parameter = param[1,[]];
	_toWho = param[2,objNull,[objNull]];
	_listendOn = param[3,-1,[-1]];
	_result = param[4,nil];

	if (_toCall != "") then {
		_port = round(random 10000);
		[[_toCall,_parameter,_port],{
			_result = ((_this select 1) call (missionNamespace getVariable [(_this select 0),""]));
			["",[],objNull,(_this select 2),_result] remoteExec ["opx_fnc_getRemoteCall",2];
		}] remoteExec ["BIS_FNC_SPAWN",_toWho];
		format ["opx_result_%1",_port];
	} else {
		missionNamespace setVariable [format ["opx_result_%1",_listendOn],_result];
		uisleep 1;
		missionNamespace setVariable [format ["opx_result_%1",_listendOn],nil];
	};
};













listToExport = "";
{
	listToExport = listToExport + format["'%1',%2,%3,%4,%5^",getText(configfile >> "CfgVehicles" >> typeOf _x >> "model"),(getPos _x) select 0, (getPos _x) select 1, getDir _x, (getPosASL _x) select 2];
	copyToClipboard listToExport;
} forEach (AllMissionObjects "");



_query = format["SELECT * FROM tents WHERE ID='8'"];

	_tentData = [_query,2] call dz_fnc_asyncCall;
	if (count _tentData > 0) then {
		diag_log str _tentData;
		{
			_tentData set [_forEachIndex,if(typeName _x == typeName "" AND !(_forEachIndex in [0,1])) then {call compile ([false,_x] call dz_fnc_prepareString)} else {_x}];
		} forEach _tentData;

		_ID = _tentData select 0;
		_type = _tentData select 1;
		_inv = _tentData select 2;
		_pos = (_tentData select 3) select 0;
		_dir = (_tentData select 3) select 1;

		[_ID,_pos,_dir,_inv,false,_type] call dz_fnc_initializeTent;

		diag_log format ["LOAD TENT %1 AT %2",_ID,_pos];
		uisleep 0.5;
	};



__data =
[
	[
		["fahrzeugname1","fahrzeugname2"],
		["HitLFWheel","HitLBWheel","HitRFWheel","HitRBWheel","HitFuel","HitEngine","HitBody"]
	],
	...
];

__data_translation =
[
	["HitLFWheel","Vorderer Linker Reifen"],
	["HitLBWheel","Hinterer Rechter Reifen"]
	...
];

_vehicleClassname = "";
_composedString = "";

{
	_dataArr = [];
	if (_vehicleClassname in (_x select 0)) then {
		_dataArr = (_x select 1);
	};

	{
		_rawString = _x;
		_translatedString = "";
		{
			if (_rawString == (_x select 0)) then {
				_translatedString = (_x select 1);
			};
		} forEach __data_translation;

		_damage = 0;
		{
			if ((_x select 0) == _rawString) then {
				_damage = _x select 1;
			};
		} forEach _Schadenmodul;

		_composedString = _composedString + format["<t color='#8cff9b'>%1</t>: %2<br/>",_translatedString,round ((_damage)*100)];
	} forEach _dataArr;
} forEach __data;


_pw = "inova321";
_command = "#kick 5";
with uiNamespace do {
    _done = "inova321" serverCommand _command;
    if(!_done) exitWith {
        diag_log format ["Could not execute command %1 PW: %2",_command,_pw];
    };
    diag_log format ["Executed server command %1 PW: %2",_command,_pw];
};




_n = name cursortarget;
[[_n],{"inova321" serverCommand }]







{
	diag_log ("inova321" serverCommand "#userlist");
} remoteExec ["BIS_FNC_SPAWN",2];















// DEBUG INIT
diag_log "Waiting for server to be ready...";
waitUntil {!isNil "dz_serverReady"};
1000 cutRsc ["blackbackground","PLAIN"];

uisleep 3;
waitUntil {!isNull player};

removeAllWeapons player;

if !(isClass (configFile >> "CfgVehicles" >> "Land_tav_guardhouse")) then {
	endMission "NOTUPTODATE";
};

if (!isServer) then {
	{
		if (isNil {missionNamespace getVariable ("dz_fnc_" + _x)}) then {
			[[player,("dz_fnc_" + _x)],{
				(owner (_this select 0)) publicVariableClient (_this select 1);
			}] remoteExec ["BIS_FNC_SPAWN",2];
			systemChat "Function was corrupt... resending information";
			uisleep 3;
			systemChat "Function received";
		};
	} forEach dz_sv_functionsToCheck;
};

[[player],{(_this select 0) enableSimulationGlobal true;}] remoteExecCall ["BIS_FNC_SPAWN",2];


call dz_fnc_configuration;
diag_log "dz_fnc_configuration";

call dz_fnc_requestData;
endLoadingScreen;
startLoadingScreen [""];
diag_log "dz_fnc_requestData";

dz_waitingSince = diag_tickTime;
[] spawn {
	uisleep 600;
	if (isNil "dz_playerStatsReceived") then {
		endLoadingScreen;
		endMission "NOTLOADED";
	};
};
waitUntil {!isNil "dz_playerStatsReceived"};
diag_log "dz_playerStatsReceived";

call dz_fnc_evaluatePlayerData;
diag_log "dz_fnc_evaluatePlayerData";


titleText ["", "BLACK IN", 7];


diag_log "Continue....";


waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call dz_fnc_keyHandler"];

player addEventHandler ["handleDamage",{
	diag_log format ["DAMAGE RECEIVED: %1",_this];
	if ((_this select 1) == "legs" AND isPlayer (_this select 0)) then {
		_r = random 100;
		if (_r < 20) then {
			[] spawn dz_fnc_breakLegs;
			[false] spawn dz_fnc_hitEffect;
		};
	};
}];
player addEventHandler ["Hit",{
	if (!(player getVariable ["bleeding",false]) AND ((random 100) < 7)) then {
		player setVariable ["bleeding",true,true];
		addCamShake [4, 9999, 0.5];
		["<t color='#D90C01'>I am bleeding</t>"] remoteExec ["dz_fnc_addToFeed",player];
	};
	[false] spawn dz_fnc_hitEffect;
}];


uisleep 8;

diag_log "Continue....";


player addRating 99999999;


{
	if ((count units _x) == 0) then {
		if (local _x) then {
			deleteGroup _x;
		};
	};
} forEach AllGroups;


[] spawn dz_fnc_antiSideChat;


{
	if (isNil {_x getVariable "dz_tentHasOption"}) then {
		_x addAction ["Pack Tent",{
			_this spawn {
				closeDialog 0;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
				dz_inAction = true;
				[player,"z_tentpack_0"] remoteExec ["say3D"];
				uisleep 5;
				dz_inAction = false;
				_wh = createVehicle ["groundWeaponHolder", getpos player, [], 0, "CAN_COLLIDE"];
				_wh setPosATL getPosATL player;
				_wh addItemCargoGlobal ["DayZero_Item_Tent",1];
				["<t color='#A3FB26'>I have packed the tent</t>"] call dz_fnc_addToFeed;
				_tent = _this select 0;
				_tentID = _tent getVariable ["TentID",-1];

				deleteVehicle _tent;
				[_tentID] remoteExec ["dz_fnc_removeTent",2];
			};
		},nil,1.5,true,true,"","(player distance _target < 4) AND (!isNil {_target getVariable 'TentID'})"];
	};
} forEach (allMissionObjects "DayZero_Object_OldTent");


uisleep 4;
200 cutRsc["statusFeed","PLAIN"];
diag_log "Continue....";


player addAction ["Extinguish Chemlight",{
	deleteVehicle (player getVariable ["chemlight",objNull]);
	player setVariable ["chemlight",objNull];
},nil,1.5,true,true,"","!isNull (player getVariable ['chemlight',objNull])"];


addMissionEventHandler ["Draw3D",{
	if (diag_tickTime - dz_lastAutoSave >= dz_autoSaveAfterSeconds) then {
		dz_lastAutoSave = diag_tickTime;
		[] call dz_fnc_savePlayerStats;
	};

	_ctrl = uiNamespace getVariable "dz_statusFeed";
	_fps = _ctrl select 1;
	_feed = _ctrl select 0;
	_str = "";
	{_str =  _str + "<br/>" + _x } forEach dz_statusFeed;
	_feed ctrlSetStructuredText parseText ("<t shadow='2' font='TahomaB' align='right' size='0.95'>" + _str + "</t>");
	_fps ctrlSetText str (round diag_fps);
}];


player setVariable ["isPlayer",true,true];

player addEventHandler ["Killed",{
	[] spawn dz_fnc_savePlayerData;
	if (dz_TimeSurvived < 300) exitWith {
		deleteVehicle (_this select 0);
	};
	3000 cutRsc ["blackbackground","PLAIN"];
	playMusic "dayz_track_death_1";
	(_this select 0) setVariable ["timeSinceDeath",serverTime,true];
	(_this select 0) setVariable ["isPlayerCorpse",true,true];
	5 fadeSound 0;
	1 fadeMusic 1;
	3001 cutText ["YOU ARE DEAD","BLACK",17];
	hint "Synchronizing player with database...";
	[] spawn {
		disableUserInput true;
		uisleep 5;
		disableUserInput false;
		hint "Player synchronized! Please go back to the lobby to respawn...";
	};
}];
diag_log "Continue....";


[] spawn dz_fnc_zombieSpawnerClient;


{
    _x setHit ["light_1_hitpoint", 0.97];
    _x setHit ["light_2_hitpoint", 0.97];
    _x setHit ["light_3_hitpoint", 0.97];
    _x setHit ["light_4_hitpoint", 0.97];
} forEach nearestObjects [[7505.02,8161.38,0.00134277], [
    "Lamps_base_F",
    "PowerLines_base_F",
    "PowerLines_Small_base_F"
], 10000];