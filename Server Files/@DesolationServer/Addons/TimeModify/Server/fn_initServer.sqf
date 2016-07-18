/*
	Time multiplier server init
*/


[] spawn {
	_dayMult = parseNumber (["DayMultiplier","TM"] call BASE_fnc_getCfgValue);
	_dayStart = parseNumber (["DayTimeStart","TM"] call BASE_fnc_getCfgValue);
	_nightMult = parseNumber (["NightMultiplier","TM"] call BASE_fnc_getCfgValue);
	_nightStart = parseNumber (["NightTimeStart","TM"] call BASE_fnc_getCfgValue);
	_enabled = (["Enabled","TM"] call BASE_fnc_getCfgValue);

	if !(toLower(_enabled) isEqualTo "true") exitWith {};
	
	if(daytime > _nightStart || daytime < _dayStart) then {
		setTimeMultiplier _nightMult;
	} else {
		setTimeMultiplier _dayMult;
	};
	
	while{true} do {
		waitUntil{uiSleep 30; (daytime > _nightStart || daytime < _dayStart)};
		setTimeMultiplier _nightMult;
		waitUntil{uiSleep 30; !(daytime > _nightStart || daytime < _dayStart) };
		setTimeMultiplier _dayMult;
	};
};