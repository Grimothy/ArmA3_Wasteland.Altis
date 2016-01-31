//@file Version: 1.0
//@file Name: setupStoreOwners.sqf
//@file Author: Cael817, Many thanks to AgentRev for the CreateUnit part.
//@file Desc: For placing stores and markers

// If you need the unit object afterwards:
//_unit = missionNamespace getVariable _name;
_debug = false;
_grp = createGroup sideLogic;

{
	private ["_storeType", "_name"];
	_storeType = _x select 0 select [0,8];
	_name = _x select 0;
	
	"C_man_1_1_F" createUnit [_x select 3, _grp, format ["%1 = this; this setVehicleVarName '%1'; [this] spawn A3W_fnc_setupStoreNPC", _name]];
	
	switch (_storeType) do {
		case "GenStore";
		case "GunStore": {
			_object = createMarker [format ["%1_objSpawn", _name], _x select 4];
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
			{
				private ["_markerDir", "_pos", "_spawnType"];
				_markerDir = 0;
				
				switch (_forEachIndex) do {
					case 0: {
						_pos = _x select 0;
						_spawnType = "landSpawn";
					};
					case 1: {
						_pos = _x select 1;
						_spawnType = "heliSpawn";
					};
					case 2: {
						_pos = _x select 2 select 0;
						_spawnType = "planeSpawn";
						_markerDir = _x select 2 select 1;
					};
					case 3: {
						_pos = _x select 3;
						_spawnType = "seaSpawn";
					};
				};
				
				_object = createMarker [format ["%1_%2", _name, _spawnType], _pos];
				_object setMarkerShape "ICON";
				_object setMarkerText format ["%1_%2", _name, _spawnType];
				
				If (_debug) then {
					_object setMarkertype "mil_warning";
				}else{
					_object setMarkertype "Empty";
				};
				
				_object setMarkerColor "ColorBlack";
				_object setMarkerDir _markerDir;
			}foreach (call _x select 4);
		};
	};
	
}foreach (call storeOwnerConfig);
