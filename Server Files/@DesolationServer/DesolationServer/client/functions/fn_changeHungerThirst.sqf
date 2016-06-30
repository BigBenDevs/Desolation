if (isDedicated) exitWith {};scriptName "fn_changeHungerThirst";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_changeHungerThirst.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_changeHungerThirst.sqf"

// Parameters
_hungerChange = param[0,0,[0]];
_thirstChange = param[1,0,[0]];

// Exceptions

// Code

// HUNGER
if ((dz_hunger + _hungerChange) < dz_hunger) then {
	if ((dz_hunger + _hungerChange) < 0) then {
		_hungerChange = 0;
		dz_hunger = 0;
	};

	_msg = "";
	_color = "";
	{
		if (((dz_hunger + _hungerChange) <= (_x select 0)) AND ((dz_hunger) >= (_x select 0))) then {
			_msg = _x select 1;
			_color = _x select 2;
		};
	} forEach dz_messages_hunger;
	if (_msg != "") then { ["<t color='"+_color+"'>"+_msg+"</t>"] call dz_fnc_addToFeed; };

} else {
	if ((dz_hunger + _hungerChange) > 100) then {
		_hungerChange = 0;
		dz_hunger = 100;
	};
	_msg = "";
	_color = "";
	{
		if (((dz_hunger + _hungerChange) >= (_x select 0)) AND ((dz_hunger) <= (_x select 0))) then {
			_msg = _x select 1;
			_color = _x select 2;
		};
	} forEach dz_messages_hunger;
	//systemChat ("<t color='" + _color + "'>" + _msg + "</t>");
	if (_msg != "") then { ["<t color='" + _color + "'>" + _msg + "</t>"] call dz_fnc_addToFeed; };
};

// THIRST
if ((dz_thirst + _thirstChange) < dz_thirst) then {
	if ((dz_thirst + _thirstChange) < 0) then {
		_thirstChange = 0;
		dz_thirst = 0;
	};

	_msg = "";
	_color = "";
	{
		if (((dz_thirst + _thirstChange) <= (_x select 0)) AND ((dz_thirst) >= (_x select 0))) then {
			_msg = _x select 1;
			_color = _x select 2;
		};
	} forEach dz_messages_thirst;
	if (_msg != "") then { ["<t color='"+_color+"'>"+_msg+"</t>"] call dz_fnc_addToFeed; };
} else {
	if ((dz_thirst + _thirstChange) > 100) then {
		_thirstChange = 0;
		dz_thirst = 100;
	};
	_msg = "";
	_color = "";
	{
		if (((dz_thirst + _thirstChange) <= (_x select 0)) AND ((dz_thirst) >= (_x select 0))) then {
			_msg = _x select 1;
			_color = _x select 2;
		};
	} forEach dz_messages_thirst;
	if (_msg != "") then { ["<t color='"+_color+"'>"+_msg+"</t>"] call dz_fnc_addToFeed; };
};

dz_hunger = dz_hunger + _hungerChange;
dz_thirst = dz_thirst + _thirstChange;