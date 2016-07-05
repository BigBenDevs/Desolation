
private["_MasterObject","_cfg","_config","_tag","_cfgName","_data"];
_MasterObject = bis_functions_mainscope;

_cfg = configFile >> "Plugins";

for "_i" from 0 to count(_cfg)-1 do {
	_config = (_cfg select _i);
	_tag = GetText(_config >> "tag");
	_cfgName = configName _config;
	_data = call compile ("Config" callExtension ("GetCfgFile:" + _cfgName));
	diag_log format["<PluginManager>: Broadcasting %1 config entry(s) for %2",count(_data),_cfgName];
	{
		_x set[0,(_x select 0) + "_" + _tag];
		_x pushBack true;
		_MasterObject setVariable _x;
	} forEach _data;
};

