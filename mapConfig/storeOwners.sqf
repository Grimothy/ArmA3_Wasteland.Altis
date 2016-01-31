// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow
//	@file Edited By: stoop (config arrays are now populated by a factory)

private["_storeOwners"];

_storeOwners = call compile preprocessFileLineNumbers "mapConfig\stores\storeOwnersFactory.sqf";

storeOwnerConfig = compileFinal str (_storeOwners select 0);
storeOwnerConfigAppearance = compileFinal str (_storeOwners select 1);