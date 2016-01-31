//@file Version: 1.0
//@file Name: storeOwnersFactory.sqf
//@file Author: stoop
//@file Desc: Creates a collection of stores from a collection of store sets

private["_totalStoreCollections", "_collectionId", "_fn_storeOwnersCollection", "_selectedStoreOwnerCollection", "_storeOwnerConfig", "_storeOwnerConfigAppearance"];

// This number should equal the total number of storeOwnersCollection#.sqf files.
// Each storeOwnersCollection#.sqf must be sequential starting at 1 (i.e. storeOwnersCollection1.sqf, storeOwnersCollection2.sqf, storeOwnersCollection3.sqf)
_totalStoreCollections = 1;

//Get random colection Id
_totalStoreCollections =_totalStoreCollections - 1;
_collectionId = floor random _totalStoreCollections;
_collectionId = _collectionId + 1;

//Get selected collection
_fn_storeOwnersCollection = compile preprocessFileLineNumbers formatText ["mapConfig\stores\storeOwnersCollection%1.sqf", _collectionId];
_selectedStoreOwnerCollection = call _fn_storeOwnersCollection;

//Build store owners
_storeOwnerConfig = [];
_storeOwnerConfigAppearance = [];

private["_storeName", "_storeArray"];

{
	_storeName = formatText ["GenStore%1", _forEachIndex + 1];
	_storeArray = [_storeName];
	_storeArray append _x select 0;
	_storeOwnerConfig pushBack [_storeArray];
	_storeOwnerConfigAppearance pushBack _x select 1;
}foreach (call _selectedStoreOwnerCollection select 0);
	
{
	_storeName = formatText ["GunStore%1", _forEachIndex + 1];
	_storeArray = [_storeName];
	_storeArray append _x select 0;
	_storeOwnerConfig pushBack [_storeArray];
	_storeOwnerConfigAppearance pushBack _x select 1;
}foreach (call _selectedStoreOwnerCollection select 1);

{
	_storeName = formatText ["VehStore%1", _forEachIndex + 1];
	_storeArray = [_storeName];
	_storeArray append _x select 0;
	_storeOwnerConfig pushBack [_storeArray];
	_storeOwnerConfigAppearance pushBack _x select 1;
}foreach (call _selectedStoreOwnerCollection select 2);

[_storeOwnerConfig, _storeOwnerConfigAppearance]