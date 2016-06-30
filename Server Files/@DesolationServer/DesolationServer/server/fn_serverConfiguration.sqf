scriptName "fn_serverConfiguration";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_serverConfiguration.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_serverConfiguration.sqf"

/************* SERVER VARIABLES *************/

/******/ dz_sv_gameVersion = "Development Build 0.57.04"; /******/

// Day Night Cycle
dz_sv_fastDayNightCycle = true;
dz_sv_dayNightCycleMulti_Night = 40;
dz_sv_dayNightCycleMulti_Day = 5;

// Animal configuration
dz_sv_animalTypes = ["Cock_random_F","Hen_random_F","Goat_random_F","Sheep_random_F"];

// Loot multiplicator
dz_sv_loot_multiplicator = [
	0, // Residential
	0, // Industrial
	0, // Low Military
	0.05 // Military
];

// Server
dz_sv_uptime = 14400;
dz_sv_maxGroundWeaponHolders = 1400;
dz_sv_logPrefix = "DSL-SERVERLOG";
//

// Basebuilding configuration
dz_sv_basebuilding_data =
[	// Construction Item, Classname, Preview rotate degree, player preview offset, weaponholders offsets
	["DayZero_Item_Blueprint_SHL1_Construct","Land_KH_OBJ_small",270,[2,8,0],["barrel_1"]]
];

// Zombie configuration
dz_sv_zombies_maxCount = 320;
dz_sv_zombies_maxRadius = 250;
dz_sv_zombies_inMaxRadiusMaxZombies = 5;
dz_sv_zombies_zombiesPerBuilding = 1;
dz_sv_zombies_MaxZombiesInRadius = 150;
dz_sv_zombies_damage = 200;
dz_sv_zombieRange = 2.6;
Ryanzombiesattackdistance = dz_sv_zombieRange;

publicVariable "dz_sv_zombies_maxCount";
publicVariable "dz_sv_zombies_maxRadius";
publicVariable "dz_sv_zombies_inMaxRadiusMaxZombies";
publicVariable "dz_sv_zombies_zombiesPerBuilding";
publicVariable "dz_sv_zombieRange";

dz_sv_zombies_civilian_day = [
	"RyanZombieC_scientist_FmediumOpfor",
	"RyanZombieC_OrestesmediumOpfor",
	"RyanZombieC_man_polo_1_FmediumOpfor",
	"RyanZombieC_man_polo_4_FmediumOpfor",
	"RyanZombieC_man_hunter_1_FmediumOpfor",
	"RyanZombieC_man_p_fugitive_FmediumOpfor",
	"RyanZombieC_man_polo_1_Fmedium",
	"RyanZombieC_man_1medium",
	"RyanZombieC_journalist_Fmedium",
	"RyanZombieC_man_pilot_Fmedium",
	"RyanZombieC_man_polo_5_Fmedium",
	"RyanZombieC_Nikosmedium",
	"RyanZombieC_man_w_worker_Fmedium",
	"RyanZombieC_man_polo_5_FslowOpfor",
	"RyanZombieC_man_polo_6_FslowOpfor",
	"RyanZombieC_man_polo_5_FslowOpfor",
	"RyanZombieC_man_polo_6_FslowOpfor",
	"RyanZombieC_man_polo_5_FslowOpfor"
];
//publicVariable "dz_sv_zombies_civilian";
dz_sv_zombies_civilian_night = [
	"RyanZombieB_Soldier_03_f_1_1",
	"RyanZombieB_Soldier_03_f_1",
	"RyanZombieB_Soldier_lite_F",
	"RyanZombieB_Soldier_02_f_1",
	"RyanZombieB_Soldier_03_f_1_1",
	"RyanZombieB_Soldier_03_f_1",
	"RyanZombieB_Soldier_lite_F",
	"RyanZombieB_Soldier_02_f_1",
	"RyanZombieC_scientist_FmediumOpfor",
	"RyanZombieC_OrestesmediumOpfor",
	"RyanZombieC_man_polo_1_FmediumOpfor",
	"RyanZombieC_man_polo_4_FmediumOpfor",
	"RyanZombieC_man_hunter_1_FmediumOpfor",
	"RyanZombieC_man_p_fugitive_FmediumOpfor",
	"RyanZombieC_man_polo_1_Fmedium",
	"RyanZombieC_man_1medium",
	"RyanZombieC_journalist_Fmedium",
	"RyanZombieC_man_pilot_Fmedium",
	"RyanZombieC_man_polo_5_Fmedium"
];
//publicVariable "dz_sv_zombies_civilian";

// Drops configuration
dz_sv_droppoints_prefix = "dz_droplocation_";
dz_sv_droppoints_amount = 28;

