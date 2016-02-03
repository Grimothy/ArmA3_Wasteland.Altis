//@file Version: 1.0
//@file Name: storeOwnersFactory.sqf
//@file Author: stoop
//@file Desc: Creates a collection of stores from a collection of store sets

private["_storeOwnerCollections", "_totalStoreCollections", "_collectionId", "_selectedStoreOwnerCollection", "_storeOwnerConfig", "_storeOwnerConfigAppearance", "_fn_GetStoreConfigData"];

//Get store collections
_storeOwnerCollections = call compile preprocessFileLineNumbers "mapConfig\stores\storeOwnersCollections.sqf";

//Select random store collection from the total collections
_totalStoreCollections = count _storeOwnerCollections;
diag_log format ["[Stores Info][storeOwnersFactory.sqf] Total store collections found: %1", _totalStoreCollections];
_collectionId = (floor random _totalStoreCollections);
diag_log format ["[Stores Info][storeOwnersFactory.sqf] Selected store collection: %1", _collectionId];
_selectedStoreOwnerCollection = _storeOwnerCollections select _collectionId;

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

diag_log format ["[Stores Info][storeOwnersFactory.sqf] variable storeOwnerConfig loaded with array from collection file '%1'", _storeOwnerConfig];
diag_log format ["[Stores Info][storeOwnersFactory.sqf] variable storeOwnerConfigAppearance loaded with array from collection file '%1'", _storeOwnerConfigAppearance];

[_storeOwnerConfig, _storeOwnerConfigAppearance]