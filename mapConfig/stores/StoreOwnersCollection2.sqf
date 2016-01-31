// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwnersCollection1.sqf
//	@file Author: Stoop

private["_generalStores", "_gunStores", "_vehicleStores"];

// Array contents are as follows:
//	0 Store Config Values
//		0.0 Building Position
//		0.1 Desk Direction (or [Desk Direction, Front Offset])
//		0.2 Excluded Buttons
//		0.3 Store Position
//		0.4 Spawn Position (or Spawn Collection for Vehicle Stores in the following order [landPos,heliPos,[planePos,planeFacingDirection],SeaPos].
//	1 NPC Appearance Config Values
//		1.0 NPC weapon assignment
//		1.1 NPC uniform assignment

_gunStores =
[
	[[6, 240, [], [11533.004,9433.5479,0], [11541.983,9443.0586,19.547377]], [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	[[6, 250, [], [20786.578,6807.8887,0], [20795.758,6811.291,0]], [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	[[6, 45, [], [18087.299,15245.804,0], [18097.91,15254.862,0]], [["weapon", ""], ["uniform", "U_IG_Guerilla3_1"]]],
	[[0, 265, [], [9268.7627,15868.939,0], [9281.6826,15875.171,0]], [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"]]],
	[[5, 350, [], [4565.4165,21384.393,0], [4572.313,21392.563,299.72269]], [["weapon", ""], ["uniform", "U_IG_Guerilla3_2"]]]
];

_generalStores = 
[
	[[1, 0, [], [3366.886,13206.772,0], [3366.886,13206.772,0]], [["weapon", ""], ["uniform", "U_B_SpecopsUniform_sgg"]]],
	[[1, 75, [], [16708.83,12779.239, 0], [16717.84,12775.421,0]], [["weapon", ""], ["uniform", "U_O_SpecopsUniform_blk"]]],
	[[6, 135, [], [25786.891,21354.854,0], [25778.363,21368.246,20.712324]], [["weapon", ""], ["uniform", "U_I_CombatUniform_tshirt"]]],
	[[1, 65, [], [9435.292,20267.016,0], [9448.4199,20273.068,125.69973]], [["weapon", ""], ["uniform", "U_IG_Guerilla1_1"]]],
	[[4, 22, [], [9079.9619, 7730.4028,0], [9091.502,7717.8047,32.535469]], [["weapon", ""], ["uniform", "U_I_CombatUniform_tshirt"]]]
];

_vehicleStores = 
[
	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	[[1, 75, [], [26712.592,24601.9,20.398693],[[26701.904,24587.266,20.800213],[26749.461,24573.195,21.928879],[[26779.346,24558.525,23.465689],138.999],[26481.359,24687.391,-0.00056290452]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[6, 45, ["Boats"], [22958.713,18878.971,4.9242139],[[22954.973,18865.762,4.9896584],[22994.232,18835.289,3.5937061],[[23016.986,18820.279,3.2045362],102.082],[23002.1,18861.1,0.00150633]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[4, 250, ["Boats"], [20761.709,7264.2515,28.229145],[[20773.408,7242.7178,28.854717],[20798.02,7227.4385,29.127123],[[20816.563,7258.4517,27.98922],49.6784],[20772.9,7219.24,0.00149345]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[5, 155, ["Boats"], [14482.604,16330.667,18.864084],[[14501.121,16310.477,18.800117],[14515.698,16297.085,18.365541],[[14556.957,16253.292,17.871447],44.2668],[14510.3,16347.5,0.00144005]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[0, 190, ["Planes"], [3971.4854,15072.055,4.7541585],[[3968.136,15051.626,3.2309315],[4001.2522,15050.635,6.2997766],[[4005.88,15046.2,0.00132513],84.0853],[3922.1943,15060.141,0]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[0, 22, ["Planes", "Tanks"], [8982.7686,7669.5381,0],[[8971.1309,7673.0337,42.584538],[8968.1533,7690.6226,41.451664],[[8962.53,7668.43,0.00162125],32.3145],[8849.7217,7754.7354,-0.00086545764]]], [["weapon", ""], ["uniform", "U_Competitor"]]]
];

[_generalStores,_gunStores,_vehicleStores]