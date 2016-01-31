//@file Version: 1.0
//@file Name: storeOwnersFactory.sqf
//@file Author: stoop
//@file Desc: Creates a collection of stores from a collection of store sets

private["_totalStoreCollections", "_collectionId", "_collectionFileName", "_selectedStoreOwnerCollection", "_storeOwnerConfig", "_storeOwnerConfigAppearance"];

// This number should equal the total number of storeOwnersCollection#.sqf files.
// Each storeOwnersCollection#.sqf must be sequential starting at 1 (i.e. storeOwnersCollection1.sqf, storeOwnersCollection2.sqf, storeOwnersCollection3.sqf)
_totalStoreCollections = 2;

//Get random colection Id
_totalStoreCollections = _totalStoreCollections - 1;
_collectionId = floor random _totalStoreCollections;
_collectionId = _collectionId + 1;
_collectionFileName = format ["mapConfig\stores\storeOwnersCollection%1.sqf", _collectionId];

//Get randomly selected collection
_selectedStoreOwnerCollection = call compile preprocessFileLineNumbers _collectionFileName;

//Build store owners
_storeOwnerConfig = [];
_storeOwnerConfigAppearance = [];

private["_storeName", "_storeArray"];

{
	_storeName = format ["GenStore%1", (_forEachIndex + 1)];
	_storeArray = [_storeName];
	_storeArray append (_x select 0);
	_storeOwnerConfig pushBack _storeArray;
	
	_storeArray = [_storeName];
	_storeArray pushBack (_x select 1);
	_storeOwnerConfigAppearance pushBack _storeArray;
}foreach (_selectedStoreOwnerCollection select 0);
	
{
	_storeName = format ["GunStore%1", (_forEachIndex + 1)];
	_storeArray = [_storeName];
	_storeArray append (_x select 0);
	_storeOwnerConfig pushBack _storeArray;
	
	_storeArray = [_storeName];
	_storeArray pushBack (_x select 1);
	_storeOwnerConfigAppearance pushBack _storeArray;
}foreach (_selectedStoreOwnerCollection select 1);

{
	_storeName = format ["VehStore%1", (_forEachIndex + 1)];
	_storeArray = [_storeName];
	_storeArray append (_x select 0);
	_storeOwnerConfig pushBack _storeArray;
	
	_storeArray = [_storeName];
	_storeArray pushBack (_x select 1);
	_storeOwnerConfigAppearance pushBack _storeArray;
}foreach (_selectedStoreOwnerCollection select 2);

[_storeOwnerConfig, _storeOwnerConfigAppearance]