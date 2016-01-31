// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow
//	@file Edited By: stoop

private["_fn_storeOwnersFactory", "_storeOwners"];

_fn_storeOwnersFactory = compile preprocessFileLineNumbers "mapConfig\stores\storeOwnersFactory.sqf";
_storeOwners = call _fn_storeOwnersFactory;

storeOwnerConfig = compileFinal str _storeOwners select 0;
storeOwnerConfigAppearance = compileFinal str _storeOwners select 1;