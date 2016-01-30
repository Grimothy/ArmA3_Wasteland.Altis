_Unit = _this select 0;
if (isPlayer _Unit) exitWith {};
if ((vehicle _Unit) != _Unit) exitWith {};


//Lay down
_Unit setUnitPos "DOWN";

//Make AI pop smoke for cover
_myNearestEnemy = _Unit findNearestEnemy (Position _Unit);
_DirectionSet = [_Unit, _myNearestEnemy] call BIS_fnc_dirTo;
_Unit setDir _Directionset;
_Unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];

_Unit spawn VCOMAI_MoveToCover;