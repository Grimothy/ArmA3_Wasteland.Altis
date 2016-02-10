//@file Version: 1.0
//@file Name: storeOwnersFactory.sqf
//@file Author: stoop
//@file Desc: Creates a collection of stores from a collection of store sets

private["_storeOwnersCollectionsFile", "_storeOwnersCollectionsConfig", "_storeOwnersCollections", "_totalStoreCollections", "_randomCollectionPool",
	"_excludedCollections", "_collectionIndex", "_selectedStoreOwnerCollection", "_storeOwnerConfig", "_storeOwnerConfigAppearance", "_fn_GetStoreConfigData"];

//Get store collections
_storeOwnersCollectionsFile = call compile preprocessFileLineNumbers "mapConfig\stores\storeOwnersCollections.sqf";
_storeOwnersCollectionsConfig = _storeOwnersCollectionsFile select 0;
_storeOwnersCollections = _storeOwnersCollectionsFile select 1;

_totalStoreCollections = count _storeOwnersCollections;
diag_log format ["[Stores Info][storeOwnersFactory.sqf] Total store collections found: %1", _totalStoreCollections];

//Check if recent stores should be excluded from random selection
if((_storeOwnersCollectionsConfig select 0)) then
{
	waitUntil {(not isNil "A3W_extDB_ServerID") and (not isNil "A3W_extDB_MapID")};
	_excludedCollections = [format ["getLatestStoreCollectionLog:%1:%2:%3", call A3W_extDB_ServerID, call A3W_extDB_MapID, (_storeOwnersCollectionsConfig select 1)], 2, true] call extDB_Database_async;
	
	//The number of exluded collections must be less than the total number of collections (otherwise, there won't be any to select from)
	if((count _excludedCollections) >= _totalStoreCollections) then
	{
		_excludedCollections resize (_totalStoreCollections - 1);
	};
}
else
{
	_excludedCollections = [];
};

if((count _excludedCollections) > 0) then
{
	diag_log format ["[Stores Info][storeOwnersFactory.sqf] Recently loaded stores that will be excluded from random selection: '%1'", _excludedCollections];
	
	//The pool of random collections should contain all collections except the exluded ones
	_randomCollectionPool = [];
	{
		if(_excludedCollections find (_x select 0) < 0) then {
			_randomCollectionPool pushBack _x;
		};
	}foreach (_storeOwnersCollections);
}
else
{
	//The pool of random collections should contain all collections
	_randomCollectionPool = _storeOwnersCollections;
};

//Select random store collection from the pool of collections
_totalStoreCollections = count _randomCollectionPool;
_collectionIndex = (floor random _totalStoreCollections);
_selectedStoreOwnerCollection = _randomCollectionPool select _collectionIndex;

diag_log format ["[Stores Info][storeOwnersFactory.sqf] Selected store collection '%1'", str (_selectedStoreOwnerCollection select 0)];

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

["GenStore", _selectedStoreOwnerCollection select 1] call _fn_GetStoreConfigData;
["GunStore", _selectedStoreOwnerCollection select 2] call _fn_GetStoreConfigData;
["VehStore", _selectedStoreOwnerCollection select 3] call _fn_GetStoreConfigData;

diag_log format ["[Stores Info][storeOwnersFactory.sqf] variable storeOwnerConfig loaded with array from collection file '%1'", _storeOwnerConfig];
diag_log format ["[Stores Info][storeOwnersFactory.sqf] variable storeOwnerConfigAppearance loaded with array from collection file '%1'", _storeOwnerConfigAppearance];

//Log the selected collection
[format ["addStoreCollectionLog:%1:%2:%3", call A3W_extDB_ServerID, call A3W_extDB_MapID, (_selectedStoreOwnerCollection select 0)], 1] call extDB_Database_async;

[_storeOwnerConfig, _storeOwnerConfigAppearance]