// Custom Loot spots in buildings
dz_sv_customLootSpots = [
	["MILITARY","CampEast_EP1",[[0.0830078,-0.572266,-1.1752]]],
	["MILITARY","Land_tent_east",[[-0.273926,-0.00830078,-1.74948]]],
	["MILITARY","Land_m113T",[[0.549805,3.53491,-1.25855]]],
	["MILITARY","Land_Wreck_UH60",[[-3.23132,0.520996,-1.94331],[-0.490234,-8.73145,-1.94332]]],
	["MILITARY","Land_Mi8_Crashed",[[2.87158,-5.43457,-1.69794],[0.784668,1.96704,-1.69794],[-2.81689,-7.00122,-1.69793]]],
	["RESIDENTIAL","Land_A_Office01",[[-6.56445,4.48047,-4.53223],[-0.239258,-1.65845,-4.53223],[2.33203,4.875,-4.53223],[12.4258,-3.0166,-4.53223],[-0.807617,-3.00684,-4.53223],[3.75879,5.30225,-2.03223],[13.5742,5.16602,-2.03223],[1.41602,1.25391,0.467779],[-4.00098,4.12598,1.41379],[-9.02539,2.43799,0.467779]]],
	["RESIDENTIAL","Land_A_MunicipalOffice",[[-3.48926,-6.49341,-18.4904],[0.0253906,-6.4209,-18.4904],[3.49854,-6.85229,-18.4904],[-0.00341797,-9.73071,-18.7677]]],
	["RESIDENTIAL","Land_A_GeneralStore_01a",[[-7.71289,6.01978,-1.205],[-4.45703,4.44458,-0.201091],[-3.77148,6.57056,-0.201091],[-0.261719,6.30981,-0.303609],[4.64844,6.82007,-1.01259],[5.91602,6.69019,-0.303609],[4.83984,6.64282,0.0515194],[-1.17188,8.25269,-1.205],[1.95215,8.45142,-1.205],[5.72461,8.12061,-1.205],[8.28613,7.53101,-1.205],[13.0342,8.16626,-1.205],[11.8301,6.19702,-1.01259],[11.8086,4.20532,-1.01259],[11.9395,4.15161,-0.303609],[11.8281,6.36108,-0.303609],[6.66797,4.01611,-0.827517],[6.09766,1.13989,-0.514904],[7.5498,1.05371,-0.514903],[1.71191,1.05981,-0.514902],[0.0283203,3.32446,-1.01259],[-2.31934,2.20239,-1.205],[-5.55078,1.00244,-1.205],[-4.30957,0.746582,-1.205],[2.93164,-0.206543,-1.205],[12.957,-4.25073,-1.205],[9.87109,-3.99487,-1.205],[10.2568,-1.26758,-1.205],[14.4043,0.442627,-1.205],[6.44531,-3.19214,-0.727781],[6.34473,-3.21729,-1.10278],[6.44727,-3.19141,-0.347781],[-0.671875,-4.99292,-1.10278],[1.88477,-4.84448,-0.7899806],[3.60547,-4.95532,-1.10278],[4.65234,-4.91772,-0.72778],[2.2168,-5.03052,-0.34778],[-0.117742,-4.99683,-0.34778],[2.36523,-3.82178,-0.657626],[-2.65723,-4.48267,-1.205],[-6.49902,-3.17163,-1.205],[-4.17676,-3.08105,-0.72778],[-4.1748,-3.08154,0.0322199],[-4.06348,-1.32764,-0.347781],[-2.55957,-1.40176,0.0322199],[1.17254,-1.41797,-0.347781],[-0.117742,-1.29053,-1.10278]]],
	["MILITARY","Land_bmp2_wrecked",[[0.191406,-2.71484,0.230148],[0.546875,3.50488,-0.888153]]],
	["MILITARY","Land_BRDM2_wrecked",[[-1.93262,2.37793,-0.59917],[0.854492,-0.7856055,0.632538]]],
	["MILITARY","Land_BMP2_AF",[[-0.5,4.5332,-1.31131],[1.9707,-3.89648,-1.30386],[-2.80078,-0.418945,-1.17916]]],
	["MILITARY","Land_Mi8_Crashed",[[-0.277344,-6.01855,-1.69794],[-0.289063,-3.7251,-1.69794],[-0.136719,-1.71191,-1.69791]]],
	["MILITARY","Land_uralT",[[-0.106445,-1.93848,-1.39914],[-0.30127,3.00977,-1.39911],[-2.36523,0.558594,-1.39912]]],
	["MILITARY","Land_Wreck_C130J_ep1",[[-0.467773,-8.31055,-4.61386],[-0.424805,-12.9434,-4.79152],[0.418945,-15.7188,-4.98825],[0.443848,-18.6797,-5.10149],[-1.25244,-18.2949,-4.89998],[-1.25391,-15.6113,-4.79968],[-0.528809,0.107422,-5.43436]]],
	["RESIDENTIAL","Land_A_GeneralStore_01",[[-5.71338,0.730469,-0.20253],[-4.98096,3.00684,-0.20253],[-8.57031,3.48438,-1.205],[-8.61816,-3.02246,-1.205],[-6.05371,-2.47754,-1.205],[-1.26855,1.16504,-1.205],[3.17041,0.108398,-0.305046],[5.13184,2.64258,0.0500813],[3.45215,3.0459,0.0500813],[5.68506,3.15625,-1.01403],[10.7734,2.41016,-1.01403],[10.562,0.68457,-1.01403],[10.6484,0.504883,-0.305046],[10.6035,2.57324,-0.305046],[11.8716,0.96582,-1.205],[6.56201,-2.56348,-0.51634],[2.77588,-2.57129,-0.51634],[-1.07031,-2.58691,-0.51634],[5.18506,-6.7959,-0.729219],[12.0034,-7.93262,-1.205],[9.00244,-4.97949,-1.205],[13.062,-3.41406,-1.205],[2.59082,-8.61328,-0.729219],[1.02539,-8.62109,-0.349218],[-1.36377,-8.7168,0.0307808],[-3.52588,-7.11035,0.0307808],[-3.51221,-7.13379,-1.205],[-4.50342,-4.99805,0.0307808],[-5.26953,-6.73633,-1.10422],[-8.47998,-6.20605,-1.205],[-8.58203,-8.23535,-1.205],[-6.25146,-5.18652,0.415627],[-6.8252,-5.10938,0.415781],[1.63379,-5.06152,-0.349218],[0.255371,-5.0791,-0.349218],[-0.517578,-5.1084,-0.729219],[-7.55322,-9.91504,-1.215],[-3.72119,-9.97168,-1.215],[0.847168,-9.95215,-1.215],[5.31689,-10.4658,-1.215],[8.22803,-10.1113,-1.215],[12.6538,-10.1172,-1.215]]],
	["MEDICAL","Land_A_Hospital",[[-15.915,-2.49512,-7.3686],[-12.0493,-1.78809,-7.3686],[-4.66211,-3.90723,-6.36603],[-6.10693,-0.920898,-6.90654],[2.55762,-0.977539,-6.90767],[3.85938,-3.94727,-7.3686],[8.05713,-4.52246,-7.3686],[8.15967,-0.972656,-6.90546],[9.52197,-1.01855,-6.90366],[16.8618,-4.00293,-6.90827],[5.88477,-3.40723,-6.90885]]],
	["MILITARY","Arma3Taviana_Land_Mil_Barracks",[[3.82813,-2.44629,-1.94879],[5.21094,-2.42676,-1.94879],[6.56152,-2.44629,-1.94879],[5.61426,3.5166,-1.94878],[-0.764648,-3.19336,-1.52396],[-3.67969,-3.15137,-1.52396],[-6.61035,-3.23926,-0.733519],[-6.24023,3.15039,-0.733732],[-3.58105,3.14941,-1.52396],[-1.29492,3.23828,-1.52396],[-3.33984,-0.0556641,-1.94879]]],
	["MILITARY","Arma3Taviana_Land_Mil_House",[[-7.15137,4.24707,-4.99466],[-9.92871,1.61816,-4.15715],[-11.9971,4.34277,-4.15715],[-2.58594,0.53125,-4.99466],[-13.5322,-2.26563,-4.99466],[-6.29004,-0.136719,-0.438255],[-1.82422,-1.66699,-0.887655],[-7.63574,-5.9248,-0.128152],[-5.1875,-5.95508,-0.128152],[-3.1377,-5.96484,-0.128152],[-14.5469,-6.94629,-0.887655],[-12.6582,-4.58203,-0.887655]]],
	["MILITARY","Land_Mil_Barracks_i",[[2.79688,-1.47656,-1.11452],[2.9707,-0.896973,-0.700653],[2.94336,-2.04004,-0.700653],[2.98633,-2.07129,0.0906372],[2.89648,-0.790039,0.0890961],[1.54492,-1.10791,-1.11452],[-0.341797,-1.12891,-0.700653],[-0.396484,-2.02051,0.0904541],[-0.433594,-1.65576,-1.11452],[-3.44727,-1.9541,0.0903625],[-3.49609,-1.00293,0.0892181],[-3.42383,-1.00293,-0.700653],[-3.45898,-2.14014,-0.700653],[-3.51563,-2.12451,-1.11452],[-3.47656,-0.962891,-1.11452],[-5.35742,-2.17041,-1.11452],[-4.97852,-0.435547,-1.11452],[-6.8125,-1.06641,-0.700653],[-6.60156,-2.125,0.0906677],[-6.91992,-1.95996,-1.11452],[-7.05664,0.167969,-1.11452],[-8.55664,-1.44629,-1.11452],[6.49316,-0.00341797,-1.11452],[6.39453,-1.24463,-1.11452],[6.51831,-2.46582,-1.11452],[4.98242,-2.43799,-1.11452],[5.10474,-0.371582,-1.11452],[4.15137,-0.381836,-0.0880203],[4.11499,-1.11377,-0.0880203],[4.31177,-2.04932,-0.0880203]]],
	["RESIDENTIAL","Land_A_Castle_Bergfrit",[[-2.2168,3.84814,-0.639023],[2.50293,3.93213,1.82468],[2.67114,2.51611,1.82468],[2.57153,0.73291,1.82468],[2.729,-3.59277,3.84039],[2.60986,-3.68604,3.84039],[-2.23657,-3.63281,6.30399],[-0.794434,-2.12744,8.76549],[1.18604,-1.66455,8.76549],[1.33325,2.41309,8.76549],[2.52271,4.10303,8.76549],[-0.203857,3.50146,8.76549],[-0.967285,2.50684,8.76549],[3.16357,-4.34912,11.0052],[-2.39282,-4.30811,13.4688],[-1.4458,-4.38232,13.3702],[2.24902,4.70068,16.8546],[-2.88184,4.72559,16.8546],[-0.59375,2.35986,16.8546],[-0.29541,-1.22119,16.8546],[4.1814,-5.7085,16.8546],[-2.40332,-3.83789,16.8546],[1.55029,2.1333,16.8546]]],
	["MILITARY","Land_Mil_ControlTower",[[0.947266,4.18848,-9.69014],[2.4707,5.83496,-9.69014],[3.97266,4.4043,-9.69014],[7.62305,5.58594,-9.69014],[9.09766,4.14551,-9.69014],[9.73242,3.91504,-7.43514],[9.8457,5.57617,-7.43514],[5.27539,4.39063,-5.50014],[4.99219,5.80664,-5.50014],[2.36523,5.48633,-5.50014],[5.96484,3.58301,-0.3885],[6.0332,4.01953,-0.246307],[6.03711,3.99219,0.133692],[7.75,3.82129,-1.07984],[7.53906,1.98047,-0.375875],[7.52344,1.7793,-1.07984],[5.16211,-1.63086,-0.375875],[7.18164,-1.44922,-1.07984],[2.41211,-0.333984,-1.07984],[3.5957,1.31445,-1.07984],[4.95313,0.133789,-1.07984],[2.5957,5.90723,-1.10472],[9.44141,4.62207,-1.10472],[9.63477,-1.04883,-1.10472],[-0.0136719,0.915039,-1.10472],[-0.00976563,-2.63477,-1.10472],[6.93359,3.59961,2.70016],[5.25586,-1.29102,2.70016],[1.86914,-1.02148,2.70016],[2.25195,3.5,2.70016]]]
];

