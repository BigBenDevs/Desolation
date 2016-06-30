// "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)"

class RscTitles
{
	class statusFeed
	{
		idd = -1;
		name= "statusFeed";
		movingEnable = true;
		enableSimulation = true;
		fadeout=0;
		fadein=0;
		duration = 99999999999;
		onLoad = "uiNamespace setVariable ['dz_statusFeed',[(_this select 0) displayCtrl 1,(_this select 0) displayCtrl 2,(_this select 0) displayCtrl 3,(_this select 0) displayCtrl 4,(_this select 0) displayCtrl 5,(_this select 0) displayCtrl 6]]";

		class controlsBackground {};

		class controls {
			class RscStructuredText_1100: RscStructuredText
			{
				idc = 1;
				x = 0.69083 * safezoneW + safezoneX;
				y = 0.807891 * safezoneH + safezoneY;
				w = 0.294297 * safezoneW;
				h = 0.186934 * safezoneH;
			};

			class RscText_3131: RscText
			{
				idc = 2;
				text = "999"; //--- ToDo: Localize;
				x = 0.000874975 * safezoneW + safezoneX;
				y = 0.9752 * safezoneH + safezoneY;
				w = 0.0309375 * safezoneW;
				h = 0.022 * safezoneH;
				shadow = 2;
				colorText[] = {1,1,1,0.3};
			};

			class DevBuildText: RscText
			{
				idc = 3;
				text = "Development Build 00.56.05"; //--- ToDo: Localize;
				x = 0.0101562 * safezoneW + safezoneX;
				y = 0.016 * safezoneH + safezoneY;
				w = 0.139219 * safezoneW;
				h = 0.022 * safezoneH;
				shadow = 0;
				font = "Roboto";
				colorText[] = {1,1,1,0.7};
			};

			class zeroing: RscStructuredText
			{
				idc = 4;
				text = ""; //--- ToDo: Localize;
				x = 0.878469 * safezoneW + safezoneX;
				y = 0.00500001 * safezoneH + safezoneY;
				w = 0.118594 * safezoneW;
				h = 0.022 * safezoneH;
				sizeEx = 0.7 * GUI_GRID_H;
				colorText[] = {1,1,1,0.7};
				font = "Roboto";
				shadow = 0;
			};
			class firemode: RscStructuredText
			{
				idc = 5;
				text = ""; //--- ToDo: Localize;
				x = 0.878469 * safezoneW + safezoneX;
				y = 0.027 * safezoneH + safezoneY;
				w = 0.118594 * safezoneW;
				h = 0.022 * safezoneH;
				sizeEx = 0.7 * GUI_GRID_H;
				colorText[] = {1,1,1,0.7};
				font = "Roboto";
				shadow = 0;
			};
			class grenade: RscStructuredText
			{
				idc = 6;
				text = ""; //--- ToDo: Localize;
				x = 0.878469 * safezoneW + safezoneX;
				y = 0.049 * safezoneH + safezoneY;
				w = 0.118594 * safezoneW;
				h = 0.022 * safezoneH;
				sizeEx = 0.7 * GUI_GRID_H;
				colorText[] = {1,1,1,0.7};
				font = "Roboto";
				shadow = 0;
			};

