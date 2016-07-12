/*
	On Spawn Region Selected
	by Kegan
*/

params["_regionNum"];

0 cutText ["Please wait...","BLACK FADED",2];


_north_region = [];
_markerPos = getMarkerPos "spawn_north";
_size = getMarkerSize "spawn_north";
_minX = (_markerPos select 0) - (_size select 0);
_maxX = (_markerPos select 0) + (_size select 0);
_minY = (_markerPos select 1) - (_size select 1);
_maxY = (_markerPos select 1) + (_size select 1);
_north_region = [[_minX,_minY],[_maxX,_maxY]];

_south_region = [];
_markerPos = getMarkerPos "spawn_south";
_size = getMarkerSize "spawn_south";
_minX = (_markerPos select 0) - (_size select 0);
_maxX = (_markerPos select 0) + (_size select 0);
_minY = (_markerPos select 1) - (_size select 1);
_maxY = (_markerPos select 1) + (_size select 1);
_south_region = [[_minX,_minY],[_maxX,_maxY]];

_east_region = [];
_markerPos = getMarkerPos "spawn_east";
_size = getMarkerSize "spawn_east";
_minX = (_markerPos select 0) - (_size select 0);
_maxX = (_markerPos select 0) + (_size select 0);
_minY = (_markerPos select 1) - (_size select 1);
_maxY = (_markerPos select 1) + (_size select 1);
_east_region = [[_minX,_minY],[_maxX,_maxY]];

_region = switch(_regionNum) do {
	case 0: {_north_region};
	case 1: {_south_region};
	case 2: {_east_region};
};

_isEast = if(_region isEqualTo _east_region) then {true} else {false};
_flip = if(_region isEqualTo _north_region) then {true} else {false};
_spawnPos = [_region,_isEast,_flip] call DS_fnc_findSpawnPosition;
player setVariable ["ReadyToSpawn",true,true];
[player,_spawnPos] remoteExec ["DS_fnc_requestSpawn",2];
0 cutText ["Waiting to spawn...","BLACK FADED",2];