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
class CfgFunctions {
	init = "PluginManager\initFunctions.sqf";
	class BASE {
		class Functions {
			file = "Functions";
			class preInit {
				preInit = 1;
			};			
			class compileCfg {};
			class setupEvents {};
			class start {
				preInit = 1;
			};
		};
	};
};