dz_sv_customLootSpots_types = [];
{
	dz_sv_customLootSpots_types pushBack (_x select 1);
} forEach dz_sv_customLootSpots;
publicVariable "dz_sv_customLootSpots";publicVariable "dz_sv_customLootSpots_types";

// Vehicle configuration
dz_sv_spawnpoints_prefix = "vehiclespawn_v_";
dz_sv_amountSpawnpoints = 21;
dz_sv_spawnpoints = [];
dz_sv_vehicleTypes = [
	"CUP_I_UAZ_Unarmed_UN",
	"CUP_B_UAZ_Unarmed_CDF",
	"B_Quadbike_01_F",
	"B_Quadbike_01_F",
	"B_Quadbike_01_F",
	"CUP_B_LR_Transport_GB_D",
	"CUP_C_Ural_Civ_01",
	"CUP_B_HMMWV_Unarmed_USA",
	"CUP_C_LR_Transport_CTK",
	"CUP_C_Datsun",
	"RDS_Ikarus_Civ_01",
	"RDS_S1203_Civ_01",
	"RDS_Lada_Civ_02",
	"RDS_Gaz24_Civ_01",
	"RDS_Lada_Civ_04",
	"RDS_Gaz24_Civ_02"
];
diag_log format ["DEBUGGING::: %1",dz_sv_vehicleTypes];

switch (worldName) do {
	case "FDF_Isle1_a": { // PODAGORSK ==================================
		// Helicopters
		dz_sv_helis_info = [
			[[[9807.25,3884.35,0.00143957],63.6738],"B_Heli_Light_01_F",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[8091.28,4196.97,0.00143957],270.618],"UH1H_LMG",[random 0.8,random 1,random 1,random 1,random 1,random 1]]
		];
		dz_sv_boats_info = [
		];
		dz_sv_specialVehicle_info = [
		];

		// Other stuff
		dz_sv_vehicleAmountTotal = 20;
		dz_sv_boatAmountTotal = count dz_sv_boats_info;
		dz_sv_AircraftAmountTotal = count dz_sv_helis_info;
		dz_sv_specialVehicleAmountTotal = count dz_sv_specialVehicle_info;
	};
	case "Chernarus_Summer": { // CHERNARUS ==================================
		// Helicopters
		dz_sv_helis_info = [
			[[[4892.04,10133.1,0.00143433],239.59],"B_Heli_Light_01_F",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[12008.8,12633,0.00143433],20.1588],"UH1H_LMG",[random 0.8,random 1,random 1,random 1,random 1,random 1]]
		];
		dz_sv_boats_info = [
		];
		dz_sv_specialVehicle_info = [
		];

		// Other stuff
		dz_sv_vehicleAmountTotal = 20;
		dz_sv_boatAmountTotal = count dz_sv_boats_info;
		dz_sv_AircraftAmountTotal = count dz_sv_helis_info;
		dz_sv_specialVehicleAmountTotal = count dz_sv_specialVehicle_info;
	};
	case "taviana": { // TAVIANA ==================================
		// Helicopters
		dz_sv_helis_info = [
			[[[7776.62,7889.5,0.00144196],217.674],"B_Heli_Light_01_F",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[16769.8,10230.2,0.00143814],270.177],"UH1H_LMG",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[22688.8,20012.6,0.00143862],179.909],"CUP_C_C47_CIV",[]],
			[[[6130.65,17595.6,-0.0278091],95.2545],"CUP_O_Mi8_CHDKZ",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[9159.39,14928.3,-0.0160503],358.8],"CUP_B_Merlin_HC3_GB",[random 0.8,random 1,random 1,random 1,random 1,random 1]]
		];
		dz_sv_boats_info = [
			[[[3529.72,7966.98,-2.06566],38.2833],"CUP_C_Fishing_Boat_Chernarus",[random 1,random 1]],
			[[[3742.6,2331.97,-2.07188],55.2033],"CUP_C_Fishing_Boat_Chernarus",[random 1,random 1]],
			[[[13225.3,7773.39,-1.58266],130.499],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[14535.3,7265.15,-1.87195],316.31],"C_Boat_Civil_01_F",[random 1,random 1]],
			[[[17520.9,12952.7,-2.07792],186.461],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[13474.8,19636,-2.19214],6.49776],"CUP_C_Fishing_Boat_Chernarus",[random 1,random 1]],
			[[[14860.2,10083.3,1.2712],0.0149819],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[9500.66,12614.8,0.962609],0.0144709],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[9134.07,21595.1,1.09674],130.751],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[11531.7,18716.4,21.3821],29.773],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[17502.5,13002.7,11.8673],86.4065],"B_Boat_Transport_01_F",[random 1,random 1]]
		];
		dz_sv_specialVehicle_info = [
		];

		// Other stuff
		dz_sv_vehicleAmountTotal = 20;
		dz_sv_boatAmountTotal = count dz_sv_boats_info;
		dz_sv_AircraftAmountTotal = count dz_sv_helis_info;
		dz_sv_specialVehicleAmountTotal = count dz_sv_specialVehicle_info;
		dz_sv_amountSpawnpoints = 49;
		dz_sv_vehicleAmountTotal = 35;


		// SectorB Loot
		dz_sv_sectorBLootPos = [22812.6,19935.5,9.11144];
	};

	case "Napf": { // NAPF ==================================
		// Helicopters
		dz_sv_helis_info = [
			[[[4860.07,4844.31,0.0821686],79.8518],"B_Heli_Light_01_F",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[14474.3,16796.2,0.0821667],318.601],"UH1H_LMG",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[18179.7,2012.27,0.00143433],40.0276],"CUP_C_C47_CIV",[]],
			[[[10579.8,4979.74,0.00144196],1.2621],"CUP_O_Mi8_CHDKZ",[random 0.8,random 1,random 1,random 1,random 1,random 1]],
			[[[18296.6,2216.17,0.00143433],129.985],"CUP_B_Merlin_HC3_GB",[random 0.8,random 1,random 1,random 1,random 1,random 1]]
		];
		dz_sv_boats_info = [
			[[[14531,2738.36,3],267.361],"CUP_C_Fishing_Boat_Chernarus",[random 1,random 1]],
			[[[11305.7,1755.33,4],122.522],"CUP_C_Fishing_Boat_Chernarus",[random 1,random 1]],
			[[[3902.09,14553.3,4],337.382],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[5356.05,16141.3,3],357.375],"C_Boat_Civil_01_F",[random 1,random 1]],
			[[[8418.15,818.917,2],146.027],"B_Boat_Transport_01_F",[random 1,random 1]],
			[[[10649.7,16263.7,4],92.33],"CUP_C_Fishing_Boat_Chernarus",[random 1,random 1]]
		];
		dz_sv_specialVehicle_info = [
		];

		// Other stuff
		dz_sv_boatAmountTotal = count dz_sv_boats_info;
		dz_sv_AircraftAmountTotal = count dz_sv_helis_info;
		dz_sv_specialVehicleAmountTotal = count dz_sv_specialVehicle_info;
		dz_sv_amountSpawnpoints = 49;
		dz_sv_vehicleAmountTotal = 40;


		// SectorB Loot
		dz_sv_sectorBLootPos = [16549.1,18214.8,11.6621];
	};
};
diag_log format ["DEBUGGING::: %1",dz_sv_vehicleTypes];

