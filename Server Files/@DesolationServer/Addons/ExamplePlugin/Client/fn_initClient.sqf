/*
	Example AntiSideChat Plugin
	By Kegan
*/

if !(["Enabled","ASC"] call BASE_fnc_getCfgValue) exitWith {};

while{true} do {
	waitUntil{getPlayerChannel player < 3 && getPlayerChannel player > -1};
	setCurrentChannel 5;
};