//@file Version: 1.0
//@file Name: storeOwnersFactory.sqf
//@file Author: stoop
//@file Desc: Creates a collection of stores from a collection of store sets

private["_totalStoreCollections", "_collectionId", "_collectionFileName", "_selectedStoreOwnerCollection", "_storeOwnerConfig", "_storeOwnerConfigAppearance", "_fn_GetStoreConfigData"];

// This number should equal the total number of storeOwnersCollection#.sqf files.
// Each storeOwnersCollection#.sqf must be sequential starting at 1 (i.e. storeOwnersCollection1.sqf, storeOwnersCollection2.sqf, storeOwnersCollection3.sqf)
_totalStoreCollections = 2;

//Get random colection Id
_collectionId = (floor random _totalStoreCollections) + 1;
_collectionFileName = format ["mapConfig\stores\storeOwnersCollection%1.sqf", _collectionId];

//Get randomly selected collection
diag_log format ["[Stores Info] storeOwnersFactory.sqf: About to load store collection file '%1'", _collectionFileName];
_selectedStoreOwnerCollection = call compile preprocessFileLineNumbers _collectionFileName;
diag_log "[Stores Info] storeOwnersFactory.sqf: Successfully loaded store collection file";

//Build store owners
_storeOwnerConfig = [];
_storeOwnerConfigAppearance = [];

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

["GenStore", _selectedStoreOwnerCollection select 0] call _fn_GetStoreConfigData;
["GunStore", _selectedStoreOwnerCollection select 1] call _fn_GetStoreConfigData;
["VehStore", _selectedStoreOwnerCollection select 2] call _fn_GetStoreConfigData;

diag_log format ["[Stores Info] storeOwnersFactory.sqf: storeOwnerConfig loaded with array from collection file '%1'", _storeOwnerConfig];
diag_log format ["[Stores Info] storeOwnersFactory.sqf: storeOwnerConfigAppearance loaded with array from collection file '%1'", _storeOwnerConfigAppearance];

[_storeOwnerConfig, _storeOwnerConfigAppearance]