dz_sv_vehicleHitPoints =
[
	["CUP_C_Ural_Civ_01",["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitFuel","HitEngine","HitBody","HitLMWheel","HitRMWheel"]],
	["B_Heli_Light_01_F",["HitFuel","HitHull","HitEngine","HitAvionics","HitHRotor","HitVRotor"]],
	["CUP_B_Merlin_HC3_GB",["HitFuel","HitHull","HitEngine","HitAvionics","HitHRotor","HitVRotor"]],
	["CUP_O_Mi8_CHDKZ",["HitFuel","HitHull","HitEngine","HitAvionics","HitHRotor","HitVRotor"]],
	["UH1H_LMG",["HitFuel","HitHull","HitEngine","HitAvionics","HitHRotor","HitVRotor"]],
	["CUP_C_Fishing_Boat_Chernarus",["HitEngine","HitHull"]],
	["C_Boat_Civil_01_F",["HitHull","HitEngine"]],
	["B_Boat_Transport_01_F",["HitBody","HitEngine"]],
	["CUP_C_C47_CIV",["NOENTRY"]]
];
dz_sv_vehicleHitPointsDefault = ["HitLFWheel","HitLF2Wheel","HitRFWheel","HitRF2Wheel","HitFuel","HitEngine","HitBody"];

// Anticheat for spawned vehicles
dz_sv_allowedVehicleTypes = dz_sv_vehicleTypes;
/*{
	{
		dz_sv_allowedVehicleTypes pushBack (_x select 1);
	} forEach _x;
} forEach [dz_sv_helis_info,dz_sv_boats_info,dz_sv_specialVehicle_info];*/
{
	dz_sv_allowedVehicleTypes = dz_sv_allowedVehicleTypes + [_x select 1];
} forEach dz_sv_helis_info;
{
	dz_sv_allowedVehicleTypes = dz_sv_allowedVehicleTypes + [_x select 1];
} forEach dz_sv_boats_info;
{
	dz_sv_allowedVehicleTypes = dz_sv_allowedVehicleTypes + [_x select 1];
} forEach dz_sv_specialVehicle_info;

diag_log format ["DEBUGGING::: %1",dz_sv_vehicleTypes];

// Stream configurations for vehicles to players
publicVariable "dz_sv_vehicleHitPoints";
publicVariable "dz_sv_vehicleHitPointsDefault";

// Fill spawnpoints for vehicles
for "_i" from 0 to (dz_sv_amountSpawnpoints - 1) step 1 do
{
	dz_sv_spawnpoints pushBack (format ["%1%2",dz_sv_spawnpoints_prefix,_i]);
};

// Loot tables

/***************** MEDICAL *****************/

dz_sv_loot_medical_table =
[
    ["DayZero_Item_Bandage",0.35],
    ["DayZero_Item_Bloodbag",0.35],
   	["DayZero_Item_HeatPack",0.35],
   	["DayZero_Item_Painkillers",0.35],
   	["DayZero_Item_Waterpure",0.35],
   	["DayZero_Item_Morphine",0.35],
   	["DayZero_Item_Antibiotic",0.35]
];

/***************** RESIDENTIAL ****************/
dz_sv_loot_residential_table =
[
    // Weapons
    [
        ["CUP_hgun_TaurusTracker455",0.4],
        ["hgun_SA_makarov_pm_F",0.10],
        ["CUP_hgun_Colt1911",0.29],
        ["CUP_srifle_LeeEnfield",0.2],
        ["CUP_hgun_TaurusTracker455_gold",0.1],
        ["CUP_hgun_SA61",0.3],
        ["GG_Weaponpack_M1_Garand",0.2],
        ["smg_SA_9a91",0.3],
        ["prifle_SA_Mosin",0.3],
        ["smg_SA_m1a1_F",0.2],
        ["prifle_SA_MP153",0.3],
        ["prifle_SA_MP153_Tactical",0.1],
        ["hgun_10mm_Sam_F",0.3],
        ["hgun_SA_nambu_type14_F",0.5],
        ["hgun_flashlight_Sam_F",0.4],
        ["CUP_srifle_CZ550",0.01],
        ["hlc_rifle_M1903A1",0.1],
        ["hlc_rifle_M1903A1_unertl",0.01],
        ["meleehatchet",0.6]
    ],



    // Magazines
    [
        // This section will fill up automatically depending on the weapons listed above
    ],

    // Items
    [
        ["DayZero_Item_Knife",0.8],
        ["DayZero_Item_Matches",0.17],
        ["DayZero_Item_GasCooker",0.1],
        ["DayZero_Item_BakedBeans",0.17],
        ["DayZero_Item_Cereal",0.17],
        ["DayZero_Item_Spirit",0.17],
        ["DayZero_Item_Redgull",0.17],
        ["DayZero_Item_RiceBox",0.17],
        ["DayZero_Item_TacticalBacon",0.17],
        ["DayZero_Item_Canteen",0.5],
        ["DayZero_Item_Canteen_Empty",0.78],
        ["DayZero_Item_Canteen_Purified",0.1],
        ["DayZero_Item_Franta",0.17],
        ["DayZero_Item_Pasta",0.17],
        ["DayZero_Item_Sardines",0.17],
        ["DayZero_Item_HeatPack",0.17],
        ["DayZero_Item_Bandage",0.09],
        ["DayZero_Item_Antibiotic",0.05],
        ["DayZero_Item_Sardines",0.17],
        ["DayZero_Item_MobilePhone",0.4],
        ["DayZero_Item_File1",0.25],
        ["DayZero_Item_File2",0.25],
        ["DayZero_Item_File3",0.25],
        ["DayZero_Item_File4",0.25],
        ["ItemMap",0.25],
        ["ItemCompass",0.3],
        ["DayZero_Item_Tent",0.05],
        ["chemlight_red",0.15],
        ["chemlight_green",0.15],
        ["chemlight_blue",0.15],
        ["chemlight_yellow",0.15],
        ["DayZero_Item_Shovel",0.1],
        ["DayZero_Item_Bloodbag_Empty",0.5],
        ["DayZero_Item_RifleSpeedloader",0.09],
        ["Binocular",0.15],
        ["DayZero_Item_MountainDew",0.05],
        ["DayZero_Item_ChocBar",0.17],
        ["DayZero_Item_TaviCola",0.17],
        ["DayZero_Item_Cloth",0.14],
        ["ItemWatch",0.14],
        //["DayZero_Item_Blueprint_LongRangeScope",0.1],
        //["DayZero_Item_Blueprint_LongRangeScopeDMR",0.1],
        ["DayZero_Item_Blueprint_SHL1",0.08]
        //["DayZero_Item_Blueprint_SHL2",0],
        //["DayZero_Item_Blueprint_SHL3",0.]
    ],

    // Backpacks
    [
        ["CUP_B_AssaultPack_ACU",0.5],
        ["CUP_B_RPGPack_Khaki",0.09],
        ["B_Kitbag_cbr",0.01],
        ["CUP_B_ACRScout_m95",0.09],
        ["CUP_B_CivPack_WDL",0.09],
        ["CUP_B_ACRPara_m95",0.09],
        ["CUP_B_Bergen_BAF",0.09],
        ["CUP_B_AlicePack_Khaki",0.09],
        ["CUP_B_USMC_MOLLE",0.09],
        ["CUP_B_HikingPack_Civ",0.08]
    ],

    // Clothing
    [
        ["rds_uniform_assistant",0.15],
        ["rds_uniform_citizen2",0.15],
        ["rds_uniform_citizen1",0.15],
        ["rds_uniform_citizen4",0.15],
        ["rds_uniform_doctor",0.15],
        ["rds_uniform_Functionary2",0.15],
        ["rds_uniform_Policeman",0.15],
        ["rds_uniform_schoolteacher",0.15],
        ["rds_Villager_cap1",0.15],
        ["rds_worker_cap2",0.15],
        ["rds_police_cap",0.15],
        ["H_MilCap_blue",0.15],
        ["rds_Profiteer_cap3",0.15],
        ["G_Balaclava_blk",0.15],
        ["G_Bandanna_oli",0.15],
        ["G_Balaclava_oli",0.15],
        ["CUP_FR_NeckScarf",0.15],
        ["H_RacingHelmet_1_black_F",0.15],
        ["H_RacingHelmet_1_red_F",0.15],
        ["H_RacingHelmet_1_yellow_F",0.15]
    ]
];
publicVariable "dz_sv_loot_residential_table";

