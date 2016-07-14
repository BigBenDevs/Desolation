class CfgPatches
{
	class EarPlugs {};
};
class Plugins
{
	class EarPlugs
	{
		name = "Ear Plugs";
		desc = "Allows players to use earplugs to lower the sounds in game";
		tag = "EP";
	};
}
class CfgFunctions
{
	class EP
	{
		class Client 
		{
			file = "EarPlugs\Client";
			isclient = 1;
			class keyDown {};
		};
	};
};