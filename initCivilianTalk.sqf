_civs = allUnits select {alive _x AND side _x isEqualTo civilian};
_reveal = (missionNamespace getVariable ["TAG_fnc_civsAsked",0]) >= 6;//will return true on the third unit
_action = ["TalkCivilian","Talk to Civilian","",{[_target, _player] execVM "talkToCivilian.sqf"},{true}] call ace_interact_menu_fnc_createAction;
_action2 = ["InterrogateCiv","Interrogate","",{[_target, _player] execVM "interrogateArmsDealer.sqf"},{true}] call ace_interact_menu_fnc_createAction;

{
	[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _civs;

[armsdealer1, 0, ["ACE_MainActions","TalkCivilian"]] call ace_interact_menu_fnc_removeActionFromObject;
[armsdealer1, 0, ["ACE_MainActions"], _action2] call ace_interact_menu_fnc_addActionToObject;

while {!_reveal} do {
	if (_reveal) exitWith {
		[(_target call BIS_fnc_getName), "The rebels are definitely operating around this jungle. I've seen them carry equipment and weapons deep into it."] spawn BIS_fnc_showSubtitle;
		[parseText "<t font='PuristaBold' size='1.8' align='center'>The likely location of a rebel cache has been located.</t>", true, [1, 1]] spawn BIS_fnc_textTiles;
		//remove all actions from the remaining civs
		{
			[_x,0,["ACE_MainActions","TalkCivilian"]] call ace_interact_menu_fnc_removeActionFromObject;
		} forEach _civs;
	};
	sleep 15;
};