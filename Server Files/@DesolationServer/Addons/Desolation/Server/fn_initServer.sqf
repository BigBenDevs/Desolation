/*
	Server initialization
*/

_debug = call compile (["DebugMode","DS"] call BASE_fnc_getCfgValue);

[1000] spawn DS_fnc_spawnVehicles; //--- spawn 1000 vehicles (TODO: take into account database vehicles & the cfg entry for vehicle spawn count)

if !(_debug) then {
	{
		_x setMarkerAlpha 0;
	} forEach allMapMarkers;



};


