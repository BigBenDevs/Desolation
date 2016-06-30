if (isDedicated) exitWith {};scriptName "fn_antiSideChat";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_antiSideChat.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_antiSideChat.sqf"

dz_checkForSideChat = true;
while {dz_checkForSideChat} do {
	waitUntil {uisleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 55))};
	if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then
	{
		if ((ctrlText ((findDisplay 63) displayCtrl 101) == "Side channel") || (ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_side")) then
		{
			//setCurrentChannel 5;
			dz_sideChatWarningCount = dz_sideChatWarningCount + 1;
			if (dz_sideChatWarningCount >= 2) then {
				hint "Stop talking in side chat!";
			};
			if (dz_sideChatWarningCount >= 5) then {
				player setDamage 1;
				[] spawn dz_fnc_savePlayerData;
				disableUserInput true;
				sleep 6;
				disableUserInput false;
				//[player,"kick"] remoteExec ["dz_fnc_removePlayer",2];
				dz_kickMe = 0;
				publicVariable "dz_kickMe";
				sleep 1;
				endMission "SIDECHAT";
			};
		};
	};
};