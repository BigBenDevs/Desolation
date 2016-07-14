/*
	Jump: on key pressed event
*/
params["_key"];

_found = false;
if(_key in (actionKeys "getover")) then {
	if(toLower(["Enabled","JMP"] call BASE_fnc_getCfgValue) == "true") then {
		if(vehicle player == player) then {
			if(isTouchingGround player) then {
				if(stance player == "STAND") then {
					if !(missionNamespace getVariable ["JMP_var_Jumping",false]) then {
						_found = true;
						JMP_var_Jumping = true;
						[] spawn {
							_height = 3.5-((load player)); 
							_vel = velocity player;
							_dir = direction player;
							_speed = 0.4;
							player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),_height];
							_lastAnim = animationState player;
							[player] remoteExec ["JMP_fnc_onJump",0];
							uiSleep 0.73;
							player switchMove _lastAnim;
							JMP_var_Jumping = false;
						};
					};
				};
			};
		};
	};
};
_found;