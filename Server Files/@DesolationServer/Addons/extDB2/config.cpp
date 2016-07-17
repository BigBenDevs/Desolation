class CfgPatches
{
	class extDB2
	{
		projectName="extDB2";
		author="Torndeco";
		version="1.007";
		requiredAddons[] = {};
    units[] = {};
	};
};

class CfgFunctions
{
	class extDB2
	{
		class system
		{
			file = "extDB2\system";
			class preInit {preInit = 1;};
		};
	};
};
