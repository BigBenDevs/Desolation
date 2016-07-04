class CfgPatches
{
	class PluginManager
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"A3_Functions_F","A3_Data_F"};
		fileName = "PluginManager.pbo";
		author[]= {"Kegan"};
	};
};
class Plugins
{
	class PluginManager
	{
		name = "Plugin Manager";
		desc = "Master PBO for handling plugins";
		tag = "BASE";
	};
}
class CfgFunctions {
	init = "PluginManager\initFunctions.sqf";
	class BASE 
	{
		class Functions 
		{
			file = "PluginManager\Functions";
			class preInit 
			{
				preInit = 1;
			};			
			class compileCfg {};
			class setupEvents {};
			class start 
			{
				preInit = 1;
			};
		};
		class Client 
		{
			isclient = 1;
			file = "PluginManager\Client";
			class getCfgValue {};
		};
	};
};