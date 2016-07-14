if (isDedicated) exitWith {};scriptName "configuration";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: configuration.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "configuration.sqf"

/*** SETUP ALL VARIABLES NEEDED FOR DESOLATION ***/

// Inventory
dz_PositionATL_Dir = [];
dz_Inventory = [];
dz_Clothing = [];
dz_Weapons = [];
dz_WeaponItems = [];
dz_Alive = 0;
dz_crafting_inv = [];
dz_crafting_exitDummy = objNull;
dz_hunger = 100;
dz_thirst = 100;
dz_infected = false;

// Sway and stuff
player setCustomAimCoef 0.6;
player setUnitRecoilCoefficient 2.4;

// Disable side chat if this is a hardcore server
if (difficulty == 3) then {
	1 enableChannel true;
};

// View distance
setViewDistance 1200;

// As Desolation is now available on different maps the spawnscreen location has to be different aswell
switch (worldName) do {
	case "FDF_Isle1_a": {
		dz_cl_spawnmenu_pos = [11587.1,4990.13,0.0014267];
		dz_cl_spawnmenu_dir = 195.856;
	};
	case "Chernarus_Summer": {
		dz_cl_spawnmenu_pos = [8318.24,6596.72,0.0012207];
		dz_cl_spawnmenu_dir = 337.209;
	};
	case "taviana": {
		dz_cl_spawnmenu_pos = [2687.37,16261.9,0.00145531];
		dz_cl_spawnmenu_dir = 316.289;
	};
	case "Napf": {
		dz_cl_spawnmenu_pos = [1736.75,12811.4,0.00154877];
		dz_cl_spawnmenu_dir = 334.315;
	};
};

// Log my stuff
player addMPEventHandler ["MPHit",{
	diag_log format ["%1: %2 recieved %4 damage from unit %3",dz_sv_logPrefix,name (_this select 0),name (_this select 1),_this select 2];
}];
//player addMPEventHandler ["MPKilled",{
//	diag_log format ["%1: %2 has been killed by %3",dz_sv_logPrefix,name (_this select 0),name (_this select 1)];
//}];
player addEventHandler ["Killed",{
	[
		format["%1 has been killed by %2",name player, name (driver (_this select 1))]
	] remoteExec ["dz_fnc_logToRPT",2];
}];

// Logout time
dz_antiCombatLogTimer = 25;

// Version
dz_version = "Desolation Pre-Beta Build";
// Intro Text Build
dz_introText = "<br/><br/><br/><br/><t align='center'><t size='4'>DESOLATION</t><br/><br/><br/>Desolation is a ArmA III modification made by OPTiX<br/>Special thanks to the developers of the following mods / the following people:<br/><br/>Ryan's Zombies and Demons, Sam's Weapon Pack, HLC Weapon Pack, RLS Vehicle Pack, Community Upgrade Project Terrain Pack, Community Upgrade Project Vehicle Pack, Community Upgrade Project Units Pack, XAM Environment Sounds, xCam, FDF Podagorsk, LAxemann's Mount, Hidden Identity Pack, TRYK Clothing, Taviana 0.3.8.1 (www.arma3taviana.eu), Martin Bauer (Original Taviana Map Author), ORIGINS Mod, A_Hairy_Potatoe<br/><br/>OFFICIAL SERVERS PROVIDED BY<br/>www.BlackBoxServers.net</t>";

// Help menu texts
dz_helpTextContent = [
	["Introduction","Welcome to ArmA III Desolation! In this menu you can find some helpful information about this survival gamemode! If you have question please read through this guide first, if you still cannot find what you are looking for don't hesitate to ask your fellow survivors in the sidechat which is accessible during Alpha."],
	["Player Inventory","The player inventory has been split into two main dialogs: The standart ArmA inventory and Desolation's player menu. All item interactions and crafting can be done in this menu.<br/><br/>The Desolation Inventory can be accessed by pressing [SHIFT]+[i]. The inventory is split into 2 main parts, the crafting GUI and your inventory. Use the buttons at the bottom of the dialog to navigate items through the menues or simply drag and drop them. Items can be used by either double clicking on them or selecting them and pressing 'Use Item'."],
	["Crafting","To use the crafting menu you need to move items to the crafting table in your [SHIFT]+[i] menu either via drag and drop or with the buttons found at the bottom of the dialog. Once you have all necessary items in the crafting table you will be able to see all items which you can craft with them. If there is no product listed you either have a wrong combination or the wrong amount. Please note that you can always only craft one item at a time."],
	["Keybindings","[SHIFT+i][SHIFT]+[h] Open Player Inventory<br/>[F1] Inspect Your Own Character<br/>[F2] Open Instructions Guide<br/>[Z/Y] Use earplugs<br/>[F4] Recombine magazines<br/>[F5] Latest changelog<br/>[F6] Push Boat<br/>[F7] Disable ambient sounds"],
	["Character Status","The status of the character can be noticed either by his actions like coughing, the status feed in the bottom right corner of your screen or via status indicators in your player menu accessible via [SHIFT]+[i] or [SHIFT]+[h].<br/><br/>Coughing = Sick<br/>You can only walk slowly = Broken leg<br/>. Most status are self-explanatory."],
	["Day Night Cycle","In Desolation night and day cycle happen a bit quicker than usual. Please note that especially night time will be over alot faster than day time."],
	["Tents and Stashes","Tents can be used to store items permanently. Tents and their content are persistent and will not be deleted by the server. Since they can hold alot of items they are useful tools to build camps and store your loot. Note that all tents are accessible by everyone so hide them well!"],
	["Recombining Magazines","You can recombine magazines by pressing F4 on your keyboard. If you don't have a Speedloader in your inventory, recombining your magazines will take way longer than with a speedloader."],
	["Chopping Wood","To gather wood you need a Hatchet and have to be close to a tree. Smaller trees may not count."],
	["Enhanced Movement","Desolation runs a modification known as Enhanced Movement. This modification allows you to vault over objects, climb over walls, fences and on house roofs. Due to a lack of available keys in ArmA the V key has been disabled for all actions. You can bind a key by pressing ESC then clicking on the first Keys entry on the very right of your screen then clicking on the three dots. This key will be saved throughout restarts of the game."],
	["Upgrading Buildings","To upgrade a building you need to make a upgrade kit using a blueprint and certain other items. You can upgrade your building buy using the upgrade kit while looking at your building."],
	["Donations","You can donate towards the project<br/><a color='#0097B2' size='1.7' href='http://paypal.me/A3Desolation'>by clicking here</a>"]
];

