class CfgPatches
{
	class Desolation {};
};
class Plugins
{
	class Desolation
	{
		name = "Desolation Redux";
		desc = "ArmA 3 Zombie Survival Mod";
		tag = "DS";
	};
}
class CfgFunctions
{
	class DS
	{
		//--- client functions
		class Client_Spawning
		{
			file = "Desolation\Client\Spawning";
			isclient = 1;
			class findSpawnPosition {};
			class onRegionSelected {};
			class freshSpawn {};
			class finishSpawn {};			
			class showRegionNotification {};
		};
		class Client_Functions
		{
			file = "Desolation\Client\Functions";
			isclient = 1;
			class infoText {};
		};
		class Client 
		{
			file = "Desolation\Client";
			isclient = 1;
			class initClient {};
		};
		//--- server functions
		class Server_Database {
			file = "Desolation\Server\Database";
			isserver = 1;
			class dbRequest {};
		};
		class Server_Players {
			file = "Desolation\Server\Players";
			isserver = 1;
			class dbLoadPlayerResponse {};
			class dbOnSpawnResponse {};
			class requestFreshSpawn {};
			class requestSpawn {};
			class setupLoadout {};
		};
		class Server_Vehicles {
			file = "Desolation\Server\Vehicles";
			isserver = 1;
			class spawnVehicles {};
		};
		class Server 
		{
			file = "Desolation\Server";
			isserver = 1;
			class initServer {};
		};
	};
};
class CfgVehicleSpawns {
	class Buildings {
		class Land_GarageShelter_01_F { 
			locations[] = {{2.60669,0.034668,-1.25005}};
			directions[] = {180};
		};
		class Land_House_Big_03_F { 
			locations[] = {{6.77026,-3.16113,-3.38936}};
			directions[] = {90.9637};
		};
		class Land_House_Small_04_F { 
			locations[] = {{-1.33447,-5.72168,-1.05337}};
			directions[] = {251.81};
		};
		class Land_House_Small_05_F { 
			locations[] = {{-2.72168,-1.87256,-1.23374}};
			directions[] = {261.001};
		};
		class Land_School_01_F { 
			locations[] = {{0.00146484,-4.24023,-1.57045},{6.99841,-3.93652,-1.57045},{13.7524,-3.68555,-1.61162},{-13.9556,-3.69434,-1.57045}};
			directions[] = {124.82,124.82,103.163,258.837};
		};
		class Land_House_Small_06_F { 
			locations[] = {{3.64514,3.64111,-1.39313}};
			directions[] = {74.936};
		};
		//--- todo: test (removed from list)
		class Land_Shed_06_F { 
			locations[] = {{2.33594,-1.5708,-1.215},{0.574951,3.30811,-1.215}};
			directions[] = {240.455,305.884};
		};
		class Land_Shed_07_F { 
			locations[] = {{3.24463,0.289063,-1.19334}};
			directions[] = {272.99};
		};
		class Land_Addon_03_F { 
			locations[] = {{-2.08667,2.85498,-1.37288}};
			directions[] = {0};
		};
		class Land_Addon_04_F { 
			locations[] = {{2.33545,5.64941,-3.09596}};
			directions[] = {81.9683};
		};
		class Land_FuelStation_01_workshop_F { 
			locations[] = {{-3.58813,-1.25781,-2.53379},{2.52588,-1.18896,-2.53379}};
			directions[] = {143.066,180.008};
		};
		class Land_FuelStation_01_roof_F { 
			locations[] = {{0.929199,-4.22705,-2.96874},{0.552246,4.25635,-2.8793}};
			directions[] = {88.727,272.412};
		};
		class Land_FuelStation_02_workshop_F { 
			locations[] = {{-2.76379,2.68311,-1.46458}};
			directions[] = {178.493};
		};
		//--- todo: test removed
		class Land_MetalShelter_02_F { 
			locations[] = {{-3.0094,6.31982,-2.53849},{-7.5896,4.13184,-2.58269}};
			directions[] = {359.991,178.967};
		};
		class Land_FuelStation_02_roof_F { 
			locations[] = {{-6.66699,2.45654,-2.40688},{-5.28308,6.86328,-2.44445}};
			directions[] = {269.099,91.9652};
		};
		//--- TODO: test removed
		class Land_MetalShelter_01_F { 
			locations[] = {{4.56799,-5.29004,-1.56836},{4.73572,-2.22607,-1.56836},{4.77979,1.12451,-1.56836},{4.92883,4.04102,-1.56836}};
			directions[] = {87.6316,48.0039,113.241,270.58};
		};
		class Land_Hotel_01_F { 
			locations[] = {{-7.40234,-1.85645,-5.50127}};
			directions[] = {0};
		};
		class Land_MultistoryBuilding_01_F { 
			locations[] = {{13.4235,-11.8364,-20.8827},{12.6835,2.3208,-20.9196},{12.5496,-3.13721,-20.9196},{12.3575,-7.44141,-20.9196}};
			directions[] = {90.781,129.967,90.733,90.733};
		};
		class Land_MultistoryBuilding_03_F { 
			locations[] = {{-8.17847,1.75049,-25.8977},{-9.08691,1.72754,-25.8977}};
			directions[] = {352.662,352.662};
		};
		class Land_Shop_City_03_F { 
			locations[] = {{5.67883,-2.56006,-5.107},{4.36108,-0.0917969,-5.10371},{0.976074,5.04053,-5.10353},{1.17896,-5.74658,-5.10401}};
			directions[] = {235.877,182.882,176.143,182.882};
		};
		class Land_Shop_City_02_F { 
			locations[] = {{1.24805,-10.1792,-4.38337},{2.22461,-10.3315,-4.42472},{3.02271,-10.3169,-4.46243},{3.79883,-10.2437,-4.41579}};
			directions[] = {105.568,110.874,109.866,113.647};
		};
		//--- todo: test fix
		class Land_WoodenShelter_01_F { 
			locations[] = {{-0.422852,0.0537109,-1.11249}};
			directions[] = {176.774};
		};
		class Land_Shop_City_01_F { 
			locations[] = {{-2.70569,-3.08887,-5.17591}};
			directions[] = {89.0095};
		};
		class Land_Shop_City_06_F { 
			locations[] = {{-6.39063,0.680664,-4.38325}};
			directions[] = {160.655};
		};
		class Land_MultistoryBuilding_04_F { 
			locations[] = {{-13.0975,6.24316,-36.7282},{-13.3356,-0.482422,-36.7282}};
			directions[] = {298.955,298.955};
		};
		class Land_Shop_City_05_F { 
			locations[] = {{-9.073,-36.6758,-7.46471},{1.22034,-11.5459,-7.46157}};
			directions[] = {252.344,183.441};
		};
		class Land_Shop_City_07_F { 
			locations[] = {{0.416138,2.33691,-3.30909},{0.440308,5.61621,-3.30862}};
			directions[] = {1.38711,1.38811};
		};
		class Land_Warehouse_03_F { 
			locations[] = {{8.05029,-0.370117,-2.40732}};
			directions[] = {359.972};
		};
		class Land_Warehouse_02_F { 
			locations[] = {{0.86377,-17.8154,-5.21577},{11.4291,-17.7988,-5.21577}};
			directions[] = {180.796,180.796};
		};
		class Land_WarehouseShelter_01_F { 
			locations[] = {{3.39453,-4.16992,-2.85872},{-3.43152,-4.43555,-2.85872}};
			directions[] = {181.698,360};
		};
		class Land_SCF_01_crystallizer_F { 
			locations[] = {{-5.53345,2.90527,-9.01621},{5.87866,2.62793,-9.01621}};
			directions[] = {269.076,90.0837};
		};
		class Land_SCF_01_shed_F { 
			locations[] = {{6.4209,-14.1689,-7.21736},{-6.74841,9.47168,-7.21736},{-1.7666,-0.806641,-7.22136},{0.930054,-2.94141,-7.22136}};
			directions[] = {0.012765,181.84,26.8011,206.934};
		};
		class Land_SM_01_shed_F { 
			locations[] = {{10.884,6.22168,-1.46795},{-0.851929,5.87891,-1.46795}};
			directions[] = {268.495,268.495};
		};
		class Land_SM_01_shed_unfinished_F { 
			locations[] = {{8.71277,2.2627,-1.51584}};
			directions[] = {285.81};
		};
		class Land_SM_01_shelter_wide_F { 
			locations[] = {{5.31702,-8.24023,-3.57053},{-5.41321,4.35547,-3.57053}};
			directions[] = {1.90951,181.259};
		};
		class Land_SM_01_shelter_narrow_F { 
			locations[] = {{0.432373,-7.63574,-2.1163},{0.480225,0.078125,-2.1163}};
			directions[] = {104.319,359.576};
		};
		class Land_Airport_01_terminal_F { 
			locations[] = {{-1.7406,6.71484,-4.2641},{1.72998,7.27832,-4.26409},{5.48486,8.80859,-4.24886}};
			directions[] = {0.802014,180.148,275.272};
		};
		class Land_Airport_01_hangar_F { 
			locations[] = {{8.36755,7.4707,-2.70845},{-7.8866,6.66309,-2.70776}};
			directions[] = {194.775,160.588};
		};
		class Land_Airport_02_hangar_right_F { 
			locations[] = {{-3.37866,-5.04492,-7.71338}};
			directions[] = {186.313};
		};
		class Land_Airport_02_hangar_left_F { 
			locations[] = {{7.65942,-8.44434,-7.72021}};
			directions[] = {180.777};
		};
		class Land_Airport_02_terminal_F { 
			locations[] = {{-2.01501,9.99609,-1.49814}};
			directions[] = {300.168};
		};
		class Land_Cargo_Tower_V4_F { 
			locations[] = {{3.18994,0.212891,-12.8885}};
			directions[] = {251.457};
		};
		class Land_PierWooden_01_ladder_F { 
			locations[] = {{-0.116943,5.49609,17.7449}};
			directions[] = {0};
		};
		class Land_PierWooden_01_dock_F { 
			locations[] = {{-0.219727,1.1084,16.9505}};
			directions[] = {0};
		};
		class Land_PierWooden_02_ladder_F { 
			locations[] = {{0.832275,4.97949,18.4322}};
			directions[] = {65.557};
		};
		class Land_PierWooden_02_hut_F { 
			locations[] = {{-7.90356,-1.03809,17.3928}};
			directions[] = {320.569};
		};
		class Land_PierWooden_03_F { 
			locations[] = {{-0.210693,13.5029,18.7532}};
			directions[] = {322.913};
		};
	};
	class Vehicles {
		//--- zamaks
		class C_Truck_02_box_F {
			buildings[] = {"Land_SM_01_shelter_narrow_F","Land_SM_01_shelter_wide_F","Land_SCF_01_shed_F","Land_SCF_01_crystallizer_F","Land_FuelStation_02_roof_F","Land_FuelStation_01_roof_F"};
		};
		class C_Truck_02_covered_F {
			buildings[] = {"Land_SM_01_shelter_narrow_F","Land_SM_01_shelter_wide_F","Land_SM_01_shed_unfinished_F","Land_SM_01_shed_F","Land_SCF_01_shed_F","Land_SCF_01_crystallizer_F","Land_FuelStation_02_roof_F","Land_FuelStation_01_roof_F","Land_i_Shed_Ind_F"};
		};
		class C_Truck_02_transport_F {
			buildings[] = {"Land_SM_01_shelter_narrow_F","Land_SM_01_shelter_wide_F","Land_SM_01_shed_unfinished_F","Land_SM_01_shed_F","Land_SCF_01_shed_F","Land_SCF_01_crystallizer_F","Land_WarehouseShelter_01_F","Land_Warehouse_02_F","Land_FuelStation_02_roof_F","Land_FuelStation_01_roof_F","Land_i_Shed_Ind_F"};
		};
		class C_Truck_02_fuel_F {
			buildings[] = {"Land_SM_01_shelter_narrow_F","Land_SM_01_shelter_wide_F","Land_SCF_01_shed_F","Land_SCF_01_crystallizer_F","Land_FuelStation_02_roof_F","Land_FuelStation_01_roof_F","Land_i_Shed_Ind_F"};
		};
		//--- industrial
		class C_Van_01_box_F {
			buildings[] = {"Land_SM_01_shelter_narrow_F","Land_MultistoryBuilding_01_F","Land_FuelStation_02_roof_F","Land_FuelStation_01_roof_F"};
		};
		class C_Van_01_transport_F {
			buildings[] = {"Land_SM_01_shelter_narrow_F","Land_WarehouseShelter_01_F","Land_FuelStation_02_roof_F","Land_FuelStation_01_roof_F"};
		};
		class C_Van_01_fuel_F {
			buildings[] = {"Land_SM_01_shelter_narrow_F","Land_FuelStation_02_roof_F","Land_FuelStation_01_roof_F"};
		};
		
