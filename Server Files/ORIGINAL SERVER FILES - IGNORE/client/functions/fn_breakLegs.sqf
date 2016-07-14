if (isDedicated) exitWith {};scriptName "fn_breakLegs";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_breakLegs.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_breakLegs.sqf"

// Parameters


// Exceptions
if (player getVariable ["brokenlegs",false]) exitWith {};

// Code
player say3D "panic_0";
player setVariable ["brokenlegs",true,true];
player setHitPointDamage ["HitLegs",1];
["<t color='#EB1800'>I think one of my legs is broken</t>"] call dz_fnc_addToFeed;
dz_brokenLegs = true;