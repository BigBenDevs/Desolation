class CfgPatches
{
	class AntiSideChat {};
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