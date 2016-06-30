scriptName "fn_autoRestartMessages";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_autoRestartMessages.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_autoRestartMessages.sqf"

// Parameters


// Exceptions
if (!isServer) exitWith {};

// Code
uisleep 3600;
["<t color='#D90C01'>[THIS SERVER WILL RESTART IN 3 HOURS]</t>"] remoteExec ["dz_fnc_addToFeed"];
uisleep 3600;
["<t color='#D90C01'>[THIS SERVER WILL RESTART IN 2 HOURS]</t>"] remoteExec ["dz_fnc_addToFeed"];
uisleep 3600;
["<t color='#D90C01'>[THIS SERVER WILL RESTART IN 1 HOUR]</t>"] remoteExec ["dz_fnc_addToFeed"];
uisleep 3000;
["<t color='#D90C01'>[THIS SERVER WILL RESTART IN 10 MINUTES]</t>"] remoteExec ["dz_fnc_addToFeed"];
uisleep 300;
["<t color='#D90C01'>[THIS SERVER WILL RESTART IN 5 MINUTES]</t>"] remoteExec ["dz_fnc_addToFeed"];
uisleep 240;
["<t color='#D90C01'>[THIS SERVER WILL RESTART NOW, LOG OUT TO PREVENT DATA LOSS]</t>"] remoteExec ["dz_fnc_addToFeed"];

{
   [_x] spawn dz_fnc_saveVehicle;
   uiSleep 0.2;
} forEach (AllMissionObjects "Ship" + AllMissionObjects "Car" + AllMissionObjects "Air");

{
    [_x] spawn dz_fnc_saveTent;
    uiSleep 0.2;
} forEach (AllMissionObjects "DayZero_Object_OldTent" + AllMissionObjects "DayZero_Object_SmallStash");

_allBuildings = [];
{
    _allBuildings = _allBuildings + (AllMissionObjects _x);
} forEach dz_sv_buildings_types;

{
    [_x] spawn dz_fnc_saveBuilding;
    uiSleep 0.2;
} forEach _allBuildings;


[] remoteExec ["dz_fnc_savePlayerData"];
["<t color='#D90C01'>[THIS SERVER WILL RESTART NOW, LOG OUT TO PREVENT DATA LOSS]</t>"] remoteExec ["dz_fnc_addToFeed"];

"randompassword322" serverCommand "#lock";

uiSleep 15;
{
    "randompassword322" serverCommand format ["#kick %1",name _x];
} forEach AllPlayers;
sleep 1;
{
    dz_kickMe = 0;
    publicVariable "dz_kickMe";
} remoteExec ["BIS_FNC_SPAWN"];