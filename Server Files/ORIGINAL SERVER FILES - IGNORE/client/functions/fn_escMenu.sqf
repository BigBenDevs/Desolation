if (isDedicated) exitWith {};scriptName "fn_escMenu";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_escMenu.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_escMenu.sqf"

// Parameters
disableSerialization;

// Exceptions


// Code

switch (param[0,"",[""]]) do {
	case "Continue": {
		dz_exitEscWithOutAction = true;
		ctrlActivate ((findDisplay 49) displayCtrl 2);
		closeDialog 0;
	};
	case "Video": {
		dz_exitEscWithOutAction = true;
		ctrlActivate ((findDisplay 49) displayCtrl 301);
		closeDialog 0;
		[] spawn {
			waitUntil {isNull (findDisplay 49)};
			[] spawn {
				disableSerialization;
				waitUntil {!isNull (findDisplay 49)};
				createDialog "escMenu";

				{
					((findDisplay 49) displayCtrl _x) ctrlShow false;
				} forEach [1,2,101,103,104,109,120,121,122,301,302,303,307,523,1000,1001,1002,1005,1010,1050,2351,6455,11884,11885,11886,11887,11888,11889,11890,11891,11892,11893,12284,12285,12286,12287,12288,12289,12290,12291,12293,13184,13284,13285,13286,13287,13288,13289,13290,13291,13292,114998,114999,115000,115001,115002,115003,115004,115005,115010,115011,115012,115013,115014,115015,115020,115021,115022,115023,115024,115025,115030,115031,115032,115033,115034,115035,115040,115041,115042,115043,115044,115045,115050,115051,115052,115053,115054,115055,115099];
			};
		};
	};
	case "Audio": {
		dz_exitEscWithOutAction = true;
		ctrlActivate ((findDisplay 49) displayCtrl 302);
		closeDialog 0;
		[] spawn {
			waitUntil {isNull (findDisplay 49)};
			[] spawn {
				disableSerialization;
				waitUntil {!isNull (findDisplay 49)};
				createDialog "escMenu";

				{
					((findDisplay 49) displayCtrl _x) ctrlShow false;
				} forEach [1,2,101,103,104,109,120,121,122,301,302,303,307,523,1000,1001,1002,1005,1010,1050,2351,6455,11884,11885,11886,11887,11888,11889,11890,11891,11892,11893,12284,12285,12286,12287,12288,12289,12290,12291,12293,13184,13284,13285,13286,13287,13288,13289,13290,13291,13292,114998,114999,115000,115001,115002,115003,115004,115005,115010,115011,115012,115013,115014,115015,115020,115021,115022,115023,115024,115025,115030,115031,115032,115033,115034,115035,115040,115041,115042,115043,115044,115045,115050,115051,115052,115053,115054,115055,115099];
			};
		};
	};
	case "Controls": {
		dz_exitEscWithOutAction = true;
		ctrlActivate ((findDisplay 49) displayCtrl 303);
		closeDialog 0;
		[] spawn {
			waitUntil {isNull (findDisplay 49)};
			[] spawn {
				disableSerialization;
				waitUntil {!isNull (findDisplay 49)};
				createDialog "escMenu";

				{
					((findDisplay 49) displayCtrl _x) ctrlShow false;
				} forEach [1,2,101,103,104,109,120,121,122,301,302,303,307,523,1000,1001,1002,1005,1010,1050,2351,6455,11884,11885,11886,11887,11888,11889,11890,11891,11892,11893,12284,12285,12286,12287,12288,12289,12290,12291,12293,13184,13284,13285,13286,13287,13288,13289,13290,13291,13292,114998,114999,115000,115001,115002,115003,115004,115005,115010,115011,115012,115013,115014,115015,115020,115021,115022,115023,115024,115025,115030,115031,115032,115033,115034,115035,115040,115041,115042,115043,115044,115045,115050,115051,115052,115053,115054,115055,115099];
			};
		};
	};
	case "Game": {
		dz_exitEscWithOutAction = true;
		ctrlActivate ((findDisplay 49) displayCtrl 307);
		closeDialog 0;
		[] spawn {
			waitUntil {isNull (findDisplay 49)};
			[] spawn {
				disableSerialization;
				waitUntil {!isNull (findDisplay 49)};
				createDialog "escMenu";

				{
					((findDisplay 49) displayCtrl _x) ctrlShow false;
				} forEach [1,2,101,103,104,109,120,121,122,301,302,303,307,523,1000,1001,1002,1005,1010,1050,2351,6455,11884,11885,11886,11887,11888,11889,11890,11891,11892,11893,12284,12285,12286,12287,12288,12289,12290,12291,12293,13184,13284,13285,13286,13287,13288,13289,13290,13291,13292,114998,114999,115000,115001,115002,115003,115004,115005,115010,115011,115012,115013,115014,115015,115020,115021,115022,115023,115024,115025,115030,115031,115032,115033,115034,115035,115040,115041,115042,115043,115044,115045,115050,115051,115052,115053,115054,115055,115099];
			};
		};
	};
	case "Return": {
		dz_exitEscWithOutAction = true;
		ctrlActivate ((findDisplay 49) displayCtrl 104);
		closeDialog 0;
	};
};

[] spawn {
	uisleep 0.1;
	dz_exitEscWithOutAction = false;
};