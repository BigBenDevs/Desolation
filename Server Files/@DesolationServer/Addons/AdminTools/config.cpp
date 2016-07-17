class CfgPatches
{
	class AdminTools {};
};
class Plugins
{
	class AdminTools
	{
		name = "Admin Tools";
		desc = "Allows admins to use some tools during development";
		tag = "AT";
	};
}
class CfgFunctions
{
	class AT
	{
		class Client 
		{
			file = "AdminTools\Client";
			isclient = 1;
			class keyDown {};
		};
	};
};