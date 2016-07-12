/*
	finish the spawning system
	By Kegan
*/

params["_unit"];


//--- todo: initialize event handlers on unit
selectPlayer _unit;
1 fadeSound 2;
1 fadeMusic 2;
0 cutText ["","BLACK IN",2];
[] spawn DS_fnc_showRegionNotification;