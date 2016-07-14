class CfgPatches
{
	class AntiSideChat {};
};
class Plugins
{
	class AntiSideChat
	{
		name = "Anti-SideChat";
		desc = "Forces anyone trying to use VON on side chat into direct chat";
		tag = "ASC";
	};
}
class CfgFunctions
{
	class ASC
	{
		class Client 
		{
			file = "AntiSideChat\Client";
			isclient = 1;
			class initClient {};
		};
	};
};