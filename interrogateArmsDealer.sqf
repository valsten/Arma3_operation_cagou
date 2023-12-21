params ["_target", "_player"];

[(_target call BIS_fnc_getName), "Okay! Okay! There's a shack just on the edge of the village with an arms cache."] spawn BIS_fnc_showSubtitle;
[_target,0,["ACE_MainActions","InterrogateCiv"]] call ace_interact_menu_fnc_removeActionFromObject;
sleep 5;
[parseText "<t font='PuristaBold' size='1.8' align='center'>You've gained some intel.</t>", true, [1, 1]] spawn BIS_fnc_textTiles;