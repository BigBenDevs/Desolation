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
		tag = "ASC";
	};
}
class CfgFunctions
{
	class ASC
	{
		class Client
		{
			isclient = 1;
			class initClient {};
		};
		class Server 
		{
			isserver = 1;
		};
	};
};