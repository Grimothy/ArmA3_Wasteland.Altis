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
	[[3, 245, [], [8663.9717,18241.66,0], [8656.6396,18249.031,183.44957]], [["weapon", ""], ["uniform", "U_IG_Guerilla2_2"]]],
	[[4, 320, [], [1876.051,16636.01,0], [18749.602,16642.104,32.972607]], [["weapon", ""], ["uniform", "U_IG_Guerilla2_3"]]],
	[[1, 200, [], [9005.18,12068.8,0], [8996.7793,12074.253,28.877954]], [["weapon", ""], ["uniform", "U_IG_Guerilla3_1"]]]	
];

_generalStores = 
[
	[[5, 290, [], [14007.719,18629.781,0], [14014.736,18642.689,25.641336]], [["weapon", ""], ["uniform", "U_B_SpecopsUniform_sgg"]]],
	[[5, 45, [], [27013.463,23239.553,0], [27021.793,23231.338,20.63834]], [["weapon", ""], ["uniform", "U_O_SpecopsUniform_blk"]]],
	[[5, 200, [], [5071.7988,11221.761,0], [5090.334,11218.821,47.426117]], [["weapon", ""], ["uniform", "U_I_CombatUniform_tshirt"]]],
	[[5, 105, [], [20273.021,11605.719,0], [20286.137,11604.8,64.600761]], [["weapon", ""], ["uniform", "U_IG_Guerilla1_1"]]]
];

_vehicleStores = 
[
	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	[[1, 75, [], [26712.592,24601.9,20.398693],[[26701.904,24587.266,20.800213],[26749.461,24573.195,21.928879],[[26779.346,24558.525,23.465689],138.999],[26481.359,24687.391,-0.00056290452]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[6, 45, ["Boats"], [22958.713,18878.971,4.9242139],[[22954.973,18865.762,4.9896584],[22994.232,18835.289,3.5937061],[[23016.986,18820.279,3.2045362],102.082],[23002.1,18861.1,0.00150633]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[4, 250, ["Boats"], [20761.709,7264.2515,28.229145],[[20773.408,7242.7178,28.854717],[20798.02,7227.4385,29.127123],[[20816.563,7258.4517,27.98922],49.6784],[20772.9,7219.24,0.00149345]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[5, 155, ["Boats"], [14482.604,16330.667,18.864084],[[14501.121,16310.477,18.800117],[14515.698,16297.085,18.365541],[[14556.957,16253.292,17.871447],44.2668],[14510.3,16347.5,0.00144005]]], [["weapon", ""], ["uniform", "U_Competitor"]]],
	[[0, 190, ["Planes"], [3971.4854,15072.055,4.7541585],[[3968.136,15051.626,3.2309315],[4001.2522,15050.635,6.2997766],[[4005.88,15046.2,0.00132513],84.0853],[3922.1943,15060.141,0]]], [["weapon", ""], ["uniform", "U_Competitor"]]]
];

[_generalStores,_gunStores,_vehicleStores]

