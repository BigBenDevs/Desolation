/*
	On Spawn Region Selected
	by Kegan
*/

params["_regionNum"];

0 cutText ["Please wait...","BLACK FADE",0];

_south_region = [[381.798,1406.89],[11352.5,3347.07]];
_east_region = [[11414.8,3196.39], [13963.6,10519.4]];

_region = switch(_regionNum) do {
	case 0: {_south_region};
	case 1: {_east_region};
	case 2: {
		_r = random(1);
		if(_r > 0.5) then {
			_south_region
		} else {
			_east_region
		};
	};
};

_vert = if(_region isEqualTo _east_region) then {true} else {false};
_spawnPos = [_region,_vert] call DS_fnc_findSpawnPosition;
player setVariable ["ReadyToSpawn",true,true];
[player,_spawnPos] remoteExec ["DS_fnc_requestSpawn",2];
[] spawn DS_fnc_waitForSpawnUI;