		//--- military
		class B_LSV_01_unarmed_F {
			buildings[] = {"Land_Cargo_Tower_V4_F"};
		};
		
		//--- civ
		class C_Offroad_02_unarmed_F { //--- jeep
			buildings[] = {"Land_Airport_01_terminal_F","Land_MultistoryBuilding_01_F","Land_FuelStation_02_roof_F","Land_FuelStation_02_workshop_F","Land_FuelStation_01_roof_F","Land_FuelStation_01_workshop_F","Land_House_Big_03_F","Land_GarageShelter_01_F"};
		};
		class C_SUV_01_F {
			buildings[] = {"Land_Airport_01_terminal_F","Land_MultistoryBuilding_01_F","Land_FuelStation_02_roof_F","Land_FuelStation_02_workshop_F","Land_FuelStation_01_roof_F","Land_FuelStation_01_workshop_F","Land_House_Big_03_F","Land_GarageShelter_01_F"};
		};
		class C_Hatchback_01_F {
			buildings[] = {"Land_Airport_01_terminal_F","Land_MultistoryBuilding_01_F","Land_FuelStation_02_roof_F","Land_FuelStation_02_workshop_F","Land_FuelStation_01_roof_F","Land_FuelStation_01_workshop_F","Land_House_Big_03_F","Land_GarageShelter_01_F"};
		};
		class C_Offroad_01_F {
			buildings[] = {"Land_Airport_01_terminal_F","Land_SM_01_shelter_narrow_F","Land_MultistoryBuilding_01_F","Land_FuelStation_02_roof_F","Land_FuelStation_02_workshop_F","Land_FuelStation_01_roof_F","Land_FuelStation_01_workshop_F","Land_House_Big_03_F","Land_GarageShelter_01_F"};
		};
		class C_Hatchback_01_sport_F {
			buildings[] = {"Land_Airport_01_terminal_F","Land_MultistoryBuilding_01_F","Land_FuelStation_02_roof_F","Land_FuelStation_02_workshop_F","Land_FuelStation_01_roof_F","Land_FuelStation_01_workshop_F","Land_House_Big_03_F","Land_GarageShelter_01_F"};
		};
		//--- quads
		class C_Quadbike_01_F {
			buildings[] = {"Land_Shed_07_F"};
		};
		
		//--- bikes
		class MMT_Civ {
			buildings[] = {"Land_Airport_02_terminal_F","Land_Warehouse_03_F","Land_Shop_City_07_F","Land_Shop_City_05_F","Land_MultistoryBuilding_04_F","Land_Shop_City_06_F","Land_Shop_City_01_F","Land_Shop_City_02_F","Land_Shop_City_03_F","Land_MultistoryBuilding_03_F","Land_Hotel_01_F","Land_Addon_04_F","Land_Addon_03_F","Land_House_Small_04_F","Land_House_Small_05_F","Land_School_01_F","Land_House_Small_06_F"};
		};
		
		//--- plans
		class C_Plane_Civil_01_F {
			buildings[] = {"Land_Airport_02_hangar_left_F","Land_Airport_02_hangar_right_F","Land_Airport_01_hangar_F"};
		};
		class C_Plane_Civil_01_racing_F {
			buildings[] = {"Land_Airport_02_hangar_left_F","Land_Airport_02_hangar_right_F","Land_Airport_01_hangar_F"};
		};
		
		//--- jelli's
		class C_Heli_Light_01_civil_F {
			buildings[] = {};
		};
		class UH1H {
			buildings[] = {};
		};
		
	};
};