// disableThermal.sqf
// by CRE4MPIE
// ver 0.2
// 2015-04-29 11:44pm
// contributions from BIStudio Forums, edited by CRE4MPIE
// Edited By: Stoop

if (isServer) exitwith {}; //SpeedWeasel's Fix for CPS issues http://forums.a3wasteland.com/index.php?topic=1989.msg13160#msg13160

_layer = 85125;

while {true} do 
{ 
	// check for TI Mode
	if (currentVisionMode player == 2) then
	{
		// check if player is connected to a UAV
		if (alive (getConnectedUAV player)) then
		{				
			// Blackout screen with Text
			_layer    cutText ["Thermal Imaging OFFLINE while connected to a UAV terminal!.","BLACK",-1];
			playSound "FD_CP_Not_Clear_F";
			waituntil {currentVisionMode player != 2};
			_layer cutText ["", "PLAIN"];
		};
	};	
	
	sleep 1;
}