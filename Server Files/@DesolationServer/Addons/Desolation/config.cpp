class CfgPatches
{
	class Desolation {};
};
class Plugins
{
	class Desolation
	{
		name = "Desolation Redux";
		desc = "ArmA 3 Zombie Survival Mod";
		tag = "DS";
	};
}
class CfgFunctions
{
	class DS
	{
		class Client_Spawning
		{
			file = "Desolation\Client\Spawning";
			isclient = 1;
			class findSpawnPosition {};
			class onRegionSelected {};
			class freshSpawn {};
			class finishSpawn {};			
			class showRegionNotification {};			
		};
		class Client_Functions
		{
			file = "Desolation\Client\Functions";
			isclient = 1;
			class infoText {};
		};
		class Client 
		{
			file = "Desolation\Client";
			isclient = 1;
			class initClient {};
		};
		class Server 
		{
			file = "Desolation\Server";
			isserver = 1;
			class requestSpawn {};
			class setupLoadout {};
		};
	};
};