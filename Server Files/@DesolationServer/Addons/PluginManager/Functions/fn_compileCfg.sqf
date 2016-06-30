
_MasterObject = bis_functions_mainscope;

_cfg = configFile >> "Plugins";

for "_i" from 0 to count(_cfg)-1 do {
	_data = call compile ("Config" callExtension ("GetCfgFile:" + configName (_cfg select _i)));
	{
		_x pushBack true;
		_MasterObject setVariable _x;
	} forEach _data;
};