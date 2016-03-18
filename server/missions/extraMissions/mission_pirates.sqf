// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_Sniper.sqf
//	@file Author: JoSchaap, AgentRev, LouD

if (!isServer) exitwith {};
#include "extraMissionDefines.sqf";

private ["_positions", "_boxes1", "_currBox1", "_box1","_loc"];

_setupVars =
{
	_missionType = "Pirates";
	
	_positions = [[10833.96582, 23610.763672, 0],[12105.426758, 25017.771484, 0],[6873.962891, 8418.191406, 0],[3308.699219, 5252.309082, 0]];
	
	_missionPos = _positions call BIS_fnc_SelectRandom;
	
};

_setupObjects =
	//pos1 setPosASL[_pos1 select 0, _pos1 select 1, (_pos1 select 2) +33];
{

	_aiGroup = createGroup CIVILIAN;
	//_handle = [_aiGroup, _missionPos] spawn createsmugglerGroup;
	_handle = [_aiGroup, _missionPos] spawn createCustomGroup2;
	 waitUntil { scriptDone _handle };

	{
		_x setPosASL [position _x select 0, position _x select 1, (position _x select 2) + 33];
	} forEach units _aiGroup;
	_aiGroup setCombatMode "RED";
	_aiGroup setBehaviour "COMBAT";
	
	_missionHintText = format ["Pirates have taken over one of the Oil Rigs! Kill them and take their supplies! Be careful they are fully armed and dangerous!", extraMissionColor];
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
};

_successExec =
{
	// Mission completed
	
	_boxes1 = ["Box_East_WpsSpecial_F","Box_IND_WpsSpecial_F"];
	_currBox1 = _boxes1 call BIS_fnc_selectRandom;
	_box1 = createVehicle [_currBox1, _lastPos, [], 2, "None"];
	_box1 allowDamage false;
	_box1 setVariable ["R3F_LOG_disabled", false, true];

	_successHintMessage = format ["The Pirates are dead. Take their supplies!"];
};

_this call extraMissionProcessor;