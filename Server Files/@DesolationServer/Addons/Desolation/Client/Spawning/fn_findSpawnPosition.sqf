/*
	Desolation Spawn Position Checks
	by Kegan
*/

params["_regionData",["_east",false],["_flip",false]];
private["_spawnPos","_minX","_minY","_maxX","_maxY","_randomX","_randomY","_jDist","_cJDist","_pos","_others"];

_spawnPos = [];

_minX = ((_regionData select 0) select 0);
_minY = ((_regionData select 0) select 1);
_maxX = ((_regionData select 1) select 0);
_maxY = ((_regionData select 1) select 1);

scopeName "exitSpawn";

_multiplier = 1;
if(_flip) then {_multiplier = -1;};

0 cutText ["Finding a safe place to spawn","BLACK FADED",2];
while{true} do {
	_randomX = _minX + random(_maxX - _minX);
	_randomY = _minY + random(_maxY - _minY);

	_jDist = 4;
	_cJDist = false;
	for "_i" from 1 to 2 do {
		while{surfaceIsWater [_randomX,_randomY]} do {
			if(!_east) then {
				_randomY = _randomY + (_jDist*_multiplier);
			} else {
				_randomX = _randomX - (_jDist*_multiplier);
			};
			_cJDist = true;
		};
		if(_cJDist) then {_jDismt = _jDist / 2; _cJDist = false;};
		while{!((getTerrainHeightASL [_randomX,_randomY]) < 1)} do {
			if(!_east) then {
				_randomY = _randomY - (_jDist*_multiplier);
			} else {
				_randomX = _randomX + (_jDist*_multiplier);
			};
			_cJDist = true;
		};
		if(_cJDist) then {_jDist = _jDist / 2; _cJDist = false;};
	};
	
	_pos = [_randomX,_randomY,0];
	
	if !(surfaceIsWater _pos || !((getTerrainHeightASL [_randomX,_randomY]) < 1)) then {
		_others = _pos nearEntities [(typeof player), 200];
		if(count(_others) == 0 && ({typeof _x != ""} count(nearestTerrainObjects [_pos,[],40])) == 0) then {
			_spawnPos = _pos;
			breakTo "exitSpawn";
		};
	};
};

_spawnPos;