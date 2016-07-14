class CfgPatches
{
	class Jump {};
};
class Plugins
{
	class Jump
	{
		name = "Ear Plugs";
		desc = "Allows players to jump while sprinting";
		tag = "JMP";
	};
}
class CfgFunctions
{
	class JMP
	{
		class Client 
		{
			file = "Jump\Client";
			isclient = 1;
			class keyDown {};
			class onJump {};
		};
	};
};