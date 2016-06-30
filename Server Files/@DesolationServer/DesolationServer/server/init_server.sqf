scriptName "init_server";
/*--------------------------------------------------------------------
    Author: OPTiX (ofpectag: OPX)
    File: init_server.sqf

    <DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "init_server.sqf"

if (!isServer) exitWith {};
diag_log "Setting up server connection to database";
diag_log "THIS IS THE SERVER INIT SPEAKING";

// Connect Server with Database
if("extDB2" callExtension "9:LOCK_STATUS" == "[0]") then {
    diag_log "Building connection";
    DZ_DB_ID = round(random(9999));
    DZ_DB_ID = DZ_DB_ID;
    uiNamespace setVariable ["DZ_DB_ID",DZ_DB_ID];

    //Retrieve extDB version
    _result = "extDB2" callExtension "9:VERSION";

    if(_result == "") exitWith {

    };
    if ((parseNumber _result) < 60) exitWith {
        diag_log "extDB outdated!";
    };

    //Initialize connection to Database
    _result = "extDB2" callExtension format["9:ADD_DATABASE:%1","DZ"];

    if(_result != "[1]") then {
        diag_log "Database Error 2";
        DZ_DB_ID = uiNamespace getVariable "DZ_DB_ID";
        _result = "extDB2" callExtension format
            ["9:ADD_DATABASE_PROTOCOL:%1:SQL_RAW_v2:%2:ADD_QUOTES",
                "DZ",
                (DZ_DB_ID)
            ];
    } else {
        _result = "extDB2" callExtension format
            ["9:ADD_DATABASE_PROTOCOL:%1:SQL_RAW_v2:%2:ADD_QUOTES",
                "DZ",
                (DZ_DB_ID)
            ];

        //_r = "extDB2" callExtension "9:ADD_PROTOCOL:MISC:misc";
        //diag_log ("Misc Protocoll: " + _r);

        if(_result != "[1]") exitWith {
            diag_log "extDB: Error with Database Connection - adding SQL_RAW failed";
        };

        //"extDB2" callExtension "9:LOCK";
        diag_log "extDB: Connected to the Database";
    };
} else {
    diag_log "Error 1";
    //"extDB: Already loaded into!" call base_fnc_log;
    //"extDB: Still Connected to the Database" call base_fnc_log;

    DZ_DB_ID = uiNamespace getVariable "DZ_DB_ID";
};

dz_serverReady = true;
publicVariable "dz_serverReady";

// Run configuration
call dz_fnc_serverConfiguration;
diag_log "dz_fnc_serverConfiguration";

// Enable Zombie Spawner // MOVED TO CLIENT!
//[] spawn dz_fnc_zombieSpawner;
//diag_log "dz_fnc_zombieSpawner";

// Enable Loot Spawner
[] spawn dz_fnc_lootSpawner;
//diag_log "dz_fnc_lootSpawner";

// Spawn buildings
[] spawn dz_fnc_spawnBuildings;
diag_log "dz_fnc_spawnBuildings";

// Enable Vehicle spawner
[] spawn dz_fnc_spawnVehicles;
diag_log "dz_fnc_spawnVehicles";

// Enable Random Events Spawner
[] spawn dz_fnc_spawnEvents;
diag_log "dz_fnc_spawnEvents";

// Enable Fast Day-Night-Cycle
[] spawn dz_fnc_dayNightCycle;

// Reserved slots
[] spawn {
    onPlayerConnected {
        diag_log format ["DEBUGGING %1 %2 %3",_uid,_owner,_jip];
    };
};

// Auto Restart Messages
[] spawn dz_fnc_autoRestartMessages;

// Enable Animal spawner
[] spawn dz_fnc_animals;

// Enable Cleanup
[] spawn dz_fnc_cleanUp;

// Random "spooky" events
//[] spawn dz_fnc_player_event_horror;

// Spawn random AI and some ambient vehicles
switch (worldName) do {
    //--- map doesnt exist anymore
    case "taviana": {
        ["dz_airoampoint_",0,24,10] spawn dz_fnc_roamingAI;
        ["dz_airoampoint_",25,50,15] spawn dz_fnc_roamingAI;
        [] spawn dz_fnc_taviana_sectorB_AntiAir;
        ["Taviana"] spawn dz_fnc_SectorBLoot;
    };
    case "Napf": {
        ["dz_airoampoint_",0,46,25] spawn dz_fnc_roamingAI;
        ["Napf"] spawn dz_fnc_SectorBLoot;
        [] spawn dz_fnc_napf_sectorB_AntiAir;
    };
};

// Check if this script is run in dedicated server environment, if yes stream functions
if ((preprocessFileLineNumbers "\DayZeroServer\server\functions\fn_streamFiles.sqf") != "") then {
    dz_fnc_streamFiles = compileFinal (preprocessFileLineNumbers "\DayZeroServer\server\functions\fn_streamFiles.sqf");
    [] spawn dz_fnc_streamFiles;
    diag_log "dz_fnc_streamFiles";
};

// Tell clients the server is ready
dz_serverReady = true;
publicVariable "dz_serverReady";

// Spawn tents
[] spawn dz_fnc_loadTents;

// Meh
AMB_BirdsFear = 1;

// Some hardcoded stuff
dz_fnc_core_createLootPile = dz_fnc_createLootPile;
dz_fnc_core_getBuildingPos = dz_fnc_getBuildingPos;
publicVariable "dz_fnc_core_createLootPile";
publicVariable "dz_fnc_core_getBuildingPos";