// Crafting
dz_crafting_items = [
	// Fill Canteen
	["DayZero_Item_Canteen",["Water"],["DayZero_Item_Canteen_Empty"],"z_fillwater_0",true],
	// Purified Water
	["DayZero_Item_Canteen_Purified",[],["DayZero_Item_Waterpure","DayZero_Item_Canteen"],"",true],
	// Boiled Water
	["DayZero_Item_Canteen_Boiled",["Fire"],["DayZero_Item_Canteen"],"z_cook_0",true],
	// Meat
	["DayZero_Item_Meat_Cooked",["Fire"],["DayZero_Item_Meat_Raw"],"z_cook_1",true],
	// Splint
	["DayZero_Item_Splint",[],["DayZero_Item_WoodPile","DayZero_Item_Bandage","DayZero_Item_Bandage"],"z_chopwood_0",true],
	// Fireplace Kit
	["DayZero_Item_CampfireKit",[],["DayZero_Item_WoodPile","DayZero_Item_Bandage"],"z_chopwood_0",true],
	["DayZero_Item_CampfireKit",[],["DayZero_Item_WoodPile","DayZero_Item_File1"],"z_chopwood_0",true],
	["DayZero_Item_CampfireKit",[],["DayZero_Item_WoodPile","DayZero_Item_File2"],"z_chopwood_0",true],
	["DayZero_Item_CampfireKit",[],["DayZero_Item_WoodPile","DayZero_Item_File3"],"z_chopwood_0",true],
	["DayZero_Item_CampfireKit",[],["DayZero_Item_WoodPile","DayZero_Item_File4"],"z_chopwood_0",true],
	// Chest
	["DayZero_Item_WoodBox",["SharpObject"],["DayZero_Item_WoodPile"],"z_chopwood_0",true],
	// Chest
	["DayZero_Item_SmallStash",["Shovel"],["DayZero_Item_WoodBox"],"",true],

	// Ghillie suit
	["TRYK_H_ghillie_top_headless_green",["SharpObject"],["DayZero_Item_Cloth","DayZero_Item_Cloth","DayZero_Item_Cloth","DayZero_Item_Cloth","DayZero_Item_Glue"],"z_bandage_0",true],
	["TRYK_H_ghillie_top_green",["SharpObject"],["TRYK_H_ghillie_top_headless_green","DayZero_Item_Cloth","DayZero_Item_Glue"],"z_bandage_0",true],
	["TRYK_H_ghillie_over_green",["SharpObject"],["TRYK_H_ghillie_top_green","DayZero_Item_Cloth","DayZero_Item_Cloth","DayZero_Item_Glue"],"z_bandage_0",true],

	// Blueprint for House with garage
	["DayZero_Item_Blueprint_SHL1_Construct",["SharpObject","Shovel"],["DayZero_Item_Blueprint_SHL1","DayZero_Item_Glue","DayZero_Item_Glue","DayZero_Item_Cloth","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_Scrapmetal"],"",true],
	["DayZero_Item_Blueprint_SHL2_Construct",["SharpObject","Shovel","ButaneTorch","DrillAku"],["DayZero_Item_Blueprint_SHL2","DayZero_Item_Glue","DayZero_Item_Glue","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_WoodPile"],"",true],
	["DayZero_Item_Blueprint_SHL3_Construct",["SharpObject","Shovel","ButaneTorch","DrillAku"],["DayZero_Item_Blueprint_SHL3","DayZero_Item_WoodPile","DayZero_Item_WoodPile","DayZero_Item_Scrapmetal","DayZero_Item_Scrapmetal","DayZero_Item_Scrapmetal"],"",true]
];

