_Unit = _this;

if (isNil "_Unit" || {isNull _Unit}) exitWith {};


_myNearestEnemy = _Unit call VCOMAI_ClosestEnemy;
if (_myNearestEnemy isEqualTo []) exitWith {};

_CheckIfThrow = _Unit getVariable "VCOM_GRENADETHROWN";


if !(_CheckIfThrow) then
{

_Unit setVariable ["VCOM_GRENADETHROWN",true,false];

_Unit spawn {sleep 10;_this setVariable ["VCOM_GRENADETHROWN",false,false];};

_CheckDistance = (_Unit distance _myNearestEnemy);

if (!(lineintersects [eyepos _Unit,eyepos _myNearestEnemy,_Unit,_myNearestEnemy])) then 
{
	
	
	
	if (_CheckDistance < 60 && {_CheckDistance > 6}) then 
	{
	
		_DirectionSet = [_Unit,_myNearestEnemy] call BIS_fnc_dirTo;
		_Unit setDir _Directionset;

		_Unit forceWeaponFire ["HandGrenadeMuzzle","HandGrenadeMuzzle"];
		_Unit forceWeaponFire ["MiniGrenadeMuzzle","MiniGrenadeMuzzle"];

	};
};


if (_CheckDistance < 5000) then 
{
		if (VCOM_USESMOKE) then 
		{
		
	
			_DirectionSet = [_Unit, _myNearestEnemy] call BIS_fnc_dirTo;
		
			_Unit setDir _Directionset;
		
			_Unit forceWeaponFire ["SmokeShellMuzzle","SmokeShellMuzzle"];
		};

};

};
