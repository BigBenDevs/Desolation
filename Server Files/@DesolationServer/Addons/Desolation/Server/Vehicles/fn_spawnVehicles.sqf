
params["_numVtoSpawn"];

_types = [];
_data = [];

diag_log "Scanning for house data";

_config = configFile >> "CfgVehicleSpawns" >> "Buildings";
for "_i" from 0 to count(_config)-1 do {
	_cfg = _config select _i;
	if(isClass _cfg) then {
		_locations = getArray(_cfg >> "locations");
		_directions = getArray(_cfg >> "directions");
		_type = configName _cfg;
		_types pushBack tolower _type;
		_data pushBack [_locations,_directions,[]];
		
	};
};
diag_log format["found %1 types of houses", count(_types)];

diag_log "Scanning for vehicle data";

_config = configFile >> "CfgVehicleSpawns" >> "Vehicles";
for "_i" from 0 to count(_config)-1 do {
	_cfg = _config select _i;
	if(isClass _cfg) then {
		_houses = getArray(_cfg >> "buildings");
		_type = configName _cfg;
		
		{
			_index = _types find tolower _x;
			if(_index != -1) then {
				_hData = _data select _index;
				_vehicles = _hData select 2;
				_vehicles pushBack _type;
				_hData set[2,_vehicles];
				_data  set[_index,_hData];
			};
		} forEach _houses;
	};
};

diag_log format["Getting all houses on map (%1)",diag_tickTime];
_shuffle = {
	params["_array"];
	private ["_newArray"];
	_newArray = [];
	while{count(_array) > 0} do {
		_newArray pushBack (_array deleteAt floor(random(count(_array))));
	};
	_newArray
};


_bikeLimit = 150; //--- temp, to be loaded from config (TODO)

//--- get all houses on the map that can spawn vehicles in them
_housesOrdered = nearestObjects [[worldsize/2,worldsize/2],_types,worldsize];
_houses = [_housesOrdered] call _shuffle; //--- randomize the order of which houses are spawned (effectively randomizes vehicle spawning locations)
diag_log format["Got all houses (%1)",diag_tickTime];


diag_log format["Spawning vehicles @ %1 houses",count(_houses)];
{
	if(_numVtoSpawn == 0) exitWith {};
	_type = tolower typeof _x;
	_index = _types find _type;
	if(_index != -1) then {
		_hData = _data select _index;
		_locations = _hData select 0;
		_directions = _hData select 1;
		_vehicles = _hData select 2;
		
		if(_bikeLimit == 0) then {_vehicles = _vehicles - ["MMT_Civ"];}; //---vehicles is case sensitive
		
		_lIndex = floor(random(count(_locations))); //--- get location index
		
		_v = _vehicles select floor(random(count(_vehicles))); //--- get vehicle type we are spawning
		if(!isNil {_v}) then {
			
			if(toLower(_v) == "mmt_civ") then {_bikeLimit = _bikeLimit - 1;};
			
			_location = _locations select _lIndex; //--- get offset of the spawn position
			_direction = _directions select _lIndex; //--- get vehicle direction additive
			
			_vDir = (getdir _x) + _direction;
			
			_posagl = _x modelToWorld _location;
			_posasl = AGLtoASL _posagl;
			
			_tv = _v createVehicle _posagl;
			_tv enableSimulationGlobal false;
			_tv setposasl _posasl;
			_tv setdir _vDir;
			_numVtoSpawn = _numVtoSpawn - 1;
		};
		//--- TODO: EnableSimulationGlobal system
	};
} forEach _houses;

diag_log "Done spawning vehicles";