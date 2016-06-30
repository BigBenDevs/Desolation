if (isDedicated) exitWith {};scriptName "fn_keyHandler";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_keyHandler.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_keyHandler.sqf"

if (isDedicated) exitWith {};
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

if (_code == 62 AND _alt) then {
	true
};

switch (_code) do
{
	case 19: {
		if (currentWeapon player == "meleehatchet" AND currentMagazine player == "") then {
			player addMagazine "hatchet_head";
			reload player;
		};
	};

	case 68: {
		dz_cl_bb_cancel = true;
	};

	case 87: {
		dz_cl_bb_positionSet = true;
	};

	case 25: {
		_handled = true;
		[] spawn dz_fnc_openPlayerList;
	};

	case 50: {
		if (!dialog) then {dz_openMapNow = true;} else {
			closeDialog 0;
		};
		_handled = true;
	};

	case 65: {
		_handled = true;
		if (!dz_eliminateAmbientEffects) then {
			dz_eliminateAmbientEffects = true;
			["<t color='#A3FB26'>Ambient sounds are now disabled</t>"] call dz_fnc_addToFeed;
		};
	};

	case 63: {
		[] spawn {
			_finalString = "";

			_rules = [
				"- You can now use paper to discover crafting recipes",
				"- Zombie hit range is now at 2.5m",
				"- Weapon spawns have been lowered",
				"- Fixed a bug where a building would not save its loot upon restart",
				"- Added new temporary hud until proper icons are done",
				"- Talking in sidechat for longer than 5 seconds will now result in death of your character and a kick from the server"
			];

			_header = "Desolation 0.56.07";
			_exit = "";

			_finalString = _finalString + "<t font='PuristaBold'>" + _header + "</t>" + "<br/><br/>";
			{
				_finalString = _finalString + "<t font='PuristaMedium'>" + _x + "</t><br/>";
			} forEach _rules;
			_finalString = _finalString + "<br/>" + _exit;

			[parseText _finalString,"Changelog","Close",false] spawn BIS_fnc_guiMessage;
		};
		_handled = true;
	};
	case 47: {_handled = true};
	case 64: {
		if (isNil "dz_fnc_pushTooFast") then {dz_fnc_pushTooFast = 0};
		if (cursorObject isKindOf "Ship" AND (cursorObject distance player) < 15 AND (diag_tickTime - dz_fnc_pushTooFast > 5)) then {
			[player,cursorObject] spawn dz_fnc_pushObject;
			dz_fnc_pushTooFast = diag_tickTime;
		};
		_handled = true;
	};
	case 23: {
		if (_shift AND !dz_inAction) then {
			if (!dialog) then {
				if ((cursorTarget isKindOf "LandVehicle" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") AND (player distance cursorTarget < 6)) then {
					call dz_fnc_openVehicleInteraction;
				} else {
					call dz_fnc_openPlayerMenu;
				};
			};
			_handled = true;
		} else {
			_handled = false;
		};
	};
	case 35: {
		if (_shift AND !dz_inAction) then {
			if (!dialog) then {
				if ((cursorTarget isKindOf "LandVehicle" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship") AND (player distance cursorTarget < 6)) then {
					call dz_fnc_openVehicleInteraction;
				} else {
					call dz_fnc_openPlayerMenu;
				};
			};
			_handled = true;
		} else {
			_handled = false;
		};
	};

	case 21:
	{
		if (isNil "earplugs") then {earplugs = 1};
		switch (earplugs) do
		{
			case 1: {systemChat "Soundlevel is now at 50%";0.1 fadeSound 0.5;earplugs = 0.5;};
			case 0.5: {systemChat "Soundlevel is now at 10%";0.1 fadeSound 0.1;earplugs = 0.1;};
			case 0.1: {systemChat "Soundlevel is now at 100%";0.1 fadeSound 1;earplugs = 1;};
		};
	};

	case 59:
	{
		if (dz_isSpectating) then {
			[true] spawn dz_fnc_showCharacter;
		} else {
			[false] spawn dz_fnc_showCharacter;
		};
		_handled = true;
	};

	case 60:
	{
		if (!dialog AND !dz_inAction) then {
			[] spawn dz_fnc_helpMenu;
			_handled = true;
		};
	};

	case 61:
	{
		if (shownChat) then {
			showChat false;
			//1 enableChannel true;
		} else {
			showChat true;
			//1 enableChannel true;
		};
		_handled = true;
	};

	case 62:
	{
		_handled = true;
		if (!dz_inAction) then {
			dz_inAction = true;
			_itemsPlayer = (vestItems player) + (backpackITems player) + (uniformItems player);
			if !("DayZero_Item_RifleSpeedloader" in _itemsPlayer) then {
				["<t color='#A3FB26'>I am recombining my magazines without a speedloader...</t>"] call dz_fnc_addToFeed;
				[] spawn {
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
					uisleep 3;
					waitUntil {(animationState player) != "AinvPknlMstpSnonWnonDnon_medic_1"};
					uisleep 0.5;
					player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
					uisleep 4;
					dz_inAction = false;
					_magInfo = magazinesAmmoFull player;
					_curMag = currentMagazine player;
					_bulletCount = 0;
					{
						if ((_x select 0) == _curMag AND !(_x select 2)) then {
							_bulletCount = _bulletCount + (_x select 1);
							player removeMagazine _curMag;
						};
					} forEach _magInfo;

					if (_bulletCount == 0) exitWith {};

					_maxBulletCountPerMag = getNumber(configfile >> "CfgMagazines" >> _curMag >> "count");
					_fillMags = true;
					while {_fillMags} do
					{
						if (_bulletCount > _maxBulletCountPerMag) then
						{
							_bulletCount = _bulletCount - _maxBulletCountPerMag;
							player addMagazine [_curMag, _maxBulletCountPerMag];
						} else {
							player addMagazine [_curMag, _bulletCount];
							_fillMags = false;
						};
					};
					dz_inAction = false;
					["<t color='#A3FB26'>I have recombined my magazines</t>"] call dz_fnc_addToFeed;
				};
			} else {
				["<t color='#A3FB26'>I am recombining my magazines with a speedloader...</t>"] call dz_fnc_addToFeed;
				[] spawn {
					player playmove "AinvPknlMstpSlayWrflDnon";
					uisleep 2;
					dz_inAction = false;
					_magInfo = magazinesAmmoFull player;
					_curMag = currentMagazine player;
					_bulletCount = 0;
					{
						if ((_x select 0) == _curMag AND !(_x select 2)) then {
							_bulletCount = _bulletCount + (_x select 1);
							player removeMagazine _curMag;
						};
					} forEach _magInfo;

					if (_bulletCount == 0) exitWith {};

					_maxBulletCountPerMag = getNumber(configfile >> "CfgMagazines" >> _curMag >> "count");
					_fillMags = true;
					while {_fillMags} do
					{
						if (_bulletCount > _maxBulletCountPerMag) then
						{
							_bulletCount = _bulletCount - _maxBulletCountPerMag;
							player addMagazine [_curMag, _maxBulletCountPerMag];
						} else {
							player addMagazine [_curMag, _bulletCount];
							_fillMags = false;
						};
					};
					dz_inAction = false;
					["<t color='#A3FB26'>I have recombined my magazines</t>"] call dz_fnc_addToFeed;
				};
			};
		};
		//player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	/*case 1:
	{
		[] spawn {
			disableSerialization;
			waitUntil {!isNull (findDisplay 49)};
			createDialog "escMenu";

			{
				((findDisplay 49) displayCtrl _x) ctrlShow false;
			} forEach [1,2,101,103,104,109,120,121,122,301,302,303,307,523,1000,1001,1002,1005,1010,1050,2351,6455,11884,11885,11886,11887,11888,11889,11890,11891,11892,11893,12284,12285,12286,12287,12288,12289,12290,12291,12293,13184,13284,13285,13286,13287,13288,13289,13290,13291,13292,114998,114999,115000,115001,115002,115003,115004,115005,115010,115011,115012,115013,115014,115015,115020,115021,115022,115023,115024,115025,115030,115031,115032,115033,115034,115035,115040,115041,115042,115043,115044,115045,115050,115051,115052,115053,115054,115055,115099];
		};
	};*/
};

_handled;