if (isDedicated) exitWith {};scriptName "fn_sameArrays";
/*--------------------------------------------------------------------
	Author: OPTiX (ofpectag: OPX)
    File: fn_sameArrays.sqf

	<DAY ZERO>
    Written by OPTiX
    You're not allowed to use this file without permission from the author!
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
--------------------------------------------------------------------*/
#define __filename "fn_sameArrays.sqf"

// AMOUNT CHECK IS ONLY AVAILABLE WITH STRINGS

// Parameters
_array1 = param[0,[],[[]]]; // Array to check for
_array2 = param[1,[],[[]]]; // Array to search in
_considerAmount = param[2,false,[false]];
_exactlySameAmount = param[3,false,[false]];

// Exceptions
if (count _array1 == 0) exitWith {};
if (count _array2 == 0) exitWith {};

// Code
_same = true;

{
    if !(_x in _array2) then {_same = false};
} forEach _array1;

{
    if !(_x in _array1) then {_same = false};
} forEach _array2;

// What if a string can be found multiple times in the first array? Check if the second one has atleast the same amount of items then..
if (_considerAmount) then {
    {
        _curItem = _x;
        _curItemAmount = {_x == _curItem} count _array1;
        _curItemAmountInToCheckArray = {_x == _curItem} count _array2;

        if (!_exactlySameAmount) then {
            if (_curItemAmountInToCheckArray < _curItemAmount) then {
                _same = false;
            };
        } else {
            if (_curItemAmountInToCheckArray != _curItemAmount) then {
                _same = false;
            };
        };
    } forEach _array1;
};

_same