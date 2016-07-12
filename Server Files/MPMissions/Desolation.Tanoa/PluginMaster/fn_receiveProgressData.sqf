params["_functionList"];

if(BASE_var_TotalFiles == 0) then {
	BASE_var_Files = _functionList;
	BASE_var_TotalFiles = count(_functionList);
	[] spawn BASE_fnc_ReceiveFunctions;
};