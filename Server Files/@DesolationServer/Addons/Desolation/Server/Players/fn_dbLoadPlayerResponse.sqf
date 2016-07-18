

params["_data","_params"];

_playerObj = _params select 0;
//["765123456789","MusTanG",true,0.90,13124,5625,0];
_playerUID = getplayeruid _playerObj;

_playerDBUID = _data select 0;
_lastName = _data select 1;
_wasPlayerAlive = _data select 2; //--- this should be removed, player alive check will just be if the player has an entry in the "alivePlayer" table
_playerHealth = _data select 3; //--- this will eventually be an array containing hitPoint information
_playerPositionX = _data select 4; 
_playerPositionY = _data select 5;
_playerPositionZ = _data select 6; //--- this should always be 0,just to make sure we will log it & sset it to 0
_playerInventoryData = []; //--- eventually add player inventory data

diag_log format["<LOAD PLAYER RESPONSE INFO>: player Z is %1 in the databse, should be 0", _playerPositionZ];


if(_playerUID != _playerDBUID) exitWith {diag_log "<LOAD PLAYER RESPONSE ERROR>: Bad UID response? This really should never happen?";};



//--- finish player spawn
_unit = (createGroup CIVILIAN) createUnit [typeof _playerObj, [_playerPositionX,_playerPositionY,_playerPositionZ], [],0, "NONE"]; //--- create the unit at the players location
_unit allowDamage false;
_unit hideObjectGlobal true;
_unit setDamage _playerHealth; //--- temp, eventually will be hitpoints
[_unit,_playerInventoryData] call DS_fnc_setupLoadout; //--- load the players inventory into the unit
_unit hideObjectGlobal false;
_unit allowDamage true;
[_unit] remoteExecCall ["DS_fnc_finishSpawn",_playerObj]; //--- tell player to spawn w/ this unit we created