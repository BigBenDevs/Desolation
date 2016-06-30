/************************ CLIENT FUNCTIONS ************************/

class DayZeroClient
{
	tag = "dz";

	class main
	{
		file = "client";
		class configuration {};
	};

	class functions
	{
		file = "client\functions";
		class log {};
		class initMusic {};
		class displayLocation {};
		class loadInventory {};
		class saveInventory {};
		class getWeapons {};
		class onPauseSave {};
		class keyHandler {};
		class addToFeed {};
		class campfireEffect {};
		class sameArrays {};
		class changeHungerThirst {};
		class getPartName {};
		class repairVehicle {};
		class breakLegs {};
		class SpawnMenu {};
		class CloseSpawnMenu {};
		class CustomizationMenu {};
		class CustomizationChange {};
		class CustomizationMenuClose {};
		class holsterWeapons {};
		class infectMe {};
		class showCharacter {};
		class escMenu {};
		class helpMenu {};
		class antiSideChat {};
		class hitEffect {};
		class lootSpawnerClient {};
		class zombieSpawnerClient {};
		class loadObjects {};
		class fallUnconscious {};
		class tavianaIntroCam {};
		class zombieHitCheck {};
		class createZombieLoot {};
		class pushObject {};
		class rotateVectorBy {};
		class clientHouseOutdatedCheck {};
		class displayRandomRecipe {};
		class setVehicleFuel {};
		class processZombieData {};
		class setting {};
		class openPlayerList {};
		class overwriteMapDialog {};
		class lowestPosition {};
	};

	class items
	{
		file = "client\items";
		class items_Consumeable {};
		class items_CampfireKit {};
		class items_Matches {};
		class items_extinguishFire {};
		class items_BloodBag {};
		class items_Bandage {};
		class items_hatchet {};
		class items_Morphine {};
		class items_BuildTent {};
		class items_JerryCan {};
		class items_GasCooker {};
		class items_Chemlight {};
		class items_gutAnimal {};
		class items_BuildStash {};
		class items_Shovel {};
	};

	class vehicle
	{
		file = "client\vehicle";
		class openVehicleInteraction {};
	};

	class basebuilding
	{
		file = "client\basebuilding";
		class bb_construct_base {};
		class bb_upgrade_base {};
		class bb_openBuildingInventoryAtIndex {};
	};

	class database
	{
		file = "client\database";
		class requestData {};
		class receiveData {};
		class evaluatePlayerData {};
		class savePlayerData {};
	};

	class inventory
	{
		file = "client\inventory";
		class openPlayerMenu {};
		class playerMenuLoadCrafting {};
		class playerMenuLoadInventory {};
		class playerMenuMoveItemToCrafting {};
		class playerMenuMoveItemToInventory {};
		class playerMenuBtnAvailable {};
		class playerMenuUnload {};
		class playerMenuCraftingProducts {};
		class playerMenuProductDetails {};
		class playerMenuCraftItem {};
		class playerMenuUseItem {};
		class playerMenuDrag {};
		class playerMenuDropInv {};
		class playerMenuDropCraft {};
	};
};

/************************ SERVER FUNCTIONS ************************/

class DayZeroServer
{
	tag = "dz";

	class main
	{
		file = "server";
		class serverConfiguration {};
		class map {};
		class map2 {};
	};

	class database
	{
		file = "server\database";
		class requestPlayerData {};
		class asyncCall {};
		class prepareString {};
		class savePlayerToDatabase {};
	};

	class functions
	{
		file = "server\functions";
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
		class removePlayer {};
		class taviana_sectorB_AntiAir {};
		class napf_sectorB_AntiAir {};
		class logToRPT {};
	};

	class loot
	{
		file = "server\loot";
		class createLootPile {};
		class getBuildingPos {};
		class lootSpawner {};
	};
};