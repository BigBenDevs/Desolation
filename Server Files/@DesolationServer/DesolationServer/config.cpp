class DefaultEventhandlers;
class CfgPatches
{
	class FINALSTAND
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "DayZeroServer.pbo";
		author[]= {"OPTiX"};
	};
};
class CfgFunctions
{
	class DayZeroServer
	{
		tag = "dz";

		class main
		{
			file = "\DayZeroServer\server";
			class serverConfiguration {};
			class map {};
			class map2 {};
		};

		class database
		{
			file = "\DayZeroServer\server\database";
			class requestPlayerData {};
			class asyncCall {};
			class prepareString {};
			class savePlayerToDatabase {};
		};

		class functions
		{
			file = "\DayZeroServer\server\functions";
			class zombieSpawner {};
			class zombiesInArea {};
			class spawnVehicles {};
			class saveVehicle {};
			class spawnEvents {};
			class createDrop {};
			class createCrash {};
			class initializeTent {};
			class saveTent {};
			class loadTents {};
			class dayNightCycle {};
			class removeTent {};
			class autoRestartMessages {};
			class animals {};
			class createHeliCrash {};
			class player_event_horror {};
			class cleanUp {};
			class roamingAI {};
			class ambientFlyby {};
			class SectorBLoot {};
			class spawnBuildings {};
			class initializeBuilding {};
			class saveBuilding {};
		};

		class loot
		{
			file = "\DayZeroServer\server\loot";
			class createLootPile {};
			class getBuildingPos {};
			class lootSpawner {};
		};
	};
};