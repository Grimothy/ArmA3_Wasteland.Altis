if (_this getVariable "VCOM_InCover") then
{	
	_NearestEnemy = _this call VCOMAI_ClosestEnemy;
	if (_NearestEnemy isEqualTo [] || {isNil "_this"} || {!(alive _NearestEnemy)}) exitWith {};
	if !(lineintersects [eyepos _this,eyepos _NearestEnemy,_this,_NearestEnemy]) then 
	{
		_doesIntersect = terrainIntersect [getposATL _this, getposATL _NearestEnemy];
		if !(_doesIntersect) then
		{
			_this setVariable ["VCOM_VisuallyCanSee",true,false];
			_this forceSpeed 0;
			_this lookAt (getposATL _NearestEnemy);
			_this setUnitPos "AUTO";
			_this spawn {sleep 5;_this forcespeed -1};
		};
	};
};