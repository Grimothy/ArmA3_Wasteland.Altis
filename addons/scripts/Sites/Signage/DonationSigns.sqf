private ["_objs"];
_objs = [
	["Land_Billboard_F",[26719.2,24613.6,-1.49524],314.545,[[-0.712694,0.701475,0],[0,0,1]],false],
	["Land_Billboard_F",[22953,18876.6,-0.994269],36.8182,[[0.599278,0.800541,0],[0,0,1]],false],
	["",[0,0,0],0,[[0,1,0],[0,0,1]],false],
	["",[0,0,0],0,[[0,1,0],[0,0,1]],false],
	["Land_Billboard_F",[20757.6,7253.63,-0.850231],328.636,[[-0.520468,0.853881,0],[0,0,1]],false],
	["Land_Billboard_F",[14485,16309.1,-0.9974],234.091,[[-0.809949,-0.5865,0],[-0,0,1]],false],
	["Land_Billboard_F",[3372.56,13211.1,-0.389338],52.2728,[[0.790933,0.611902,0],[0,0,1]],false],
	["Land_Billboard_F",[3978.32,15070.3,-0.746759],8.63636,[[0.150163,0.988661,0],[0,0,1]],false],
	["Land_Billboard_F",[9437.23,20275.7,4.49416],243.636,[[-0.895994,-0.444067,0],[-0,0,1]],false],
	["Land_Billboard_F",[16706.1,12775.4,-1.1288],305.455,[[-0.814576,0.580057,0],[0,0,1]],false]
];

{
	private ["_obj"];
	_obj = createVehicle [_x select 0, [0,0,0], [], 0, "CAN_COLLIDE"];
	_obj SetObjectTextureGlobal [0,"mapconfig\img\bill.jpg"];
	_obj setVariable ["R3F_LOG_disabled", true, true];
	if (_x select 4) then {
		_obj setDir (_x select 2);
		_obj setPos (_x select 1);
	} else {
		_obj setPosATL (_x select 1);
		_obj setVectorDirAndUp (_x select 3);
	};
} foreach _objs;