			// New thing at the bottom
			/*class RscText_1000: RscText
			{
				idc = -1;
				x = 0.355625 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
				colorBackground[] = {0,0,0,0.3};
			};
			class RscText_1001: RscText
			{
				idc = -1;
				x = 0.412344 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
				colorBackground[] = {0,0,0,0.3};
			};
			class RscText_1002: RscText
			{
				idc = -1;
				x = 0.469062 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
				colorBackground[] = {0,0,0,0.3};
			};
			class RscText_1003: RscText
			{
				idc = -1;
				x = 0.525781 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
				colorBackground[] = {0,0,0,0.3};
			};
			class RscText_1004: RscText
			{
				idc = -1;
				x = 0.5825 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
				colorBackground[] = {0,0,0,0.3};
			};
			class item1: RscPicture
			{
				idc = 11;
				text = "#(argb,8,8,3)color(1,1,1,1)";
				x = 0.355625 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
			};
			class item2: RscPicture
			{
				idc = 12;
				text = "#(argb,8,8,3)color(1,1,1,1)";
				x = 0.412344 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
			};
			class item3: RscPicture
			{
				idc = 13;
				text = "#(argb,8,8,3)color(1,1,1,1)";
				x = 0.469062 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
			};
			class item4: RscPicture
			{
				idc = 14;
				text = "#(argb,8,8,3)color(1,1,1,1)";
				x = 0.525781 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
			};
			class item5: RscPicture
			{
				idc = 15;
				text = "#(argb,8,8,3)color(1,1,1,1)";
				x = 0.5825 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0515625 * safezoneW;
				h = 0.088 * safezoneH;
			};
			class RscText_1005: RscText
			{
				idc = -1;
				text = "1"; //--- ToDo: Localize;
				x = 0.355625 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] = {1,1,1,0.2};
			};
			class RscText_1006: RscText
			{
				idc = -1;
				text = "2"; //--- ToDo: Localize;
				x = 0.412344 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] = {1,1,1,0.2};
			};
			class RscText_1007: RscText
			{
				idc = -1;
				text = "3"; //--- ToDo: Localize;
				x = 0.469062 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] = {1,1,1,0.2};
			};
			class RscText_1008: RscText
			{
				idc = -1;
				text = "4"; //--- ToDo: Localize;
				x = 0.525781 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] = {1,1,1,0.2};
			};
			class RscText_1009: RscText
			{
				idc = -1;
				text = "5"; //--- ToDo: Localize;
				x = 0.5825 * safezoneW + safezoneX;
				y = 0.907 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
				colorText[] = {1,1,1,0.2};
			};*/
		};
	};

	class spawnMenuFadeOut
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=3;
		fadein=3;
		duration = 1;

		class controlsBackground {};