/***************** INDUSTRIAL ****************/
dz_sv_loot_industrial_table =
[
    // Weapons
    [
        ["CUP_hgun_TaurusTracker455",0.2],
        ["CUP_hgun_Colt1911",0.2],
        ["CUP_srifle_LeeEnfield",0.2],
        ["CUP_hgun_TaurusTracker455_gold",0.01],
        ["CUP_hgun_SA61",0.03],
        ["GG_Weaponpack_M1_Garand",0.04],
        ["meleehatchet",0.7]
    ],

    // Magazines
    [
        // This section will fill up automatically depending on the weapons listed above
    ],

    // Items
    [
        ["DayZero_Item_Engine",0.1],
        ["DayZero_Item_Fueltank",0.1],
        ["DayZero_Item_Scrapmetal",0.1],
        ["DayZero_Item_Carglass",0.1],
        ["DayZero_Item_Wheel",0.2],
        ["DayZero_Item_Rotor",0.05],
        ["DayZero_Item_Toolbox",0.26],
        ["meleehatchet",0.5],
        ["DayZero_Item_JerryCan",0.2],
        ["chemlight_red",0.1],
        ["chemlight_green",0.1],
        ["chemlight_blue",0.1],
        ["chemlight_yellow",0.1],
        ["DayZero_Item_Hammer",0.5],
        ["DayZero_Item_Shovel",0.5],
        ["DayZero_Item_Glue",0.25],
        ["DayZero_Item_Cloth",0.15],
        ["DayZero_Item_DrillAku",0.35],
        ["DayZero_Item_ButaneTorch",0.35]
    ],

    // Backpacks
    [
        ["CUP_B_AssaultPack_ACU",0.5],
        ["CUP_B_RPGPack_Khaki",0.09],
        ["B_Kitbag_cbr",0.01],
        ["CUP_B_ACRScout_m95",0.09],
        ["CUP_B_CivPack_WDL",0.09],
        ["CUP_B_ACRPara_m95",0.09],
        ["CUP_B_Bergen_BAF",0.09],
        ["CUP_B_AlicePack_Khaki",0.09],
        ["CUP_B_USMC_MOLLE",0.09]
    ],

    // Clothing
    [
        ["U_C_Poor_1",0.2],
        ["rds_uniform_assistant",0.55],
        ["rds_uniform_citizen2",0.55],
        ["rds_uniform_citizen1",0.55],
        ["rds_uniform_citizen4",0.55],
        ["rds_uniform_doctor",0.55],
        ["rds_uniform_Functionary2",0.55],
        ["rds_uniform_Policeman",0.55],
        ["rds_uniform_schoolteacher",0.55],
        ["rds_Villager_cap1",0.55],
        ["rds_worker_cap2",0.55],
        ["rds_police_cap",0.55],
        ["H_MilCap_blue",0.55],
        ["rds_Profiteer_cap3",0.55],
        ["G_Balaclava_blk",0.55],
        ["G_Bandanna_oli",0.55],
        ["G_Balaclava_oli",0.55],
        ["CUP_FR_NeckScarf",0.55],
        ["TRYK_shirts_DENIM_BWH",0.35],
        ["TRYK_shirts_DENIM_R",0.35],
        ["TRYK_shirts_DENIM_ylb",0.35],
        ["TRYK_shirts_BLK_PAD_BLW",0.35],
        ["TRYK_shirts_BLK_PAD",0.35]
    ]
];
publicVariable "dz_sv_loot_industrial_table";

/***************** LOW MILITARY ****************/
dz_sv_loot_lowmilitary_table =
[
    // Weapons
    [
        ["CUP_hgun_Glock17",0.15],
        ["CUP_hgun_MicroUzi",0.15],
        ["CUP_hgun_M9",0.15],
        ["CUP_hgun_Phantom",0.15],
        ["HandGrenade",0.1],
        ["hgun_ACPC2_F",0.1],
        ["hgun_Pistol_heavy_01_F",0.1],
        ["CUP_hgun_Compact",0.15],
        ["CUP_hgun_Phantom",0.15],
        ["hlc_smg_mp5k",0.1],
        ["CUP_hgun_Colt1911",0.15],
        ["hlc_smg_mp5a3",0.03],
        ["meleehatchet",0.7]
    ],

    // Magazines
    [
        // This section will fill up automatically depending on the weapons listed above
    ],

    // Items
    [
        ["ItemRadio",0.1],
        ["ItemGPS",0.02],
        ["HandGrenade",0.03],
        ["optic_MRD",0.1],
        ["muzzle_snds_L",0.1],
        ["CUP_acc_CZ_M3X",0.1]
    ],

    // Backpacks
    [
        ["CUP_B_AssaultPack_ACU",0.2],
        ["CUP_B_RPGPack_Khaki",0.2],
        ["B_Kitbag_cbr",0.01],
        ["CUP_B_ACRScout_m95",0.2],
        ["CUP_B_CivPack_WDL",0.2],
        ["CUP_B_ACRPara_m95",0.2],
        ["CUP_B_Bergen_BAF",0.2],
        ["CUP_B_AlicePack_Khaki",0.2],
        ["CUP_B_USMC_MOLLE",0.2],
        ["CUP_B_USPack_Coyote",0.2]
    ],

    // Clothing
    [
        ["V_Press_F",0.25],
        ["CUP_V_O_TK_Vest_1",0.25],
        ["CUP_V_O_TK_OfficerBelt2",0.25],
        ["CUP_V_O_TK_OfficerBelt",0.25],
        ["CUP_V_B_RRV_Medic",0.25],
        ["V_BandollierB_oli",0.25],
        ["CUP_V_B_GER_Carrier_Vest",0.25],
        ["CUP_V_B_MTV",0.25],
        ["CUP_V_B_RRV_Light",0.25],
        ["V_TacVest_blk_POLICE",0.25],
        ["V_I_G_resistanceLeader_F",0.25],
        ["V_TacVest_blk",0.25],
        ["V_TacVest_camo",0.25],
        ["V_TacVest_khk",0.25],
        ["CUP_V_B_MTV_LegPouch",0.25],

        ["TRYK_V_Sheriff_BA_T",0.25],
        ["TRYK_V_Sheriff_BA_TB2",0.25],
        ["TRYK_V_Sheriff_BA_OD",0.25],
        ["TRYK_V_tacv1L_BK",0.25],
        ["TRYK_V_tacv1_P_BK",0.25],
        ["TRYK_V_tacv10LC_OD",0.25],
        ["TRYK_V_tacSVD_BK",0.25],
        ["TRYK_V_Sheriff_BA_TL",0.25],
        ["H_MilCap_blue",0.25],
        ["CUP_FR_NeckScarf",0.25],
        ["Mask_M40_OD",0.1],
        ["TRYK_H_Booniehat_AOR2",0.1],
        ["TRYK_H_AOR2",0.1],
        ["TRYK_H_Helmet_WOOD",0.1],
        ["TRYK_r_cap_blk_Glasses",0.1],
        ["TRYK_H_woolhat",0.1],
        ["TRYK_U_B_PCUODHs",0.3],
        ["TRYK_U_B_JSDF_CombatUniform",0.2]
    ]
];