// Make all clothing items craftable into bandages
__ci_clothing_toAdd = [];
{
	{
		if !((_x select 0) in __ci_clothing_toAdd) then {
			__ci_clothing_toAdd pushBack (_x select 0);
		};
	} forEach (_x select 4);
} forEach [dz_sv_loot_residential_table,dz_sv_loot_industrial_table,dz_sv_loot_military_table];
{
	dz_crafting_items pushBack ["DayZero_Item_Bandage",[],[_x],"",true];
} forEach __ci_clothing_toAdd;

// Stations to refuel
dz_refuelBuildings = ["Land_Fuel_tank_stairs","Land_A_FuelStation_Feed","Land_Fuel_tank_big","Land_Ind_TankSmall2","Land_Ind_TankSmall"];

// HUD configuration
showHUD [true,true,false,true,true,true,false,true];

// Stamina
player enableStamina false;

// Useable Items
dz_useableItems = [
	// Food
	["DayZero_Item_Canteen_Boiled",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_Canteen_Purified",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_Canteen",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_MountainDew",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_ChocBar",dz_fnc_items_Consumeable,{dz_hunger < 100}],
	["DayZero_Item_TaviCola",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_RiceBox",dz_fnc_items_Consumeable,{dz_hunger < 100}],
	["DayZero_Item_TacticalBacon",dz_fnc_items_Consumeable,{dz_hunger < 100}],
	["DayZero_Item_Franta",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_Pasta",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_Sardines",dz_fnc_items_Consumeable,{dz_hunger < 100}],
	["DayZero_Item_BakedBeans",dz_fnc_items_Consumeable,{dz_hunger < 100}],
	["DayZero_Item_Cereal",dz_fnc_items_Consumeable,{dz_hunger < 100}],
	["DayZero_Item_Spirit",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_Redgull",dz_fnc_items_Consumeable,{dz_thirst < 100}],
	["DayZero_Item_Meat_Cooked",dz_fnc_items_Consumeable,{dz_hunger < 100}],
	["DayZero_Item_Meat_Raw",dz_fnc_items_Consumeable,{dz_hunger < 100}],

	// Antibiotics
	["DayZero_Item_Antibiotic",dz_fnc_items_Consumeable,{dz_infected}],

	// Random crafting recipe
	["DayZero_Item_File1",dz_fnc_displayRandomRecipe,{true}],
	["DayZero_Item_File2",dz_fnc_displayRandomRecipe,{true}],
	["DayZero_Item_File3",dz_fnc_displayRandomRecipe,{true}],
	["DayZero_Item_File4",dz_fnc_displayRandomRecipe,{true}],

	// Fire
	["DayZero_Item_CampfireKit",dz_fnc_items_CampfireKit,{true}],
	["DayZero_Item_GasCooker",dz_fnc_items_GasCooker,{true}],
	["DayZero_Item_Canteen_Boiled",dz_fnc_items_extinguishFire,{(typeOf cursorTarget in ["DayZero_Object_CampFire","DayZero_Object_GasCooker"]) AND !(isNil {cursorTarget getVariable "burning"}) AND (player distance cursorTarget < 1.5)}],
	["DayZero_Item_Canteen_Purified",dz_fnc_items_extinguishFire,{(typeOf cursorTarget in ["DayZero_Object_CampFire","DayZero_Object_GasCooker"]) AND !(isNil {cursorTarget getVariable "burning"}) AND (player distance cursorTarget < 1.5)}],
	["DayZero_Item_Canteen",dz_fnc_items_extinguishFire,{(typeOf cursorTarget in ["DayZero_Object_CampFire","DayZero_Object_GasCooker"]) AND !(isNil {cursorTarget getVariable "burning"}) AND (player distance cursorTarget < 1.5)}],
	["DayZero_Item_Matches",dz_fnc_items_Matches,{(typeOf cursorTarget in ["DayZero_Object_CampFire","DayZero_Object_GasCooker"]) AND (isNil {cursorTarget getVariable "burning"}) AND (player distance cursorTarget < 1.5)}],

	// Medical
	["DayZero_Item_Bloodbag_Empty",dz_fnc_items_BloodBag,{(isPlayer cursortarget) AND (player distance cursorTarget < 2)}],
	["DayZero_Item_Bloodbag",dz_fnc_items_BloodBag,{(isPlayer cursortarget) AND (player distance cursorTarget < 2)}],
	["DayZero_Item_Bandage",dz_fnc_items_Bandage,{(cursortarget getVariable ["bleeding",false]) OR (player getVariable ["bleeding",false])}],
	["DayZero_Item_Morphine",dz_fnc_items_Morphine,{(cursortarget getVariable ["brokenlegs",false]) OR (player getVariable ["brokenlegs",false])}],
	["DayZero_Item_Splint",dz_fnc_items_Morphine,{(cursortarget getVariable ["brokenlegs",false]) OR (player getVariable ["brokenlegs",false])}],

	// Hatchet

	["meleehatchet",dz_fnc_items_hatchet,{_trees = [];{if (str _x find ": t_" > -1) then {_trees pushBack _x;};} forEach nearestObjects [player, [], 15];if (count _trees > 0) then {true} else {false}}],

	// Jerry Can
	["DayZero_Item_JerryCan",dz_fnc_items_JerryCan,{cursorTarget isKindOf "LandVehicle" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" AND (player distance cursorTarget < 8)}],
	["DayZero_Item_JerryCan_Empty",dz_fnc_items_JerryCan,{((typeOf cursortarget) in dz_refuelBuildings) AND (player distance cursorTarget < 6)}],

	// Shovel (Hide Bodies)
	["DayZero_Item_Shovel",dz_fnc_items_Shovel,{!isNil {typeOf cursortarget getVariable "corpse"}}],

	// Tent
	["DayZero_Item_Tent",dz_fnc_items_BuildTent,{true}],
	["DayZero_Item_SmallStash",dz_fnc_items_BuildStash,{true}],

	// Knife
	["DayZero_Item_Knife",dz_fnc_items_gutAnimal,{{!alive _x} count (nearestObjects [player, ["Cock_random_F","Hen_random_F","Goat_random_F","Sheep_random_F","Rabbit_F"], 5]) > 0}],

	// Chemlight
	["Chemlight_green",dz_fnc_items_Chemlight,{isNull (player getVariable ["chemlight",objNull])}],
	["Chemlight_red",dz_fnc_items_Chemlight,{isNull (player getVariable ["chemlight",objNull])}],
	["Chemlight_yellow",dz_fnc_items_Chemlight,{isNull (player getVariable ["chemlight",objNull])}],
	["Chemlight_blue",dz_fnc_items_Chemlight,{isNull (player getVariable ["chemlight",objNull])}],

	// Basebuilding
	["DayZero_Item_Blueprint_SHL1_Construct",dz_fnc_bb_construct_base,{vehicle player == player}],
	["DayZero_Item_Blueprint_SHL2_Construct",dz_fnc_bb_upgrade_base,{vehicle player == player AND (cursorObject distance player < 10) AND (typeOf cursorObject == "Land_KH_OBJ_small") AND ((cursorObject getVariable ["BuildingLevel",1]) == 1)}],
	["DayZero_Item_Blueprint_SHL3_Construct",dz_fnc_bb_upgrade_base,{vehicle player == player AND (cursorObject distance player < 10) AND (typeOf cursorObject == "Land_KH_OBJ_small") AND ((cursorObject getVariable ["BuildingLevel",1]) == 2)}]
];

// Autosaving
dz_countSpawns = 105;
dz_clothes = ["U_BG_Guerilla3_1","U_BG_Guerilla2_3","U_BG_Guerilla2_1","U_BG_Guerilla2_2","TRYK_shirts_DENIM_BWH","TRYK_shirts_DENIM_R","TRYK_shirts_DENIM_ylb","TRYK_shirts_BLK_PAD_BLW","TRYK_shirts_BLK_PAD"];
dz_glasses = ["G_Aviator","G_Spectacles","G_Sport_Greenblack","G_Squares_Tinted","G_Shades_Black",""];
dz_headgear = ["H_Bandanna_gry","H_Bandanna_sand","H_Booniehat_oli","H_Booniehat_tan","H_Cap_blk","H_Cap_grn","H_Hat_grey","H_StrawHat_dark","H_Cap_grn_BI","H_Cap_blu",""];
dz_autoSaveAfterSeconds = 900;
dz_lastAutoSave = 0;

// Auto messages
dz_messages_hunger = [
	[100,"I have absolutely no hunger","#47FF38",[0,0.76,0.06,0.6]],
	[75,"I'm a little hungry","#47FF38",[0,0.61,0.09,0.6]],
	[50,"Something edible would be nice","#DE9B00",[0.41,0.45,0,0.6]],
	[25,"That car tire looks tasty","#9C6001",[0.6,0.3,0,0.6]],
	[0,"I'm dying of starvation","#E10B00",[1,0,0,0.6]]
];
dz_messages_thirst = [
	[100,"I have absolutely no thirst","#47FF38",[0,0.76,0.06,0.6]],
	[75,"I'm a little thirsty","#47FF38",[0,0.61,0.09,0.6]],
	[50,"My throat is dry","#DE9B00",[0.41,0.45,0,0.6]],
	[25,"I could drink from that puddle","#9C6001",[0.6,0.3,0,0.6]],
	[0,"I'm dying of dehydration","#E10B00",[1,0,0,0.6]]
];

// Other vars
dz_statusFeed = [];
dz_inAction = false;
dz_clothingMenuIndex = -1;
dz_glassesMenuIndex = -1;
dz_headGearMenuIndex = -1;
dz_isSpectating = false;
dz_exitEscWithOutAction = false;
AMB_BirdsFear = 0;
dz_sideChatWarningCount = 0;
dz_objectCount_Current = 0;
dz_fps_list = [];
dz_tooFast = -9999;
dz_logEntries = [];

// Post processing
/*
PostProcessingBorderVignette = ppEffectCreate ["colorCorrections", 1502];
PostProcessingBorderVignette ppEffectAdjust [0.7,1,-0.2,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0.85,0.85,0,0,0,0,4]];
PostProcessingBorderVignette ppEffectCommit 0;
PostProcessingBorderVignette ppEffectEnable true;
PostProcessingBackgroundBlur = ppEffectCreate ["dynamicBlur", 401];
PostProcessingBackgroundBlur ppEffectAdjust [1];
PostProcessingBackgroundBlur ppEffectCommit 0;
PostProcessingBackgroundBlur ppEffectEnable false;
PostProcessingDelirium = ppEffectCreate ["wetDistortion", 301];
PostProcessingDelirium ppEffectAdjust [2, 0.1, 0.1, 0.2, 0.2, 2, 2, 0.01, 0.01, 0.01, 0.01, 0.01, 0.1, 2, 2];
PostProcessingDelirium ppEffectCommit 0;
PostProcessingDelirium ppEffectEnable false;*/

//PostProcessingColorCorrections ppEffectAdjust [1, 1, -0.05, [0, 0, 0, 0], [0.8, 0.8, 0.8, 1], [0.1,0.1,0.1,0], [0,0,0,0,0,0,4]];

PostProcessingColorCorrections = ppEffectCreate ["colorCorrections", 1500];
PostProcessingColorCorrections ppEffectAdjust [1, 1, -0.05, [0, 0, 0, 0], [0.8, 0.8, 0.8, 1], [0.1,0.1,0.1,0], [0,0,0,0,0,0,4]];
PostProcessingColorCorrections ppEffectCommit 0;
PostProcessingColorCorrections ppEffectEnable true;












































/****************** DO NOT CHANGE CODE BELOW ******************/
// Food and Drink Eventhandler
dz_updateLiveFeed = 0;
dz_updateBrokenLegs = 0;
_id = addMissionEventHandler ["Draw3D",{
	if (diag_tickTime - dz_updateBrokenLegs > 1) then {
		if (dz_brokenLegs) then {
			player setHitPointDamage ["HitLegs",1];
			dz_updateBrokenLegs = diag_tickTime;
		} else {
			player setHitPointDamage ["HitLegs",0];
			dz_updateBrokenLegs = diag_tickTime;
		};


	};

	if ((diag_tickTime - dz_updateLiveFeed) > 120) then {
		dz_updateLiveFeed = diag_tickTime;
		[-1.35,-1.35] spawn dz_fnc_changeHungerThirst;
		[] call dz_fnc_savePlayerData;
	};
}];

dz_lastHeal = 0;
_id = addMissionEventHandler ["Draw3D",{
	if ((diag_tickTime - dz_lastHeal) > 60) then {
		if (dz_hunger < 15) then {
			//["<t color='" + "#47FF38" + "'>" + "I'm dying of starvation" + "</t>"] call dz_fnc_addToFeed;
			player setDamage (damage player + 0.025);
		};
		if (dz_thirst < 15) then {
			//["<t color='" + "#47FF38" + "'>" + "I'm dying of dehydration" + "</t>"] call dz_fnc_addToFeed;
			player setDamage (damage player + 0.025);
		};

		if (dz_hunger > 75 AND dz_thirst > 75 AND !dz_infected) then {
			player setDamage ((damage player) - 0.02);
			if ((round random 101) < 100) then {
				if !(damage player == 0) then {
					["<t color='" + "#1CFF1E" + "'>" + "I am regenerating blood" + "</t>"] call dz_fnc_addToFeed;
				};
			};
		};

		dz_lastHeal = diag_tickTime;

		// Antiside Chat count reducer
		if (dz_sideChatWarningCount > 0) then {
			dz_sideChatWarningCount = dz_sideChatWarningCount - 1;
		};

		// Anti sidechat
		if (difficulty == 3) then {
			1 enableChannel true;
		};

		// Infection
		if (dz_infected) then {
			player setDamage (damage player + 0.03);
			["<t color='#EB1800'>I really feel dizzy...</t>"] call dz_fnc_addToFeed;
		};
	};
}];

dz_lastScreenUpdate = 0;
dz_grayScreenEffect = ppEffectCreate ["ColorCorrections", 5000];
dz_countOnMe = 0;
//dz_blurryScreenEffect = ppEffectCreate ["DynamicBlur", 400];
_id = addMissionEventHandler ["Draw3D",{
	//_damage = (damage player)*2;
	_damage = damage player;
	//if (_damage > 1) then {_damage = 1};
	if (diag_tickTime - dz_lastScreenUpdate > 10) then {
		dz_countOnMe = dz_countOnMe + 1;
		// Spawn loot in vicinity
		//if (dz_countOnMe >= 3) then {
			[] spawn dz_fnc_lootSpawnerClient;
			//dz_countOnMe = 0;
		//};

		// Store FPS in memory for later // proper implementation at a later point
		//dz_fps_list pushBack diag_fps;

		dz_lastScreenUpdate = diag_tickTime;

		dz_grayScreenEffect ppEffectEnable true;
		dz_grayScreenEffect ppEffectAdjust
		[
			1,
			1 - ((damage player)*0.6),
			0,
			0, 0, 0, 0,
			1, 1, 1, 1 - ((_damage)*1),
			0.299 + ((_damage)*(0.701)), 0.587 + ((_damage)*(0.413)), 0.114 + ((_damage)*(0.886)), 0
		];
		dz_grayScreenEffect ppEffectCommit 10;

		//dz_blurryScreenEffect ppEffectEnable true;
		//dz_blurryScreenEffect ppEffectAdjust [damage player];
		//dz_blurryScreenEffect ppEffectCommit 5;

		if (player getVariable ["bleeding",false]) then {
			["<t color='#D90C01'>I am bleeding</t>"] call dz_fnc_addToFeed;
			player setDamage ((damage player) + 0.01);
		};

		if (surfaceIsWater (position player) AND (vehicle player == player) AND (((getPosATL player) select 2) < 1)) then {
			["<t color='#0148C7'>I feel cold</t>"] call dz_fnc_addToFeed;
			player setDamage ((damage player) + 0.005);
		};

		if (dz_infected) then {
			_sound = ["z_cough_0","z_cough_1","z_cough_2"] call BIS_FNC_selectRandom;
			[player,_sound] remoteExec ["say3D"];
		};

		if (damage player > 0.5) then {
			_r = random 100;
			if (_r < 1) then {
				//[] spawn dz_fnc_fallUnconscious;
			};
		};


		// Anti cheat measures
		if (vehicle player != player) then {
			if !((typeOf _x) in dz_sv_allowedVehicleTypes) then {
				deleteVehicle (vehicle player);
			};
		};
	};

	_items = (vestItems player) + (backpackItems player) + (uniformItems player);
	if ("DayZero_Item_MobilePhone" in _items) then {
		//1 enableChannel true;
	} else {
		//1 enableChannel true;
	};
}];


player addEventHandler ["Fired",{
	if (!((((primaryWeaponItems player) select 0) != "" AND ((currentWeapon player) == (primaryWeapon player))) OR (((handgunItems player) select 0) != "" AND ((currentWeapon player) == (handgunWeapon player)))) AND (currentWeapon player != "meleehatchet")) then {
		if (isNil {player getVariable "fired"}) then {
			player setVariable ["fired",true,true];
			[] spawn {
				uisleep 4;
				player setVariable ["fired",nil,true];
			};
		};
	};
}];
player addEventHandler ["InventoryOpened",{
	if ((_this select 1) getVariable ["isPlayer",false] AND (isNil {(_this select 1) getVariable "isPlayerCorpse"}) AND !alive (_this select 1)) then {
		true
	};
}];

// For Crafting
dz_crafting_products = [];
{
	dz_crafting_products pushBack [_x select 0];
} forEach dz_crafting_items;

// Function to fetch details
dz_fnc_itemDetails = {

	private["_entity","_cfg","_ret","_type","_acc_p","_acc_o","_acc_m","_scope","_displayName","_picture","_config","_itemInfo","_muzzles","_magazines","_desc"];
	_entity = _this select 0;
	_displayName = "";
	_picture = "";
	_acc_p = [];
	_acc_m = [];
	_acc_o = [];
	_magazines = [];
	_muzzles = [];
	_type = "";
	_itemInfo = "";
	_scope = 0;
	if(_entity == "") exitWith {[]};
	_cfg = if(isNil {_this select 1}) then
	{
		switch (true) do
		{
			case (isClass (configFile >> "CfgMagazines" >> _entity)) : {"CfgMagazines";};
			case (isClass (configFile >> "CfgWeapons" >> _entity)) : {"CfgWeapons";};
			case (isClass (configFile >> "CfgVehicles" >> _entity)) : {"CfgVehicles";};
			case (isClass (configFile >> "CfgGlasses" >> _entity)) : {"CfgGlasses";};
		};
	}
		else
	{
		_this select 1
	};

	_ret = [];
	if(typeName _cfg != "STRING") exitWith {[]};
	if(!isClass (configFile >> _cfg >> _entity)) exitWith {[]};
	if(_cfg == "") exitWith {[]};

	_config = configFile >> _cfg >> _entity;
	_displayName = getText(_config >> "displayName");
	_picture = getText(_config >> "picture");
	_desc = getText(_config >> "descriptionshort");

	switch (_cfg) do
	{
		case "CfgVehicles":
		{
			_type = getText(_config >> "vehicleClass");
			_scope = getNumber(_config >> "scope");
		};

		case "CfgWeapons":
		{
			_scope = getNumber(_config >> "scope");
			_type = getNumber(_config >> "type");
			_desc = getText(_config >> "descriptionshort");

			if(isClass (_config >> "WeaponSlotsInfo")) then
			{
				if(isClass (_config >> "WeaponSlotsInfo")) then
				{
					_acc_p = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
					_acc_o = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
					_acc_m = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
				};
			};

			if(isClass (_config >> "ItemInfo")) then
			{
				_itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
			};
			_muzzles = getArray(_config >> "muzzles");
			_magazines = getArray(_config >> "magazines");
			if(!isNil {_muzzles}) then
			{
				private["_tmp","_base"];
				_base = inheritsFrom (configFile >> "CfgWeapons" >> _entity);
				{
					if(_x != "this") then
					{
						_tmp = getArray(_base >> _x >> "magazines");
						{
							_magazines set[count _magazines, _x];
						} foreach (_tmp);
					};
				} foreach _muzzles;
			};
		};

		case "CfgMagazines":
		{
			_scope = getNumber(_config >> "scope");
		};
	};

	_ret = [_entity,_displayName,_picture,_scope,_type,_itemInfo,_cfg,_magazines,_muzzles,_desc,_acc_p,_acc_o,_acc_m];
	_ret;
};

BIS_fn_createFireEffect = {
	private["_effect","_pos","_fire","_smoke"];
	private["_light","_brightness","_color","_ambient","_intensity","_attenuation"];

	_pos 	= _this select 0;
	_effect = _this select 1;

	_fire	= "";
	_smoke	= "";
	_light	= objNull;
	_color		= [1,0.85,0.6];
	_ambient	= [1,0.3,0];

	switch (_effect) do {
		case "FIRE_SMALL" : {
			_fire 	= "SmallDestructionFire";
			_smoke 	= "SmallDestructionSmoke";
			_brightness	= 1.0;
			_intensity	= 200;
			_attenuation	= [0,0,0,2];
		};
		case "FIRE_MEDIUM" : {
			_fire 	= "MediumDestructionFire";
			_smoke 	= "MediumDestructionSmoke";
			_brightness	= 1.0;
			_intensity	= 400;
			_attenuation	= [0,0,0,2];
		};
		case "FIRE_BIG" : {
			_fire 	= "BigDestructionFire";
			_smoke 	= "BigDestructionSmoke";
			_brightness	= 1.0;
			_intensity	= 1600;
			_attenuation	= [0,0,0,1.6];
		};
		case "SMOKE_SMALL" : {
			_smoke 	= "SmallDestructionSmoke";
		};
		case "SMOKE_MEDIUM" : {
			_smoke 	= "MediumSmoke";
		};
		case "SMOKE_BIG" : {
			_smoke 	= "BigDestructionSmoke";
		};
	};

	_eFire = objNull;
	if (_fire != "") then {
		_eFire = "#particlesource" createVehicleLocal _pos;
		_eFire setParticleClass _fire;
		_eFire setPosATL _pos;
	};
	_eSmoke = objNull;
	if (_smoke != "") then {
		_eSmoke = "#particlesource" createVehicleLocal _pos;
		_eSmoke setParticleClass _smoke;
		_eSmoke setPosATL _pos;
	};

	_light = objNull;
	//create lightsource
	if (_effect in ["FIRE_BIG","FIRE_MEDIUM","FIRE_SMALL"]) then {
		_pos   = [_pos select 0,_pos select 1,(_pos select 2)+1];
		_light = createVehicle ["#lightpoint", _pos, [], 0, "CAN_COLLIDE"];
		_light setPosATL _pos;

		_light setLightBrightness _brightness;
		_light setLightColor _color;
		_light setLightAmbient _ambient;
		_light setLightIntensity _intensity;
		_light setLightAttenuation _attenuation;
		_light setLightDayLight false;
	};

	[_eFire,_eSmoke,_light]
};

// Breath
[] spawn {
	while {true} do {
		_unit = player;
		_int = 0.01;
		waitUntil {daytime > 6};
		while {daytime < 7} do {
			uisleep (2 + random 2); // random time between breaths

			_source = "logic" createVehicleLocal (getpos _unit);
				_fog = "#particlesource" createVehicleLocal getpos _source;
				_fog setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0],
				"",
				"Billboard",
				0.5,
				0.5,
				[0,0,0],
				[0, 0.2, -0.2],
				1, 1.275,	1, 0.2,
				[0, 0.2,0],
				[[1,1,1, _int], [1,1,1, 0.01], [1,1,1, 0]],
				[1000],
				1,
				0.04,
				"",
				"",
				_source];
				_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
				_fog setDropInterval 0.001;

			_source attachto [_unit,[0,0.15,0], "neck"]; // get fog to come out of player mouth

			uisleep 0.5; // 1/2 second exhalation
			deletevehicle _source;
		};
	};
};

//////////////
[] spawn {
	if (getPlayerUID player in ["76561198070212312","76561197961957254"]) then {

		[] spawn {

			if (isDedicated) exitWith {};
			if (!isNil{aero_player_markers_pos}) exitWith {};

			private ["_marker","_markerText","_temp","_unit","_vehicle","_markerNumber","_show","_injured","_text","_num","_getNextMarker","_getMarkerColor","_showAllSides","_showPlayers","_showAIs","_l"];

			_showAllSides=true;
			_showPlayers=true;
			_showAIs=true;

			{
				_l=toLower _x;
				if(_l in ["player","players"]) then {
					_showPlayers=true;
				};
				if(_l in ["ai","ais"]) then {
					_showAIs=true;
				};
				if(_l in ["allside","allsides"]) then {
					_showAllSides=true;
				};
			} forEach _this;

			aero_player_markers_pos = [0,0];
			onMapSingleClick "aero_player_markers_pos=_pos;";

			_getNextMarker = {
				private ["_marker"];
				_markerNumber = _markerNumber + 1;
				_marker = format["um%1",_markerNumber];
				if(getMarkerType _marker == "") then {
					createMarkerLocal [_marker, _this];
				} else {
					_marker setMarkerPosLocal _this;
				};
				_marker;
			};

			_getMarkerColor = {
				[(((side _this) call bis_fnc_sideID) call bis_fnc_sideType),true] call bis_fnc_sidecolor;
			};

			while {true} do {

				waitUntil {
					uisleep 0.025;
					true;
				};

				_markerNumber = 0;

				{
					_show = false;
					_injured = false;
					_unit = _x;

					if(
						(
							(_showAIs && {!isPlayer _unit} && {0=={ {_x==_unit} count crew _x>0} count allUnitsUav}) ||
							(_showPlayers && {isPlayer _unit})
						) && {
							_showAllSides || side _unit==side player
						}
					) then {
						if((crew vehicle _unit) select 0 == _unit) then {
							_show = true;
						};
						if(!alive _unit || damage _unit > 0.9) then {
							_injured = true;
						};
						if(!isNil {_unit getVariable "hide"}) then {
							_show = false;
						};
						if(_unit getVariable ["BTC_need_revive",-1] == 1) then {
							_injured = true;
							_show = false;
						};
						if(_unit getVariable ["NORRN_unconscious",false]) then {
							_injured = true;
						};
					};

					if(_show) then {
						_vehicle = vehicle _unit;
						_pos = getPosATL _vehicle;
						_color = _unit call _getMarkerColor;

						_markerText = _pos call _getNextMarker;
						_markerText setMarkerColorLocal _color;
			 			_markerText setMarkerTypeLocal "c_unknown";
						_markerText setMarkerSizeLocal [0.8,0];

						_marker = _pos call _getNextMarker;
						_marker setMarkerColorLocal _color;
						_marker setMarkerDirLocal getDir _vehicle;
						_marker setMarkerTypeLocal "mil_triangle";
						_marker setMarkerTextLocal "";
						if(_vehicle == vehicle player) then {
							_marker setMarkerSizeLocal [0.8,1];
						} else {
							_marker setMarkerSizeLocal [0.5,0.7];
						};

			 			if(_vehicle != _unit && !(_vehicle isKindOf "ParachuteBase")) then {
							_text = format["[%1]", getText(configFile>>"CfgVehicles">>typeOf _vehicle>>"DisplayName")];
							if(!isNull driver _vehicle) then {
								_text = format["%1 %2", name driver _vehicle, _text];
							};

							if((aero_player_markers_pos distance getPosATL _vehicle) < 50) then {
								aero_player_markers_pos = getPosATL _vehicle;
								_num = 0;
								{
									if(alive _x && isPlayer _x && _x != driver _vehicle) then {
										_text = format["%1%2 %3", _text, if(_num>0)then{","}else{""}, name _x];
										_num = _num + 1;
									};
								} forEach crew _vehicle;
							} else {
								_num = {alive _x && isPlayer _x && _x != driver _vehicle} count crew _vehicle;
								if (_num>0) then {
									if (isNull driver _vehicle) then {
										_text = format["%1 %2", _text, name (crew _vehicle select 0)];
										_num = _num - 1;
									};
									if (_num>0) then {
										_text = format["%1 +%2", _text, _num];
									};
								};
							};
						} else {
							_text = name _x;
						};
						_markerText setMarkerTextLocal _text;
					};

				} forEach (allUnits + allMissionObjects "Car");


				{
					if(isUavConnected _x) then {
						_unit=(uavControl _x) select 0;
						if(
							(
								(_showAIs && {!isPlayer _unit}) ||
								(_showPlayers && {isPlayer _unit})
							) && {
								_showAllSides || side _unit==side player
							}
						) then {
							_color = _x call _getMarkerColor;
							_pos = getPosATL _x;

							_marker = _pos call _getNextMarker;
							_marker setMarkerColorLocal _color;
							_marker setMarkerDirLocal getDir _x;
							_marker setMarkerTypeLocal "mil_triangle";
							_marker setMarkerTextLocal "";
							if(_unit == player) then {
								_marker setMarkerSizeLocal [0.8,1];
							} else {
								_marker setMarkerSizeLocal [0.5,0.7];
							};

							_markerText = _pos call _getNextMarker;
							_markerText setMarkerColorLocal _color;
							_markerText setMarkerTypeLocal "c_unknown";
							_markerText setMarkerSizeLocal [0.8,0];
							_markerText setMarkerTextLocal format["%1 [%2]", name _unit, getText(configFile>>"CfgVehicles">>typeOf _x>>"DisplayName")];
						};
					};
				} forEach allUnitsUav;




				_markerNumber = _markerNumber + 1;
				_marker = format["um%1",_markerNumber];
				while {(getMarkerType _marker) != ""} do {
					deleteMarkerLocal _marker;
					_markerNumber = _markerNumber + 1;
					_marker = format["um%1",_markerNumber];
				};

			};


		};


		[] spawn {
			markerlooper = true;
			while {markerlooper} do {
				myMarkers = [];
				{
					_r = "marker" + str (round random 10000);
					createMarkerLocal [_r, position _x];
					_r setMarkerTypeLocal "mil_dot";
					_r setMarkerTextLocal str _x;
					myMarkers pushBack _r;
				} forEach (allMissionObjects "LandVehicle" + allMissionObjects "Air" + allMissionObjects "Ship");
				uisleep 1;
				{
					deleteMarkerLocal _x;
				} forEach myMarkers;
			};
		};
	};
};

// Return true if the file was called
true

