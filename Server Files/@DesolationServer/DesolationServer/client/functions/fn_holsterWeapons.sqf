if (isDedicated) exitWith {};scriptName "fn_holsterWeapons";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_holsterWeapons.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_holsterWeapons.sqf"

// MulleDK19 © 2014
// Allows holstering of weapons on player units. Works in multiplayer.
// Usage: UNIT execVM "EnableWeaponHolstering.sqf";
// Eg. player execVM "EnableWeaponHolstering.sqf";

if (!isPlayer _this) exitWith
{
    // Action makes no sense on AI units.
};

_holsterAction = _this getVariable "HolsterAction";
if (!isNil "_holsterAction") then
{
    // Remove existing action.
    _this removeAction _holsterAction;
};

waitUntil { currentWeapon _this != "" };

_holsterAction = _this addAction ["Holster weapon",
{
    _unit = _this select 1;
    _unit action ["SwitchWeapon", _unit, _unit, 100];
    _holsterAction = _unit getVariable "HolsterAction";
    _unit setVariable ["HolsterAction", nil];
    _unit removeAction _holsterAction;

    if (primaryWeapon _unit == "" && secondaryWeapon _unit == "") exitWith
    {
        uisleep 1;
        _unit spawn dz_fnc_holsterWeapons;
    };

    _unit spawn
    {
        // Primary weapon action doesn't show when weapons are holstered. Make a custom one to select the primary weapon.
        _selectPrimaryWeaponAction = nil;
        if (primaryWeapon _this != "") then
        {
            _selectPrimaryWeaponActionName = "Weapon ";
            _weaponName = getText (configFile >> "CfgWeapons" >> (primaryWeapon _this) >> "displayName");
            _selectPrimaryWeaponActionName = _selectPrimaryWeaponActionName + _weaponName;
            _selectPrimaryWeaponAction = _this addAction [_selectPrimaryWeaponActionName, { _unit = _this select 0; _unit selectWeapon primaryWeapon _unit },"",0,false,true];
        };

        // Wait until a weapon is unholstered.
        while { currentWeapon _this == "" } do
        {
            uisleep 0.1;
        };

        // Delete the action.
        _this removeAction _selectPrimaryWeaponAction;
        uisleep 1;
        _this spawn dz_fnc_holsterWeapons;
    };
},"",0,false,true];

_this setVariable ["HolsterAction", _holsterAction];