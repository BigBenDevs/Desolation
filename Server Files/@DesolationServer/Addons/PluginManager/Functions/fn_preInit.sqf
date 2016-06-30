params["_check","_functions_forclients"];

//--- broadcast client files
{
	publicVariable _x;
} forEach _functions_forclients;

//--- broadcast config settings 
call BASE_fnc_compileCfg; 

//--- compile initialization list of files

BASE_var_INITORDER = call compile ("Config" callExtension "GetInitOrder");

_fnclist = [];
_cfg = configFile >> "Plugins";
{
	_cfgEntry = _cfg >> _x;
	if(isClass _cfgEntry) then {
		_tag = (GetText(_cfgEntry >> "tag")) + "_";
		if(_tag != "_") then {
			{
				if( (_x find _tag) == 0) then {
					if !(_x in _fnclist) then {
						_fnclist pushBack _x;
					};
				};
			} forEach _functions_forclients;
		};
	};
} forEach _order;


BASE_var_FUNCTIONLIST = _fnclist;