/***************** MILITARY ****************/
dz_sv_loot_military_table =
[
    // Weapons
    [
        ["hlc_rifle_ak74_dirty2",0.6],
        ["hlc_rifle_ak74",0.6],
        ["hlc_rifle_aks74u",0.6],
        ["hlc_rifle_ak12",0.4],
        ["hlc_rifle_aku12",0.4],
        ["hlc_rifle_rpk12",0.09],
        ["hlc_rifle_akm",0.6],
        ["hlc_rifle_aks74",0.6],
        ["hlc_rifle_rpk",0.09],
        ["hlc_rifle_saiga12k",0.5],
        ["hlc_rifle_ak47",0.6],
        //["CUP_arifle_CZ805_A1",0.01],
        ["hlc_rifle_aek971worn",0.6],
        ["CUP_smg_bizon",0.6],
        ["CUP_sgun_M1014",0.6],
        ["CUP_srifle_CZ550",0.1],
        ["CUP_arifle_Sa58P",0.4],
        ["CUP_arifle_Sa58V",0.4],
        ["CUP_arifle_Sa58RIS1",0.3],
        ["CUP_srifle_SVD",0.1],
        ["CUP_srifle_ksvk",0.01],
        //["CUP_lmg_M249",0.01],
        ["CUP_lmg_PKM",0.09],
        //["hlc_rifle_M14",0.01],
        ["CUP_hgun_Glock17",0.6],
        ["CUP_hgun_MicroUzi",0.6],
        ["CUP_hgun_M9",0.6],
        ["CUP_hgun_Phantom",0.6],
        ["HandGrenade",0.3]
        //["hlc_rifle_Colt727",0.0],
        //["hlc_rifle_honeybadger",0.0],
        //["hlc_rifle_bcmjack",0.0],
        //["hlc_rifle_FAL5061",0.0],
        //["hlc_muzzle_snds_fal",0.0],
        //["hlc_optic_suit",0.0],
        //["hlc_rifle_FAL5061Rail",0.0],
        //["hlc_rifle_LAR",0.0],
        //["arifle_SA_m4a1_sopmod",0.0],
        //["hlc_smg_mp5k_PDW",0.0],
        //["hlc_muzzle_Tundra",0.0],
        //["hlc_smg_mp5a3",0.0],
        //["hlc_rifle_SLR",0.0],
        //["CUP_arifle_Mk16_STD",0.0],
        //["hlc_rifle_Bushmaster300",0.0],
        //["hlc_rifle_M4",0],
        //["CUP_srifle_M14",0.0],
        //["CUP_arifle_G36C",0],
        //["CUP_arifle_G36K_camo",0],
        //["CUP_arifle_G36C_camo",0],
        //["hlc_rifle_vendimus",0]
    ],

    // Magazines
    [
        // This section will fill up automatically depending on the weapons listed above
    ],

    // Items
    [
        ["optic_ACO_grn_smg",0.1],
        ["CUP_optic_CompM4",0.1],
        ["CUP_optic_Eotech533",0.1],
        ["CUP_optic_LeupoldM3LR",0.01],
        ["hlc_optic_artel_m14",0.01],
        ["CUP_optic_SB_11_4x20_PM",0.01],
        ["CUP_optic_CompM2_Black",0.08],
        ["CUP_optic_TrijiconRx008_black",0.01],
        ["optic_Holosight",0.08],
        ["CUP_optic_RCO",0.08],
        ["acc_flashlight",0.3],
        ["CUP_acc_Flashlight_wdl",0.2],
        ["CUP_acc_XM8_light_module",0.2],
        ["muzzle_snds_M",0.01],
        ["hlc_muzzle_556NATO_KAC",0.01],
        ["bipod_01_F_blk",0.1],
        ["CUP_muzzle_Bizon",0.2],
        ["HLC_Optic_PSO1",0.08],
        ["CUP_optic_PSO_3",0.02],
        ["hlc_optic_kobra",0.3],
        ["hlc_muzzle_762SUP_AK",0.08],
        ["hlc_muzzle_545SUP_AK",0.08],
        ["CUP_muzzle_snds_M084",0.05],
        ["chemlight_red",0.18],
        ["chemlight_green",0.18],
        ["chemlight_blue",0.18],
        ["chemlight_yellow",0.18],
        ["NVGoggles",0.18],
        ["ItemRadio",0.3],
        ["ItemGPS",0.09],
        ["HandGrenade",0.4]
    ],

    // Backpacks
    [
        ["CUP_B_AssaultPack_ACU",0.3],
        ["CUP_B_RPGPack_Khaki",0.1],
        ["B_Kitbag_cbr",0.01],
        ["CUP_B_ACRScout_m95",0.2],
        ["CUP_B_CivPack_WDL",0.1],
        ["CUP_B_ACRPara_m95",0.1],
        ["CUP_B_Bergen_BAF",0.1],
        ["CUP_B_AlicePack_Khaki",0.1],
        ["CUP_B_USMC_MOLLE",0.1],
        ["CUP_B_USPack_Coyote",0.09],
        ["TRYK_B_Carryall_wood",0.1],
        ["CUP_B_GER_Pack_Flecktarn",0.1],
        ["CUP_B_HikingPack_Civ",0.1]
    ],

    // Clothing
    [
        ["CUP_U_B_GER_Tropentarn_2",0.3],
        ["CUP_U_B_USMC_MARPAT_WDL_Sleeves",0.3],
        ["CUP_U_B_FR_Scout",0.5],
        ["CUP_U_O_TK_MixedCamo",0.52],
        ["CUP_U_O_TK_Green",0.5],
        ["U_I_G_Story_Protagonist_F",0.45],
        ["CUP_U_O_TK_Officer",0.45],
        ["U_BG_Guerrilla_6_1",0.45],
        ["CUP_V_B_LHDVest_Blue",0.45],
        ["CUP_V_B_LHDVest_Red",0.45],
        ["CUP_V_B_LHDVest_White",0.45],
        ["CUP_V_B_LHDVest_Green",0.45],
        ["V_Press_F",0.45],
        ["CUP_V_O_TK_Vest_1",0.45],
        ["CUP_V_O_TK_OfficerBelt2",0.45],
        ["CUP_V_O_TK_OfficerBelt",0.45],
        ["CUP_V_B_RRV_Medic",0.45],
        ["V_BandollierB_oli",0.45],
        ["CUP_V_B_GER_Carrier_Vest",0.45],
        ["CUP_V_B_MTV",0.45],
        ["CUP_V_B_RRV_Light",0.45],
        ["V_TacVest_blk_POLICE",0.45],
        ["V_I_G_resistanceLeader_F",0.45],
        ["V_TacVest_blk",0.45],
        ["V_TacVest_camo",0.45],
        ["V_TacVest_khk",0.45],
        ["CUP_V_B_MTV_LegPouch",0.45],
        ["TRYK_U_B_ARO2R_CombatUniform",0.45],
        ["TRYK_U_B_PCUHsW3",0.45],
        ["TRYK_U_B_C02_Tsirt",0.45],
        ["TRYK_U_B_fleece",0.45],
        ["TRYK_U_B_MARPAT_Wood",0.45],
        ["TRYK_U_B_MARPAT_WOOD_CombatUniformTshirt",0.45],
        ["TRYK_U_B_PCUODHs",0.45],
        ["TRYK_shirts_DENIM_BWH",0.45],
        ["TRYK_shirts_DENIM_R",0.45],
        ["TRYK_shirts_DENIM_ylb",0.45],
        ["TRYK_shirts_BLK_PAD_BLW",0.45],
        ["TRYK_shirts_BLK_PAD",0.45],
        ["TRYK_U_pad_hood_Blod",0.45],
        ["TRYK_U_pad_hood_odBK",0.45],
        ["TRYK_U_B_JSDF_CombatUniformTshirt",0.45],

        ["TRYK_V_Sheriff_BA_T",0.45],
        ["TRYK_V_Sheriff_BA_TB2",0.45],
        ["TRYK_V_Sheriff_BA_OD",0.45],
        ["TRYK_V_tacv1L_BK",0.45],
        ["TRYK_V_tacv1_P_BK",0.45],
        ["TRYK_V_tacv10LC_OD",0.45],
        ["TRYK_V_tacSVD_BK",0.45],
        ["TRYK_V_Sheriff_BA_TL",0.45],

        ["CUP_H_FR_ECH",0.45],
        ["CUP_H_USMC_Headset_GoggleW_HelmetWDL",0.45],
        ["rds_Villager_cap1",0.45],
        ["rds_worker_cap2",0.45],
        ["rds_police_cap",0.45],
        ["H_MilCap_blue",0.45],
        ["rds_Profiteer_cap3",0.45],
        ["G_Balaclava_blk",0.45],
        ["G_Bandanna_oli",0.45],
        ["G_Balaclava_oli",0.45],
        ["CUP_FR_NeckScarf",0.45],
        ["Mask_M40_OD",0.1],
        ["CUP_U_B_FR_Scout",0.1],
        ["CUP_U_B_FR_Scout3",0.1],
        ["TRYK_H_Booniehat_AOR2",0.3],
        ["TRYK_H_AOR2",0.3],
        ["TRYK_H_Helmet_WOOD",0.3],
        ["TRYK_r_cap_blk_Glasses",0.3],
        ["TRYK_H_woolhat",0.3]
    ]
];
publicVariable "dz_sv_loot_military_table";

