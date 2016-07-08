/*
	Example AntiSideChat Plugin
	By Kegan
*/

while{player getVariable ["ReadyToSpawn",false]} do {
	0 cutText ["Waiting for the server...","BLACK FADE",0];
	uiSleep 0.5;
};
1 fadeSound 1;
1 fadeMusic 1;
0 cutText ["","BLACK IN",1];