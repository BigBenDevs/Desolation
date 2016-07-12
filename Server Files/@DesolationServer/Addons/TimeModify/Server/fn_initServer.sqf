/*
	Time multiplier server init
*/


[] spawn {
	_day = parseNumber (["DayMultiplier","TM"] call BASE_fnc_getCfgValue);
	_night = parseNumber (["NightMultiplier","TM"] call BASE_fnc_getCfgValue);
	_enabled = (["Enabled","TM"] call BASE_fnc_getCfgValue);

	if !(toLower(_enabled) isEqualTo "true") exitWith {};
	
	if(daytime > 19 || daytime < 6) then {
		setTimeMultiplier _night;
	} else {
		setTimeMultiplier _day;
	};
	
	while{true} do {
		waitUntil{uiSleep 30; (daytime > 19 || daytime < 6)};
		setTimeMultiplier _night;
		waitUntil{uiSleep 30; !(daytime > 19 || daytime < 6) };
		setTimeMultiplier _day;
	};
};