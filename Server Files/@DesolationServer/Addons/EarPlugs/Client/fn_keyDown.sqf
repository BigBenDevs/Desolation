/*
	Ear plugs: on key pressed event
*/
params["_key"];

if(isNil 'EP_var_curVal') then {EP_var_curVal = 0;};

_found = false;
if((_key == (call compile (["Key","EP"] call BASE_fnc_getCfgValue))) && toLower(["Enabled","EP"] call BASE_fnc_getCfgValue) == "true") then {
	_found = true;
	EP_var_curVal = EP_var_curVal + 1;
	if(EP_var_curVal == 4) then {EP_var_curVal = 0;};
	
	switch(EP_var_curVal) do {
		case 0: {
			1 fadeSound 1;
			1 fadeMusic 1;
			1 fadeRadio 1;
			systemchat "Earplugs removed";
		};
		case 1: {
			1 fadeSound .75;
			1 fadeMusic .75;
			1 fadeRadio .75;
			systemchat "Earplugs level 1";
		};
		case 2: {
			1 fadeSound .50;
			1 fadeMusic .50;
			1 fadeRadio .50;
			systemchat "Earplugs level 2";
		};
		case 3: {
			1 fadeSound .25;
			1 fadeMusic .25;
			systemchat "Earplugs level 3";
		};
	};
};
_found;