// Loot table chances
dz_sv_loot_residential_table_chances = [
    [0,16], // Weapons
    [16,23], // Magazines
    [23,75], // Items
    [75,85], // Backpacks
    [85,101] // Clothing
];
publicVariable "dz_sv_loot_residential_table_chances";
dz_sv_loot_industrial_table_chances = [
    [0,7], // Weapons
    [7,14], // Magazines
    [14,65], // Items
    [65,75], // Backpacks
    [75,101] // Clothing
];
publicVariable "dz_sv_loot_industrial_table_chances";
dz_sv_loot_military_table_chances = [
    [0,20], // Weapons
    [20,50], // Magazines
    [50,75], // Items
    [75,87], // Backpacks
    [88,101] // Clothing
];
publicVariable "dz_sv_loot_military_table_chances";
dz_sv_loot_lowmilitary_table_chances = [
    [0,27], // Weapons
    [27,40], // Magazines
    [40,70], // Items
    [70,80], // Backpacks
    [80,101] // Clothing
];
publicVariable "dz_sv_loot_military_table_chances";

// Lootable building
dz_sv_loot_residential_types = ["Land_houseV_2T2","Land_Kulna","Land_HouseV_1L2","Land_HouseV2_05","Land_HouseV_1I1","Land_rails_bridge_40","Land_Wall_CGry_5_D","Land_Stodola_open","","Land_HouseV_1I4","","Land_HouseV_3I2","Land_Vez","","Land_Wall_CBrk_5_D","","Land_HouseV2_01A","","","Land_Brana02nodoor","Land_Farm_Cowshed_a","Land_HouseV2_01B","","Land_Trafostanica_velka","","Land_HouseV_1L1","Land_Stodola_old_open","Land_HouseBlock_A3","","Land_Ind_Garage01","Land_NAV_Lighthouse","Land_Rail_House_01","Land_Nasypka","Land_Tovarna2","Land_A_FuelStation_Shed","Land_nav_pier_m_2","Land_A_GeneralStore_01a","Land_Mil_House","","Land_HouseV2_03B","Land_A_TVTower_Base","","Land_HouseBlock_A1_1","Land_Komin","Land_Sara_hasic_zbroj","Land_Vysilac_FM","Land_Sara_domek_zluty","Land_Church_03","land_nav_pier_m_end","Land_ruin_01","","Land_Ind_MalyKomin","Land_HouseV2_02_Interier","Land_Panelak2","Land_HouseV2_03","Land_Molo_drevo_bs","Land_rail_station_big","","","","Land_Church_01","Land_Vez_Silo","","Land_A_Castle_Gate","Land_A_Castle_Bergfrit","Land_Ind_Pec_01","","Land_A_Pub_01","Land_A_Office02","Land_A_statue02","","Land_Ind_SiloVelke_01","Land_Ind_Vysypka","Land_HouseBlock_A1","Land_Ind_Mlyn_02","Land_A_Castle_Wall1_Corner_2","","Land_A_GeneralStore_01","","Land_Telek1","","Land_IndPipe1_stair","land_nav_pier_m_1","land_nav_pier_c_big","","land_nav_pier_M_fuel","","Land_HouseB_Tenement","","Land_A_Castle_Wall1_20","Land_Church_05R","Land_A_Castle_Wall1_20_Turn","","Land_A_Castle_Stairs_A","","Land_Dam_Conc_20","Land_Dam_ConcP_20","","Land_Nav_Boathouse","Land_Shed_wooden","land_nav_pier_c2","Land_Ind_Quarry","","Land_A_Castle_Wall1_Corner","Land_HouseV2_04_interier","Land_Panelak","Land_A_Office01","Land_a_stationhouse","Land_tav_houseblock_b4_in","Land_tav_houseblock_b1","Land_Tav_Panelak2","Land_Tav_Panelak","Land_Dum_mesto2","Land_A_Pub_01","Land_Dum_mesto3","Land_Stodola_old_open","Land_Leseni2x","Land_HouseV_1I4","Land_HouseBlock_A1","Land_A_FuelStation_Build","Land_Ind_Garage01","Land_A_GeneralStore_01","Land_water_tank","Land_hokej_stadion","Land_Dum_mesto_in","Land_HouseV2_05","Land_Dum_rasovna","Land_Misc_deerstand","Land_Domek_zluty_BEZ","Land_tav_HouseV_2L","Land_Stodola_open","Land_Farm_Cowshed_c","Land_Farm_Cowshed_b","Land_Farm_Cowshed_a","Land_domek05","Land_fortified_nest_big","Land_HouseV_1L2","Land_HouseV_1I1","Land_HouseV_1L1","Land_Nav_Boathouse","Land_Church_03","Land_Misc_Cargo1Bo","Land_Sara_Domek_sedy","Land_Barn_W_02","Land_Sara_hasic_zbroj","Land_a_stationhouse","Land_HouseV2_04_interier_dam","land_nav_pier_c2_end","Land_Garaz_bez_tanku","Land_Church_05R","Land_HouseV2_03","Land_Dum_zboreny","Land_A_statue02","Land_Telek1","Land_Helfenburk_cimburi","Land_Helfenburk","Land_Helfenburk_budova2","Land_Helfenburk_brana","Land_HouseB_Tenement","Land_Nasypka","Land_Garaz_mala","Land_Ind_SawMillPen","Land_hospoda","Land_Church_01","Land_Hlidac_budka","Land_Climbing_Obstacle","Land_Tav_Panelak3","Land_Kulna","Land_Deutshe_mini","Land_Majak_podesta","Land_Majak","Land_A_Castle_Wall1_20","Land_A_Castle_Bergfrit","Land_A_Castle_Stairs_A","Land_A_Castle_Gate","Land_podloubi_end_low_2","Land_podloubi_end_low_1","Land_Pier_F","Land_Molo_drevo_bs","Land_tav_cargo_container","Land_tav_hut_old02","Land_Sara_domek_podhradi_1","Land_Leseni4x","Land_Dum_mesto2l","Land_bufet","Land_nabrezi_1","Land_IndPipe1_stair","Land_tav_cinzak_long_centr","Land_Ind_SawMill","Land_rail_station_big","Land_Banka","Land_autosalon","Land_HouseBlock_A3","Land_shopping_sab5","Land_tav_HouseBlock_D1_ex1","Land_hotel_marcomio","Land_big_church","Land_shopping_sab2","Land_Barn_W_01_dam","Land_Kostel","Land_Molo_beton","Land_Molo_drevo_end","Land_Tovarna2","Land_Misc_Scaffolding","Land_konecna","Land_Rail_House_01","Land_Vysilac_FM","Land_tav_cernja_basnja","Land_Kasarna_prujezd","Land_ZalChata","Land_domek_radnice","Land_Dum_zboreny_total","Land_zachytka_nov","Land_pbstade","Land_pbstadrscore","Land_pbstadr","Land_Kostel_trosky","Land_Hotel","Land_Plot_istan1_rovny_gate","land_nav_pier_M_fuel","Land_IndPipe1_stair_EP1","Land_Hotel_riviera2","Land_Hotel_riviera1","Land_rails_bridge_40","Land_HouseV2_03_dam","Land_ruin_01_PMC","Land_Dulni_bs","Land_aif_zluty_statek_in","Land_Sara_stodola","Land_Hruzdum","land_mbg_brickhouse_01","Land_MBG_GER_PUB_2","Land_Bouda2_vnitrek","Land_Cihlovej_Dum_in","Land_MBG_GER_RHUS_1","Land_MBG_GER_RHUS_2","Land_aif_hotel","Land_MBG_GER_RHUS_5","Land_MBG_Killhouse_4","Land_Dirthump02_EP1","Land_Sara_domek_vilka","land_mbg_apartments_big_01","Land_MBG_Killhouse_3","Land_House_C_10_EP1","land_mbg_apartments_big_04","Land_House_C_4_EP1"];
dz_sv_loot_military_types = ["Land_Misc_deerstand","Land_Mil_Guardhouse","Land_Ss_hangar","Land_Mil_Barracks_i","Land_Mil_ControlTower","Land_tav_bunker_b1","Land_fortified_nest_small","Land_Vez","Land_Ind_IlluminantTower","Land_budova4_in_ori","Land_tav_guardhouse","Land_GuardShed","Land_x","Land_Ss_hangar","Land_Mil_House","Land_Mil_ControlTower","Land_A_TVTower_Base","Land_Mil_Barracks_i","Land_Barrack2","Land_aif_strazni_vez","Land_Vysilac_FM2"];
dz_sv_loot_industrial_types = ["Land_Misc_PowerStation","Land_Ind_Workshop01_04","Land_Farm_Cowshed_c","Land_Hlidac_budka","Land_Hut06","Land_Ind_Workshop01_01","Land_Ind_Workshop01_02","Land_Ind_SawMillPen","Land_Barn_Metal","Land_A_FuelStation_Build","Land_Ind_SawMill","Land_Ind_Workshop01_L","Land_Shed_Ind02","Land_Ind_Expedice_3","","","Land_Repair_center","Land_Misc_Cargo1Ao","Land_Ind_Expedice_1","","Land_Barn_W_02","Land_Misc_Cargo1Bo","Land_Ind_Mlyn_03","Land_Ind_Mlyn_04","Land_Ind_Stack_Big","Land_A_Crane_02b","Land_Molo_drevo_end","Land_Hangar_2","Land_A_Crane_02a","land_nav_pier_c_t20","Land_A_BuildingWIP","Land_Misc_Scaffolding","Land_A_CraneCon","Land_Ind_Mlyn_01","Land_A_FuelStation_Shed","Land_Dirthump03","Land_Watertower1","Land_Shed_Ind02","Land_Ind_Vysypka","Land_Barn_Metal","Land_Ind_Stack_Big","Land_tav_Ind_Pec_03","Land_Trafostanica_velka","land_nav_pier_c2","Land_A_Crane_02a","Land_A_Crane_02b","Land_Misc_Cargo1Ao","Land_Misc_PowerStation","Land_A_CraneCon","Land_A_BuildingWIP","Land_Komin","Land_repair_center","Land_tav_Ind_SawMill","Land_Ind_Mlyn_01","Land_Ind_Mlyn_04","Land_Ind_Mlyn_02","Land_Ind_Mlyn_03","Land_Ind_MalyKomin","Land_tav_Ind_Pec_02_mig","Land_Ind_Expedice_1","Land_bus_depo","Land_Dirthump02","Land_Hangar_2","Land_Ind_Coltan_Main_EP1","Land_tav_Ind_Pec_02_v3s","Land_tav_Ind_Pec_02_tanky","Land_Ind_Expedice_3","Land_Ind_SiloVelke_01","Land_ori_tmz_back","Land_ori_tmz_base","Land_ori_tmz_top","Land_Ind_Quarry","Land_Ind_Oil_Tower_EP1","Land_Barn_W_01","Land_Trafostanica_mala","Land_Hut_old02","Land_Misc_CargoMarket1a_EP1"];
dz_sv_loot_medical_types = ["Land_A_Hospital"];
dz_sv_loot_lowmilitary_types = ["Land_zachytka"];