		class controls
		{
			class blackbackground: RscText
			{
				idc = -1;
				x = 0 * safezoneW + safezoneX;
				y = 0 * safezoneH + safezoneY;
				w = 1 * safezoneW;
				h = 1 * safezoneH;
				colorBackground[] = {0,0,0,1};
			};
		};
	};

	class blackbackgroundfadein
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=3;
		fadein=0;
		duration = 0;

		class controlsBackground {};

		class controls
		{
			class blackbackground: RscText
			{
				idc = -1;
				x = 0 * safezoneW + safezoneX;
				y = 0 * safezoneH + safezoneY;
				w = 1 * safezoneW;
				h = 1 * safezoneH;
				colorBackground[] = {0,0,0,1};
			};
		};
	};

	class introcamfades
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=1;
		fadein=1;
		duration = 1;

		class controlsBackground {};

		class controls
		{
			class blackbackground: RscText
			{
				idc = -1;
				x = 0 * safezoneW + safezoneX;
				y = 0 * safezoneH + safezoneY;
				w = 1 * safezoneW;
				h = 1 * safezoneH;
				colorBackground[] = {0,0,0,1};
			};
		};
	};

	class blackbackgroundfadeout
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=0;
		fadein=3;
		duration = 0;

		class controlsBackground {};

		class controls
		{
			class blackbackground: RscText
			{
				idc = -1;
				x = 0 * safezoneW + safezoneX;
				y = 0 * safezoneH + safezoneY;
				w = 1 * safezoneW;
				h = 1 * safezoneH;
				colorBackground[] = {0,0,0,1};
			};
		};
	};

	class blackbackground
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=0;
		fadein=0;
		duration = 999999999999;

		class controlsBackground {};

		class controls
		{
			class blackbackground: RscText
			{
				idc = -1;
				x = 0 * safezoneW + safezoneX;
				y = 0 * safezoneH + safezoneY;
				w = 1 * safezoneW;
				h = 1 * safezoneH;
				colorBackground[] = {0,0,0,1};
			};
		};
	};

	class logoBlendIn
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=1;
		fadein=1;
		duration = 6;
		onLoad = "uiNamespace setVariable ['dz_introLogoText',(_this select 0) displayCtrl 1]";

		class controlsBackground {};

		class controls
		{
			class RscStructuredText_1100323232323: RscStructuredText
			{
				idc = 1;
				text = "DESOLATION"; //--- ToDo: Localize;
				x = 0.298906 * safezoneW + safezoneX;
				y = 0.236 * safezoneH + safezoneY;
				w = 0.402187 * safezoneW;
				h = 0.528 * safezoneH;
				colorBackground[] = {-1,-1,-1,0};
				sizeEx = 2 * 0.04;
			};
		};
	};

	class logoBlendIn2
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=1;
		fadein=1;
		duration = 5;
		onLoad = "uiNamespace setVariable ['dz_introLogoText',(_this select 0) displayCtrl 1]";

		class controlsBackground {};

		class controls
		{
			class RscText_1001: RscText
			{
				idc = 1001;
				x = 0.506187 * safezoneW + safezoneX;
				y = 0.885 * safezoneH + safezoneY;
				w = 0.12375 * safezoneW;
				h = 0.121 * safezoneH;
				colorBackground[] = {0,0,0,0.5};
			};
			class RscText_1000: RscText
			{
				idc = 1000;
				x = 0.381406 * safezoneW + safezoneX;
				y = 0.885 * safezoneH + safezoneY;
				w = 0.122719 * safezoneW;
				h = 0.121 * safezoneH;
				colorBackground[] = {0,0,0,0.5};
			};
			class RscPicture_1200: RscPicture
			{
				idc = 1200;
				text = "\sam_weapons\nambu_type14\UI\gear_nambu_type14_x_CA.paa";
				x = 0.510312 * safezoneW + safezoneX;
				y = 0.896 * safezoneH + safezoneY;
				w = 0.113437 * safezoneW;
				h = 0.099 * safezoneH;
			};
			class RscPicture_1201: RscPicture
			{
				idc = 1201;
				text = "\sam_weapons\nambu_type14\UI\gear_nambu_type14_x_CA.paa";
				x = 0.386562 * safezoneW + safezoneX;
				y = 0.896 * safezoneH + safezoneY;
				w = 0.113437 * safezoneW;
				h = 0.099 * safezoneH;
			};
			class RscText_1002: RscText
			{
				idc = 1002;
				text = "1"; //--- ToDo: Localize;
				x = 0.386562 * safezoneW + safezoneX;
				y = 0.973 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class RscText_1003: RscText
			{
				idc = 1003;
				text = "2"; //--- ToDo: Localize;
				x = 0.510312 * safezoneW + safezoneX;
				y = 0.973 * safezoneH + safezoneY;
				w = 0.0103125 * safezoneW;
				h = 0.022 * safezoneH;
			};
		};
	};

	class loadingObjects
	{
		idd = -1;
		movingEnable = true;
		enableSimulation = true;
		fadeout=0;
		fadein=0;
		duration = 99999999999;
		onLoad = "uiNamespace setVariable ['loadingObjects',(_this select 0) displayCtrl 1]";

		class controlsBackground {};

		class controls
		{
			class RscText_1000: RscText
			{
				idc = -1;
				x = -0.000158954 * safezoneW + safezoneX;
				y = -0.00599999 * safezoneH + safezoneY;
				w = 1.00031 * safezoneW;
				h = 0.0308 * safezoneH;
				colorBackground[] = {0,0,0,1};
			};
			class RscText_1001: RscText
			{
				idc = -1;
				text = "LOADING OBJECTS..."; //--- ToDo: Localize;
				x = 0.00293777 * safezoneW + safezoneX;
				y = -0.00160003 * safezoneH + safezoneY;
				w = 0.128906 * safezoneW;
				h = 0.0264 * safezoneH;
			};
			class progressbackground: RscText
			{
				idc = -1;
				x = -0.000156274 * safezoneW + safezoneX;
				y = 0.0248 * safezoneH + safezoneY;
				w = 1.00031 * safezoneW;
				h = 0.0055 * safezoneH;
				colorBackground[] = {0,0,0,1};
			};
			class progress: RscProgress
			{
				idc = 1;
				x = 0 * safezoneW + safezoneX;
				y = 0.0248 * safezoneH + safezoneY;
				w = 1.0 * safezoneW;
				h = 0.0055 * safezoneH;
				colorFrame[] = {0, 0, 0, 0};
				colorBackground[] = {0,0,0,0.7};
				colorBar[] = {1,0,0,1};
			};
		};
	};
};