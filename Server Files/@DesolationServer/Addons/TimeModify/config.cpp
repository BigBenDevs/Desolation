class CfgPatches
{
	class TimeModify {};
};
class Plugins
{
	class TimeModify
	{
		name = "Time Modify";
		desc = "Modify the speed of the day/night cycle";
		tag = "TM";
	};
}
class CfgFunctions
{
	class TM
	{
		class Server 
		{
			file = "TimeModify\Server";
			isserver = 1;
			class initServer {};
		};
	};
};