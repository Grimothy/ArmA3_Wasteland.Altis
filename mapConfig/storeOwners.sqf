// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position, Desk Direction (or [Desk Direction, Front Offset]), Excluded Buttons
storeOwnerConfig = compileFinal str
[
	["GenStore1", 1, 0, []],
	["GenStore2", 1, 75, []],
	["GenStore3", 6, 135, []],
	["GunStore4", 1, 65, []],
	["GenStore5", 4, 22, []],
	
	["GunStore1", 6, 240, []],
	["GunStore2", 6, 250, []],
	["GunStore3", 6, 45, []],
	["GunStore4", 0, 265, []],
	["GunStore5", 5, 350, []]
	
	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	["VehStore1", 1, 75, []],
	["VehStore2", 6, 45, ["Boats"]],
	["VehStore3", 4, 250, ["Boats"]],
	["VehStore4", 5, 155, ["Boats"]],
	["VehStore5", 0, 190, ["Planes"]],
	["VehStore6", 0, 22, ["Planes", "Tanks"]]
];

// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[

	["GenStore1", [["weapon", ""], ["uniform", "U_B_SpecopsUniform_sgg"]]],
	["GenStore2", [["weapon", ""], ["uniform", "U_O_SpecopsUniform_blk"]]],
	["GenStore3", [["weapon", ""], ["uniform", "U_I_CombatUniform_tshirt"]]],
	["GenStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla1_1"]]],
	["GenStore5", [["weapon", ""], ["uniform", "U_I_CombatUniform_tshirt"]]],

	["GunStore1", [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	["GunStore2", [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	["GunStore3", [["weapon", ""], ["uniform", "U_IG_Guerilla3_1"]]],
	["GunStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	["GunStore5", [["weapon", ""], ["uniform", "U_IG_Guerilla3_2"]]],
	
	["VehStore1", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore2", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore3", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore4", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore5", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore5", [["weapon", ""], ["uniform", "U_Competitor"]]],
	["VehStore6", [["weapon", ""], ["uniform", "U_Competitor"]]]
];

	
	