{
	if ((_x select 0) == "MILITARY") then {
		dz_sv_loot_military_types pushBack (_x select 1);
	};
	if ((_x select 1) == "RESIDENTIAL") then {
		dz_sv_loot_residential_types pushBack (_x select 1);
	};
	if ((_x select 1) == "INDUSTRIAL") then {
		dz_sv_loot_industrial_types pushBack (_x select 1);
	};
	if ((_x select 1) == "LOW_MILITARY") then {
		dz_sv_loot_lowmilitary_types pushBack (_x select 1);
	};
} forEach dz_sv_customLootSpots;
































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

dz_fnc_sv_ambientFlyby = {
	/*
		Author: Nelson Duarte

		Description:
		Spawns an ambient air unit, makes it move and deletes it when it reaches destination
		Vehicle will never engage and will be flagged as captive
		Good for simple creation of ambient fly by's

		Parameter(s):
		_this select 0:	ARRAY - The position where vehicle will spawn
		_this select 1:	ARRAY - The end position of the vehicle, it will be deleted here
		_this select 2:	NUMBER - The spawn and flight height of the vehicle
		_this select 3:	STRING - The speed the vehicle will move ("LIMITED", "NORMAL", "FULL")
		_this select 4:	STRING - The classname of the vehicle to spawn
		_this select 5:	SIDE - The side the vehicle belongs

		Returns:
		BOOL - true on success
	*/

	//Params
	private ["_start", "_end", "_height", "_speed", "_class", "_side"];
	_start 		= [_this, 0, [0,0,0], [[]]] call BIS_fnc_param;
	_end 		= [_this, 1, [100,100,100], [[]]] call BIS_fnc_param;
	_height 	= [_this, 2, 100, [0]] call BIS_fnc_param;
	_speed		= [_this, 3, "NORMAL", [""]] call BIS_fnc_param;
	_class 		= [_this, 4, "B_Heli_Light_01_F", [""]] call BIS_fnc_param;
	_side		= [_this, 5, WEST, [WEST]] call BIS_fnc_param;

	//Set spawn height
	_start set [2, _height];

	//The starting direction of the vehicle
	private "_direction";
	_direction = [_start, _end] call BIS_fnc_dirTo;

	//Spawn the vehicle
	private ["_vehicleContainer", "_vehicle", "_vehicleCrew", "_vehicleGroup"];
	_vehicleContainer	= [_start, _direction, _class, _side] call BIS_fnc_spawnVehicle;
	_vehicle 		= _vehicleContainer select 0;
	_vehicleCrew		= _vehicleContainer select 1;
	_vehicleGroup		= _vehicleContainer select 2;

	//Fly height
	_vehicle flyInHeight _height;

	//Add waypoint
	private "_waypoint";
	_waypoint = _vehicleGroup addWaypoint [_end, 0];

	//Set waypoint properties
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointBehaviour "CARELESS";
	_waypoint setWaypointCombatMode "BLUE";
	_waypoint setWaypointSpeed _speed;

	//The waypoint statements
	//Once unit completes waypoint we clean up crew/vehicle/group
	_waypoint setWaypointStatements [
		"true",
		"private ['_group', '_vehicle']; _group = group this; _vehicle = vehicle this; { deleteVehicle _x } forEach units _group; deleteVehicle _vehicle; deleteGroup _group;"
	];

	//Valid
	if (!isNull _vehicle) then {
		//Log
		["Ambient flyby %1 (%2) spawned at %3 and will move to %4 with a height of %5 and with %6 speed, of %7 side", _class, _vehicle, _start, _end, _height, _speed, _side] call BIS_fnc_logFormat;

		//Return value
		true;
	} else {
		//Log
		"Ambient flyby failed to create vehicle, consider making sure the wanted side center exists" call BIS_fnc_error;

		//Return value
		false;
	};
};

// Fill up loot tables with magazines depending on the weapons
{
	_magazinesArray = [];
	_weapons = _x select 0;
	{
		_magazinesArray pushBack [([(_x select 0)] call dz_fnc_itemDetails select 7) select 0, 0.17];
	} forEach _weapons;
	_x set [1,_magazinesArray];
} forEach [dz_sv_loot_residential_table,dz_sv_loot_industrial_table,dz_sv_loot_military_table,dz_sv_loot_residential_table,dz_sv_loot_lowmilitary_table];

dz_sv_buildings_types = [];
{
	dz_sv_buildings_types pushBack (_x select 1);
} forEach dz_sv_basebuilding_data;

{
	publicVariable _x;
} forEach ["dz_sv_loot_medical_table","dz_sv_loot_residential_types","dz_sv_loot_military_types","dz_sv_loot_industrial_types","dz_sv_loot_residential_table","dz_sv_loot_industrial_table","dz_sv_loot_military_table","dz_sv_loot_medical_types","dz_sv_maxGroundWeaponHolders","dz_sv_loot_lowmilitary_table","dz_sv_loot_lowmilitary_types","dz_sv_loot_lowmilitary_table_chances","dz_sv_basebuilding_data","dz_sv_buildings_types","Ryanzombiesattackdistance","dz_fnc_initializeBuilding","dz_fnc_preparestring","dz_sv_gameVersion","dz_sv_allowedVehicleTypes","dz_sv_logPrefix","dz_sv_loot_multiplicator"];

// Set zombie damage
_dmg = dz_sv_zombies_damage;
_dmg = _dmg / 10000;
Ryanzombiesdamage = _dmg;
publicVariable "Ryanzombiesdamage";
dz_sv_zombies_damageDay = dz_sv_zombies_damage;

// Other vars
dz_sv_tents = [];
dz_sv_buildings = [];
dz_sv_loot_weaponHolders = [];
dz_sv_buildingsToClient = [];