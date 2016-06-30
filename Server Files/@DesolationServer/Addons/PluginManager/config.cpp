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
	class Base {
		class Events {
			file = "Events";
			//--- KeyDown
			addKeybind {};
			removeKeybind {};
			//--- HanldeDamage
			addHandleDamageEvent {};
			removeHandleDamageEvent {};
			
		};
		class Functions {
			file = "Functions";
		};
	};
};