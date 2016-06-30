private["_rFuncs"];

0 cutText [format["Receiving Functions\n%1/%2",0,BASE_var_TotalFiles],"BLACK"];

_rFuncs = [];
while{count(_rFuncs) < BASE_var_TotalFiles} do {
	{
		if(_x in (allVariables missionNamespace)) then {
			if !(_x in _rFuncs) then {
				_rFuncs pushBack _x;
				0 cutText [format["Receiving Functions\n%1/%2",count(_rFuncs),BASE_var_TotalFiles],"BLACK"];
				BASE_var_LastData = diag_tickTime;
			};
		};
	} forEach BASE_var_Files;
	uiSleep 0.01;
};	
BASE_var_LastData = 0;