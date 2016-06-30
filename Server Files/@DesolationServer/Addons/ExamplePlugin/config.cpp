class CfgPatches
{
	class AntiSideChat {};
};
class Plugins
{
	class AntiSideChat
	{
		name = "Anti SideChat";
		desc = "Prevents people from using VOIP in Global and Side chats";
	};
}
class CfgFunctions
{
	class Plugin
	{
		class AntiSideChat
		{
			tag = "ASC";
			class initClient {file = "fn_initClient.sqf";};
		};
	};
};