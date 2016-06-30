class playerList {
	idd = 1820;
	name= "playerList";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "";

	class controlsBackground {};

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
		};
		class playerList: RscListbox
		{
			idc = 1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.3196 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.3916 * safezoneH;
			sizeEx = 0.04;
		};
		class RscButtonMenuOK_2600: RscButtonMenu
		{
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.654686 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.0464063 * safezoneW;
			h = 0.022 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		class RscText_1001: RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.0308 * safezoneH;
			colorBackground[] = {0.3,0,0,1};
		};
		class serverName: RscText
		{
			idc = 2;
			text = "Players - SERVERNAME"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.2844 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
		};
	};
};

class playerMap {
	idd = 1830;
	name= "playerMap";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "";

	class controlsBackground {
		class map: RscMapControl
		{
			idc = 1;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			colorBackground[] = {0,0.21,0.45,1};

			// Custom map
			colorForest[] = {0.624,0.78,0.388,0.3};
			alphaFadeEndScale = 999;
			alphaFadeStartScale = 999;
			scaleMax = 0.5;
		};
	};

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;
			x = -0.000156274 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 1.00031 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class closeMap: RscButtonMenu
		{
			idc = 2;
			text = "CLOSE MAP"; //--- ToDo: Localize;
			x = 0.873312 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "closeDialog 0;";
		};
		/*class RscButtonMenu_2401: RscButtonMenu
		{
			idc = 3;
			text = "PLAYER LIST"; //--- ToDo: Localize;
			x = 0.7475 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			onButtonClick = "[] spawn dz_fnc_openPlayerList;";
		};*/
	};
};

class helpMenu {
	idd = 1030;
	name= "helpMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "if (!dz_exitEscWithOutAction) then {(findDisplay 49) closeDisplay 1};";

	class controlsBackground {};

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.298905 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.484 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.3,0,0,1};
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "DESOLATION INSTRUCTIONS"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.429 * safezoneH;
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			font = "Roboto";
			onLBSelChanged = "[_this] call dz_fnc_helpMenu;";
		};
		class RscText_1004: RscText
		{
			idc = -1;
			text = "CATEGORIES"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.3064 * safezoneH + safezoneY;
			w = 0.165 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 2;
			x = 0.45875 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.237187 * safezoneW;
			h = 0.429 * safezoneH;
		};
		class RscButtonMenu_2400: RscButtonMenu
		{
			idc = -1;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.577344 * safezoneW + safezoneX;
			y = 0.7662 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "closeDialog 0";
		};
	};
};

class craftingRecipeFound {
	idd = 2010;
	name= "helpMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "uiNamespace setVariable ['dz_recipeResult',[(_this select 0) displayCtrl 1,(_this select 0) displayCtrl 2,(_this select 0) displayCtrl 3]]";
	onUnload = "";

