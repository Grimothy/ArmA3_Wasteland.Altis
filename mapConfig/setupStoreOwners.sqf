//@file Version: 1.0
//@file Name: setupStoreOwners.sqf
//@file Author: Cael817, Many thanks to AgentRev for the CreateUnit part.
//@file Desc: For placing stores and markers
//@file Edited By: Stoop (stores are now set up using an array of stores)

// If you need the unit object afterwards:
//_unit = missionNamespace getVariable _name;
_debug = false;
_grp = createGroup sideLogic;

waitUntil {not isNil "storeOwnerConfig"};

{
	private ["_name", "_storeType", "_storePos", "_spawnPos", "_object"];
	_name = (_x select 0);
	_storeType = (_name select [0,8]);
	_storePos = (_x select 4);
	_spawnPos = (_x select 5);
	
	"C_man_1_1_F" createUnit [_storePos, _grp, format ["%1 = this; this setVehicleVarName '%1'; [this] spawn A3W_fnc_setupStoreNPC", _name]];
	
	switch (_storeType) do {
		case "GenStore";
		case "GunStore": {
			_object = createMarker [format ["%1_objSpawn", _name], _spawnPos];
			_object setMarkerShape "ICON";
			_object setMarkerText format ["%1_objSpawn", _name];
			
			If (_debug) then {
				_object setMarkertype "mil_warning";
			}else{
				_object setMarkertype "Empty";
			};
			
			_object setMarkerColor "ColorBlack";
			_object setMarkerDir 0;
		};
		case "VehStore": {
			for "_i" from 0 to 3 do {
				private ["_markerDir", "_vehPos", "_spawnType"];
				_markerDir = 0;
				
				switch (_i) do {
					case 0: {
						_vehPos = (_spawnPos select 0);
						_spawnType = "landSpawn";
					};
					case 1: {
						_vehPos = (_spawnPos select 1);
						_spawnType = "heliSpawn";
					};
					case 2: {
						_vehPos = ((_spawnPos select 2) select 0);
						_spawnType = "planeSpawn";
						_markerDir = ((_spawnPos select 2) select 1);
					};
					case 3: {
						_vehPos = (_spawnPos select 3);
						_spawnType = "seaSpawn";
					};
				};
				
				_object = createMarker [format ["%1_%2", _name, _spawnType], _vehPos];
				_object setMarkerShape "ICON";
				_object setMarkerText format ["%1_%2", _name, _spawnType];
				
				If (_debug) then {
					_object setMarkertype "mil_warning";
				}else{
					_object setMarkertype "Empty";
				};
				
				_object setMarkerColor "ColorBlack";
				_object setMarkerDir _markerDir;
			};
		};
	};
	
	diag_log format ["[Stores Info][setupStoreOwners.sqf] Created store '%1'", _name];
}foreach (call storeOwnerConfig);