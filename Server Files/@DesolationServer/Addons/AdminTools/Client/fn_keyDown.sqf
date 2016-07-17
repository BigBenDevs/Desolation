/*
	Quick N Dirty
*/
_enabled = (["Enabled","AT"] call BASE_fnc_getCfgValue);
if(toLower(_enabled) != "true") exitWith {};

params["_key"];
_check = player getVariable["ToolsAreOn",false];
if!(_check) then {
	if((_key == (call compile (["Key","AT"] call BASE_fnc_getCfgValue))) && toLower(["Enabled","AT"] call BASE_fnc_getCfgValue) == "true") then {
		diag_log "[DesolationDebug] Quick GodMode and TP";
		player setVariable["ToolsAreOn",true,true];
		player addaction ["God Mode ON", {
				player setVariable ["AdminGod",true,true];
				player allowDamage false;
			}, nil, 0, false, true, "", "!(player getVariable['AdminGod',false])"];
		player addaction ["God Mode OFF", {
				player setVariable ["AdminGod",false,true];
				player allowDamage true;
			}, nil, 0, false, true, "", "(player getVariable['AdminGod',false])"];
			
		player addaction ["Teleport ONCE", {
				onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
			}, nil, 0, false, true, "", "!(player getVariable['AdminTP',false])"];
			
		player addaction ["Add Map", {
				player addItem "ItemMap";
			}, nil, 0, false, true, "", "!(player getVariable['HaveMap',false])"];
	};
};