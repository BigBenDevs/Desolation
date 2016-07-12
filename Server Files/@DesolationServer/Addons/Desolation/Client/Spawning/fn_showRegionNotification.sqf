/*
	show region info for fresh spawns
	by Kegan
*/
uiSleep 2; //--- wait for blackscreen to exit
_locationChecks = ["NameVillage","NameCity","NameCityCapital"];
_distance = 9999999;
_location = locationNull;
{
	_loc = nearestLocation [getpos player,_x];
	
	if(!isNull _loc) then {
		_dist = (getpos player) distance _loc;
		if(_dist < _distance) then {
			_location = _loc;
			_distance = _dist;
		};
	};
} forEach _locationChecks;

if(!isNull _location) then {
	_name = text _location;
	[profileName , _name, str(date select 1) + "/" + str(date select 2) + "/" + str(date select 0)] spawn DS_fnc_infoText;
};

