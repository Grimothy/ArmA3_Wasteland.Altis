// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_ejectCorpse.sqf
//	@file Author: AgentRev

<<<<<<< HEAD
private ["_corpse", "_veh", "_pos", "_vehSize", "_targetPos"];
=======
private ["_corpse", "_veh", "_firstVeh", "_pos", "_targetPos"];
>>>>>>> fef9664... Optimized player item drop and corpse ejection
_corpse = _this;
_veh = vehicle _corpse;

#define INVALID_CORPSE (isNull _corpse || alive _corpse || isNull _veh || _veh == _corpse)

if (INVALID_CORPSE) exitWith {};

waitUntil
{
	sleep 0.1;
<<<<<<< HEAD
	_veh = vehicle _corpse;
=======

	// apparently, if the corpse is stuck in a vehicle wreck, "vehicle _corpse" returns the corpse itself, hence why the workaround below is needed; as usual, thanks BIS for breaking stuff all the time!!!!!!!!
	_veh = if (_corpse in crew _firstVeh) then { _firstVeh } else { vehicle _corpse };

>>>>>>> fef9664... Optimized player item drop and corpse ejection
	_pos = getPos _veh;
	INVALID_CORPSE || {(isTouchingGround _veh || _pos select 2 < 5) && {vectorMagnitude velocity _veh < (if (surfaceIsWater _pos) then { 5 } else { 1 })}}
};

if (!INVALID_CORPSE) then
{
	_targetPos = getPosWorld _veh;
	_targetPos set [2, (_corpse modelToWorld [0,0,0]) select 2];

	if (_veh != _corpse && damage _veh > 0.99) then
	{
		// eject corpse away from vehicle, at a distance relative to vehicle's size and center
		_targetPos = _targetPos vectorAdd ([[0, _veh call fn_vehSafeDistance, 1], -([_veh, _corpse] call BIS_fnc_dirTo)] call BIS_fnc_rotateVector2D);
	};

	_corpse setPos _targetPos;
};
