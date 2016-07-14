/*
	Automatically swap people talking in side chat into direct chat
*/
_enabled = (["Enabled","ASC"] call BASE_fnc_getCfgValue);
if(toLower(_enabled) != "true") exitWith {};

while{true} do {
	waitUntil{getPlayerChannel player < 3 && getPlayerChannel player > -1};
	setCurrentChannel 5;
};