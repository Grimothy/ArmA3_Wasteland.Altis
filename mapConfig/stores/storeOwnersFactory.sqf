//@file Version: 1.0
//@file Name: storeOwnersFactory.sqf
//@file Author: stoop
//@file Desc: Creates a collection of stores from a collection of store sets

private["_totalStoreCollections", "_collectionFileNamePattern", "_collectionLimitFound", "_collectionId", "_collectionFileName", "_selectedStoreOwnerCollection", "_storeOwnerConfig", 
	"_storeOwnerConfigAppearance", "_fn_GetStoreConfigData"];

_storeOwnerConfig = [];
_storeOwnerConfigAppearance = [];

// Find the total number of available store collection files.
_totalStoreCollections = 0;
_collectionFileNamePattern = "mapConfig\stores\storeOwnersCollection%1.sqf";
_collectionLimitFound = false;

while {!_collectionLimitFound} do {
	private["_fileIdToTest", "_fileNameToTest", "_file"];
	
	_fileIdToTest = _totalStoreCollections + 1;
	_fileNameToTest = format [_collectionFileNamePattern, _fileIdToTest];
	_file = openFile [_fileNameToTest, 0];
	
	if (isnil("_file")) then {
		//This file doesn't exist. Available collection limit found.
		_collectionLimitFound = true;
	}
	else {
		//This file exists. Continue checking for more.
		_totalStoreCollections = _fileIdToTest;
	};
};
	
diag_log format ["[Stores Info] storeOwnersFactory.sqf: Total store collection files found = '%1'", _totalStoreCollections];

if(_totalStoreCollections > 0) {
	//Get random collection Id
	_collectionId = (floor random _totalStoreCollections) + 1;
	_collectionFileName = format [_collectionFileNamePattern, _collectionId];

	//Get randomly selected collection
	diag_log format ["[Stores Info] storeOwnersFactory.sqf: About to load store collection file '%1'", _collectionFileName];
	_selectedStoreOwnerCollection = call compile preprocessFileLineNumbers _collectionFileName;
	diag_log "[Stores Info] storeOwnersFactory.sqf: Successfully loaded store collection file";

	//Converts store collection file data into mission-usable arrays
	_fn_GetStoreConfigData = {
		private["_storeName", "_storeArray"];
		{
			_storeName = format ["%1%2", (_this select 0), (_forEachIndex + 1)];
			_storeArray = [_storeName];
			_storeArray append (_x select 0);
			_storeOwnerConfig pushBack _storeArray;
			
			_storeArray = [_storeName];
			_storeArray pushBack (_x select 1);
			_storeOwnerConfigAppearance pushBack _storeArray;
		}foreach (_this select 1);
	};

	//Build store owners
	["GenStore", _selectedStoreOwnerCollection select 0] call _fn_GetStoreConfigData;
	["GunStore", _selectedStoreOwnerCollection select 1] call _fn_GetStoreConfigData;
	["VehStore", _selectedStoreOwnerCollection select 2] call _fn_GetStoreConfigData;

	diag_log format ["[Stores Info] storeOwnersFactory.sqf: storeOwnerConfig loaded with array from collection file '%1'", _storeOwnerConfig];
	diag_log format ["[Stores Info] storeOwnersFactory.sqf: storeOwnerConfigAppearance loaded with array from collection file '%1'", _storeOwnerConfigAppearance];
}
else
{
	diag_log "[Stores Info] [ERROR] storeOwnersFactory.sqf: No store collection files found.";
};

[_storeOwnerConfig, _storeOwnerConfigAppearance]