	class controlsBackground {};

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.402187 * safezoneW;
			h = 0.0286 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "CRAFTING RECIPE FOUND!"; //--- ToDo: Localize;
			x = 0.299937 * safezoneW + safezoneX;
			y = 0.3262 * safezoneH + safezoneY;
			w = 0.28875 * safezoneW;
			h = 0.022 * safezoneH;
			font = "RobotoBold";
		};
		class RscText_1003: RscText
		{
			idc = -1;
			text = "You have found a crafting recipe!"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
			font = "Roboto";
		};
		class RscText_1004: RscText
		{
			idc = -1;
			text = "Please note that as soon as you close this window you will not be able to view this recipe again!"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.3746 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.022 * safezoneH;
			font = "Roboto";
		};
		class RscText_1005: RscText
		{
			idc = -1;
			text = "Required Items"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			font = "RobotoBold";
		};
		class RscText_1006: RscText
		{
			idc = -1;
			text = "Required Tools"; //--- ToDo: Localize;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			font = "RobotoBold";
		};
		class RscText_1007: RscText
		{
			idc = -1;
			text = "Product"; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			font = "RobotoBold";
		};
		class requireditems: RscStructuredText
		{
			idc = 1;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class requiredtools: RscStructuredText
		{
			idc = 2;
			x = 0.436062 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class product: RscStructuredText
		{
			idc = 3;
			x = 0.567032 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class RscButtonMenuOK_closeRecipeDialog: RscButtonMenu
		{
			text = "CLOSE"; //--- ToDo: Localize;
			onButtonClick = "closeDialog 0;";
			x = 0.618594 * safezoneW + safezoneX;
			y = 0.6782 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.022 * safezoneH;
			font = "Roboto";
		};
	};
};

class escMenu {
	idd = 850;
	name= "escMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "if (!dz_exitEscWithOutAction) then {(findDisplay 49) closeDisplay 1};";

	class controlsBackground {};

	class controls {
			class RscText_1000: RscText
			{
				idc = -1;
				x = 0.4175 * safezoneW + safezoneX;
				y = 0.313 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.033 * safezoneH;
				colorBackground[] = {0.3,0,0,1};
			};
			class RscText_1001: RscText
			{
				idc = -1;
				text = "MENU"; //--- ToDo: Localize;
				x = 0.484531 * safezoneW + safezoneX;
				y = 0.3174 * safezoneH + safezoneY;
				w = 0.0360937 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class RscText_1002: RscText
			{
				idc = -1;
				x = 0.4175 * safezoneW + safezoneX;
				y = 0.346 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.286 * safezoneH;
				colorBackground[] = {0,0,0,0.9};
			};
			class RscButton_1600: RscButtonMenu
			{
				idc = -1;
				text = "Continue"; //--- ToDo: Localize;
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.357 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.033 * safezoneH;
				onButtonClick = "['Continue'] spawn dz_fnc_escMenu;";
			};
			class RscButton_1601: RscButtonMenu
			{
				idc = -1;
				text = "Video"; //--- ToDo: Localize;
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.3944 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.033 * safezoneH;
				onButtonClick = "['Video'] spawn dz_fnc_escMenu;";
			};
			class RscButton_1602: RscButtonMenu
			{
				idc = -1;
				text = "Audio"; //--- ToDo: Localize;
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.4318 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.033 * safezoneH;
				onButtonClick = "['Audio'] spawn dz_fnc_escMenu;";
			};
			class RscButton_1603: RscButtonMenu
			{
				idc = -1;
				text = "Controls"; //--- ToDo: Localize;
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.4692 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class RscButton_1604: RscButtonMenu
			{
				idc = -1;
				text = "Game"; //--- ToDo: Localize;
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.5066 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.033 * safezoneH;
				onButtonClick = "['Game'] spawn dz_fnc_escMenu;";
			};
			class RscButton_1605: RscButtonMenu
			{
				idc = -1;
				text = ""; //--- ToDo: Localize;
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.544 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.033 * safezoneH;
			};
			class RscButton_1606: RscButtonMenu
			{
				idc = -1;
				text = "Return To Lobby"; //--- ToDo: Localize;
				x = 0.422656 * safezoneW + safezoneX;
				y = 0.5836 * safezoneH + safezoneY;
				w = 0.154687 * safezoneW;
				h = 0.033 * safezoneH;
				onButtonClick = "['Return'] spawn dz_fnc_escMenu;";
			};
	};
};


class spawnMenu {
	idd = 700;
	name= "spawnMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "if (isNil 'dz_inGame') then {[] spawn dz_fnc_CloseSpawnMenu;};";

	class controlsBackground {};

	class controls {
		class RscShortcutButton_17013: RscButtonMenu
		{
			idc = 9;
			text = "RETURN TO LOBBY"; //--- ToDo: Localize;
			x = 0.0 * safezoneW + safezoneX;
			y = 0.0 * safezoneH + safezoneY;
			w = 0.0 * safezoneW;
			h = 0.0 * safezoneH;
			shadow = 0;
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = ""; // TODO END MISSION
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};


		/*class RscPicture_1232322332: RscPicture
		{
			idc = -1;

			text = "logo.paa";
			x = 0.78875 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.396 * safezoneH;
		};
		class RscText_1000953: RscStructuredText
		{
			idc = 20;
			text = "DayZero Pre-Alpha Build 0.48"; //--- ToDo: Localize;
			x = 0.809375 * safezoneW + safezoneX;
			y = 0.973 * safezoneH + safezoneY;
			w = 0.175313 * safezoneW;
			h = 0.022 * safezoneH;
			align = "center";
			font = "Roboto";
			shadow = 0;
		};*/

		class RscShortcutButton_1700: RscButtonMenu
		{
			idc = 10;
			text = "CONTINUE GAME"; //--- ToDo: Localize;
			x = 0.206084 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0439845 * safezoneH;
			colorBackground[] = {0.3,0,0,1};
			shadow = 0;
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			onButtonClick = "[] spawn dz_fnc_CloseSpawnMenu;";
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};
		class RscShortcutButton_1701: RscButtonMenu
		{
			idc = 11;
			text = "RETURN TO LOBBY"; //--- ToDo: Localize;
			x = 0.206084 * safezoneW + safezoneX;
			y = 0.576973 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			shadow = 0;
			h = 0.0439845 * safezoneH;
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "endMission 'EXIT';"; // TODO END MISSION
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};

		/*class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "logo.paa";
			x = 0.149363 * safezoneW + safezoneX;
			y = 0.192109 * safezoneH + safezoneY;
			w = 0.226882 * safezoneW;
			h = 0.39586 * safezoneH;
		};*/

		class RscButtonMenu_2403: RscButtonMenu
		{
			idc = 12;

			text = "CUSTOMIZE CHARACTER"; //--- ToDo: Localize;
			x = 0.206084 * safezoneW + safezoneX;
			y = 0.521992 * safezoneH + safezoneY;
			w = 0.206257 * safezoneW;
			h = 0.0439845 * safezoneH;
			shadow = 0;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "[] spawn dz_fnc_CustomizationMenu;";
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};

		class RscText_10004: RscText
		{
			idc = -1;
			x = 0.195771 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.0010313 * safezoneW;
			h = 0.153946 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class RscText_10014: RscText
		{
			idc = -1;
			text = "MAIN"; //--- ToDo: Localize;
			x = 0.139051 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.061877 * safezoneW;
			h = 0.0329884 * safezoneH;
			shadow = 2;
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
		};
		class RscText_10024: RscText
		{
			idc = -1;
			text = "MENU"; //--- ToDo: Localize;
			x = 0.132863 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.061877 * safezoneW;
			h = 0.0329884 * safezoneH;
			shadow = 2;
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
		};


		/********************************************************************************************************/

		class RscText_106503: RscText
		{
			idc = -1;
			x = 0.206094 * safezoneW + safezoneX;
			y = 0.632 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.099 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class RscText_165004: RscText
		{
			idc = -1;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class timeSurvived: RscText
		{
			idc = 25;
			text = "00:00:00"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_100656: RscText
		{
			idc = -1;
			text = "Time Survived"; //--- ToDo: Localize;
			x = 0.340312 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_100657: RscText
		{
			idc = -1;
			x = 0.21125 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.201094 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class zombiesKilled: RscText
		{
			idc = 26;
			text = "9999"; //--- ToDo: Localize;
			x = 0.216406 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_1009: RscText
		{
			idc = -1;
			text = "Zombies Killed"; //--- ToDo: Localize;
			x = 0.340312 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0670312 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_1321348965: RscText
		{
			idc = -1;
			text = "HOLD [NUM4] OR [NUM6] TO ROTATE YOUR CHARACTER"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.278437 * safezoneW;
			h = 0.022 * safezoneH;
			font = "Roboto";
			shadow = 0;
		};
	};
};

class customizeCharacter {
	idd = 900;
	name= "customizeCharacter";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "[] spawn dz_fnc_CustomizationMenuClose;";

	class controlsBackground {};

	class controls {
		class RscShortcutButton_1709: RscButtonMenu
		{
			idc = -1;
			text = "RETURN TO MAIN MENU"; //--- ToDo: Localize;
			x = 0 * safezoneW + safezoneX;
			y = 0 * safezoneH + safezoneY;
			w = 0 * safezoneW;
			h = 0 * safezoneH;

			colorText[] = {1,1,1,1};
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "";
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};
		class RscShortcutButton_1701: RscButtonMenu
		{
			idc = -1;
			text = "SWITCH UNIFORM"; //--- ToDo: Localize;
			x = 0.211241 * safezoneW + safezoneX;
			y = 0.335058 * safezoneH + safezoneY;
			w = 0.154693 * safezoneW;
			h = 0.0329884 * safezoneH;

			colorText[] = {1,1,1,1};
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "[0] spawn dz_fnc_CustomizationChange;";
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};
		class RscShortcutButton_1703: RscButtonMenu
		{
			idc = -1;
			text = "SWITCH GLASSES"; //--- ToDo: Localize;
			x = 0.211241 * safezoneW + safezoneX;
			y = 0.379043 * safezoneH + safezoneY;
			w = 0.154693 * safezoneW;
			h = 0.0329884 * safezoneH;

			colorText[] = {1,1,1,1};
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "[1] spawn dz_fnc_CustomizationChange;";
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};
		class RscShortcutButton_1709232323: RscButtonMenu
		{
			idc = -1;
			text = "SWITCH HAT"; //--- ToDo: Localize;
			x = 0.211241 * safezoneW + safezoneX;
			y = 0.423027 * safezoneH + safezoneY;
			w = 0.154693 * safezoneW;
			h = 0.0329884 * safezoneH;

			colorText[] = {1,1,1,1};
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "[2] spawn dz_fnc_CustomizationChange;";
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};
		class RscShortcutButton_1702: RscButtonMenu
		{
			idc = -1;
			text = "RETURN TO MAIN MENU"; //--- ToDo: Localize;
			x = 0.211241 * safezoneW + safezoneX;
			y = 0.467011 * safezoneH + safezoneY;
			w = 0.154693 * safezoneW;
			h = 0.0329884 * safezoneH;

			colorText[] = {1,1,1,1};
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "closeDialog 0;";
			/*animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";*/
		};
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.200928 * safezoneW + safezoneX;
			y = 0.335058 * safezoneH + safezoneY;
			w = 0.0010313 * safezoneW;
			h = 0.164941 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			text = "CHARACTER"; //--- ToDo: Localize;
			x = 0.0720172 * safezoneW + safezoneX;
			y = 0.346054 * safezoneH + safezoneY;
			w = 0.12891 * safezoneW;
			h = 0.0769728 * safezoneH;
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			shadow = 2;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "CUSTOMIZE"; //--- ToDo: Localize;
			x = 0.08233 * safezoneW + safezoneX;
			y = 0.313066 * safezoneH + safezoneY;
			w = 0.12891 * safezoneW;
			h = 0.0769728 * safezoneH;
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
			shadow = 2;
		};
	};
};

class playerMenu {
	idd = 500;
	name= "playerMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "[] spawn dz_fnc_playerMenuUnload;";

	class controlsBackground {};

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.5 * safezoneW + safezoneX;
			y = 0.258085 * safezoneH + safezoneY;
			w = 0.201145 * safezoneW;
			h = 0.483829 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			x = 0.298855 * safezoneW + safezoneX;
			y = 0.258085 * safezoneH + safezoneY;
			w = 0.195988 * safezoneW;
			h = 0.483829 * safezoneH;
			colorBackground[] = {0,0,0,0.6};
		};
		class RscText_1002: RscText
		{
			idc = -1;
			text = "Crafting"; //--- ToDo: Localize;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.269082 * safezoneH + safezoneY;
			w = 0.0928363 * safezoneW;
			h = 0.0219922 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = -1;
			text = "My Inventory"; //--- ToDo: Localize;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.269082 * safezoneH + safezoneY;
			w = 0.0928363 * safezoneW;
			h = 0.0219922 * safezoneH;
		};
		class POSSIBLEPRODUCTS: RscListbox
		{
			idc = 1;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.478021 * safezoneH + safezoneY;
			w = 0.185673 * safezoneW;
			h = 0.0879688 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
			font = "Roboto";
			onLBSelChanged = "[] call dz_fnc_playerMenuProductDetails";
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			rowHeight = 0.06;
		};
		class RscText_1004: RscText
		{
			idc = -1;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.574773 * safezoneH + safezoneY;
			w = 0.185673 * safezoneW;
			h = 0.00109962 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class RscText_1005: RscText
		{
			idc = -1;
			text = "Products"; //--- ToDo: Localize;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.449432 * safezoneH + safezoneY;
			w = 0.0928363 * safezoneW;
			h = 0.0219922 * safezoneH;
		};
		class RscText_1006: RscText
		{
			idc = -1;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.442832 * safezoneH + safezoneY;
			w = 0.185673 * safezoneW;
			h = 0.00109962 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class RscText_1007: RscText
		{
			idc = -1;
			text = "Requirements"; //--- ToDo: Localize;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.581372 * safezoneH + safezoneY;
			w = 0.118624 * safezoneW;
			h = 0.0219922 * safezoneH;
		};
		class CRAFTINGREQUIREMENTS: RscStructuredText
		{
			idc = 3;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.607762 * safezoneH + safezoneY;
			w = 0.185673 * safezoneW;
			h = 0.0879688 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
		};
		class CRAFTINGITEMS: RscListbox
		{
			idc = 4;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.295472 * safezoneH + safezoneY;
			w = 0.185673 * safezoneW;
			h = 0.131953 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			font = "Roboto";
			onLBSelChanged = "[] call dz_fnc_playerMenuBtnAvailable;[] spawn dz_fnc_playerMenuCraftingProducts;";
			rowHeight = 0.06;
			canDrag = 1;
			onLBDrag = "_this spawn dz_fnc_playerMenuDrag;";
			onLBDrop = "_this call dz_fnc_playerMenuDropCraft;";
		};
		class MYINVENTORY: RscListbox
		{
			idc = 5;
			x = 0.505158 * safezoneW + safezoneX;
			y = 0.295473 * safezoneH + safezoneY;
			w = 0.19083 * safezoneW;
			h = 0.402456 * safezoneH;
			colorBackground[] = {1,1,1,0.1};
			sizeEx = (			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			font = "Roboto";
			onLBSelChanged = "[] call dz_fnc_playerMenuBtnAvailable;";
			rowHeight = 0.06;
			canDrag = 1;
			onLBDrag = "_this spawn dz_fnc_playerMenuDrag;";
			onLBDrop = "_this call dz_fnc_playerMenuDropInv;";
			onLBDblClick = "if ((diag_tickTime - dz_tooFast) > 0.5) then {call dz_fnc_playerMenuUseItem;dz_tooFast = diag_tickTime;};";
		};
		class CRAFTITEMBUTTON: RscButtonMenu
		{
			idc = 10;
			text = "Craft Item"; //--- ToDo: Localize;
			x = 0.304012 * safezoneW + safezoneX;
			y = 0.702328 * safezoneH + safezoneY;
			w = 0.072206 * safezoneW;
			h = 0.0329884 * safezoneH;
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "[] call dz_fnc_playerMenuCraftItem;";
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class USEITEM: RscButtonMenu
		{
			idc = 6;
			text = "Use Item"; //--- ToDo: Localize;
			x = 0.634097 * safezoneW + safezoneX;
			y = 0.702329 * safezoneH + safezoneY;
			w = 0.0618909 * safezoneW;
			h = 0.0329884 * safezoneH;
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "if ((diag_tickTime - dz_tooFast) > 0.5) then {call dz_fnc_playerMenuUseItem;dz_tooFast = diag_tickTime;};";
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class ADDRESOURCETABLE: RscButtonMenu
		{
			idc = 7;
			text = "MOVE TO CRAFTING"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.702328 * safezoneH + safezoneY;
			w = 0.123782 * safezoneW;
			h = 0.0329884 * safezoneH;
			colorBackground[] = {0.3,0,0,1};
			onButtonClick = "call dz_fnc_playerMenuMoveItemToCrafting;";
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class CLEARRESOURCETABLE: RscButtonMenu
		{
			idc = 8;
			text = "Remove Item"; //--- ToDo: Localize;
			x = 0.381376 * safezoneW + safezoneX;
			y = 0.702328 * safezoneH + safezoneY;
			w = 0.108313 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "call dz_fnc_playerMenuMoveItemToInventory;";

			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class CLOSEDIALOG: RscButtonMenu
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.684641 * safezoneW + safezoneX;
			y = 0.264684 * safezoneH + safezoneY;
			w = 0.0123782 * safezoneW;
			h = 0.0241914 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			onButtonClick = "closeDialog 0";
		};

		/******************************************************************************************/

		class RscText_1011: RscText
		{
			idc = 20;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.258 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,1,0,0.8};
		};
		class RscText_1012: RscText
		{
			idc = 21;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,1,0,0.8};
		};
		class RscText_1013: RscText
		{
			idc = 22;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,0,0,0.8};
		};
		class RscText_1014: RscText
		{
			idc = -1;
			text = " BROKEN LEGS"; //--- ToDo: Localize;
			x = 0.721719 * safezoneW + safezoneX;
			y = 0.3504 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.0242 * safezoneH;
			shadow = 2;
			font = "PuristaLight";
		};
		class RscText_1015: RscText
		{
			idc = -1;
			text = "HUNGER"; //--- ToDo: Localize;
			x = 0.736157 * safezoneW + safezoneX;
			y = 0.2624 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			shadow = 2;
			font = "PuristaLight";
		};
		class RscText_1016: RscText
		{
			idc = -1;
			text = "THIRST"; //--- ToDo: Localize;
			x = 0.738219 * safezoneW + safezoneX;
			y = 0.3064 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.022 * safezoneH;
			shadow = 2;
			font = "PuristaLight";
		};
		class RscText_1017: RscText
		{
			idc = 23;
			x = 0.70625 * safezoneW + safezoneX;
			y = 0.39 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,0,0,0.8};
		};
		class RscText_1018: RscText
		{
			idc = 1018;
			text = "INFECTED"; //--- ToDo: Localize;
			x = 0.734095 * safezoneW + safezoneX;
			y = 0.3944 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.0242 * safezoneH;
			shadow = 2;
			font = "PuristaLight";
		};


		class RscText_1019: RscText
		{
			idc = 24;

			x = 0.70625 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,0,0,0.8};
		};
		class RscText_1020: RscText
		{
			idc = 1018;

			text = "BLEEDING"; //--- ToDo: Localize;
			x = 0.734094 * safezoneW + safezoneX;
			y = 0.4384 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.0242 * safezoneH;
			shadow = 2;
			font = "PuristaLight";
		};
		class RscText_1021: RscText
		{
			idc = 25;

			x = 0.70625 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,0,0,0.8};
		};
		class RscText_1022: RscText
		{
			idc = 1018;

			text = "STARVATION"; //--- ToDo: Localize;
			x = 0.726876 * safezoneW + safezoneX;
			y = 0.4802 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.0264 * safezoneH;
			shadow = 2;
			font = "PuristaLight";
		};
		class RscText_1023: RscText
		{
			idc = 26;

			x = 0.70625 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.103125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {1,0,0,0.8};
		};
		class RscText_1024: RscText
		{
			idc = 1018;

			text = "DEHYDRATION"; //--- ToDo: Localize;
			x = 0.724813 * safezoneW + safezoneX;
			y = 0.5242 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.0286 * safezoneH;
			shadow = 2;
			font = "PuristaLight";
		};
	};
};


class interactionMenu {
	idd = 600;
	name= "interactionMenu";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	onUnload = "";

	class controlsBackground {};

	class controls {
		class RscText_1000: RscText
		{
			idc = -1;
			x = 0.39169 * safezoneW + safezoneX;
			y = 0.236093 * safezoneH + safezoneY;
			w = 0.216618 * safezoneW;
			h = 0.527814 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		class RscText_1001: RscText
		{
			idc = -1;
			text = "Vehicle Interaction"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.247089 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.0219922 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = -1;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.280078 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.00109962 * safezoneH;
			colorBackground[] = {1,1,1,1};
		};
		class btn0: RscButtonMenu
		{
			idc = 0;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.291074 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[0] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn1: RscButtonMenu
		{
			idc = 10;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.335058 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[1] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn2: RscButtonMenu
		{
			idc = 11;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.379043 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[2] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn3: RscButtonMenu
		{
			idc = 3;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.423027 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[3] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn4: RscButtonMenu
		{
			idc = 4;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.467012 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[4] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn5: RscButtonMenu
		{
			idc = 5;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.510996 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[5] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn6: RscButtonMenu
		{
			idc = 6;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.554981 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[6] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn8: RscButtonMenu
		{
			idc = 7;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.598965 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[7] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class btn9: RscButtonMenu
		{
			idc = 8;
			text = "Repair"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.642949 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[8] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class savetodatabase: RscButtonMenu
		{
			idc = 9;
			text = "Refuel Vehicle"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.719922 * safezoneH + safezoneY;
			w = 0.206303 * safezoneW;
			h = 0.0329884 * safezoneH;
			onButtonClick = "[-1] call dz_fnc_repairVehicle;";
			colorBackground[] = {0.3,0,0,1};
			animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
			animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
			animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
			animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
		};
		class RscText_1003: RscText
		{
			idc = -1;
			text = "Service"; //--- ToDo: Localize;
			x = 0.396849 * safezoneW + safezoneX;
			y = 0.691332 * safezoneH + safezoneY;
			w = 0.139254 * safezoneW;
			h = 0.0219922 * safezoneH;
		};
		class closedialog: RscButtonMenu
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.591805 * safezoneW + safezoneX;
			y = 0.247089 * safezoneH + safezoneY;
			w = 0.0113467 * safezoneW;
			h = 0.0219922 * safezoneH;
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {1,1,1,0.4};
		};
	};
};



