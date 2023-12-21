params ["_target", "_player"];

_randomNegativeAnswers = ["Rebels? More like patriots in my opinion.","I'm busy, go bother someone else","I don't know anything about the rebels.","I'm just living my life here, no idea about any rebels.","I'm not interested in talking to you.","It's not my place to talk about such things.","I dot think you should be around here.","I haven't noticed anything odd.","I haven't seen any rebels around here."];

_randomPositiveAnswers = ["I noticed some suspicious activity earlier.","There were some armed men around this location.","I've noticed boats on the beach at night sometimes.","There are definitely rebels around here.","I swear I saw rebels when I was hiking last time.","I've noticed armed men around here.","There is an individual storing weapons somewhere near here.","I saw some rebels while I was on a drive yesterday.","I noticed a very suspicious gathering in the past.","I've heard plenty of rumours about guerrilla activity around here."];

if (random 20>14) then {
//_object globalChat selectRandom _randomPositiveAnswers;
	[(_target call BIS_fnc_getName), selectRandom _randomPositiveAnswers] spawn BIS_fnc_showSubtitle;
	_counter = missionNamespace getVariable ["TAG_fnc_civsAsked",0];
	_counter = _counter + 1;
	missionNamespace setVariable ["TAG_fnc_civsAsked",_counter,true];
	[_target,0,["ACE_MainActions","TalkCivilian"]] call ace_interact_menu_fnc_removeActionFromObject;
	sleep 5;
	[parseText "<t font='PuristaBold' size='1.8' align='center'>You've gained some intel.</t>", true, [1, 1]] spawn BIS_fnc_textTiles;
}

else {
//_target globalChat selectRandom _randomNegativeAnswers;
	[(_target call BIS_fnc_getName), selectRandom _randomNegativeAnswers] spawn BIS_fnc_showSubtitle;
	[_target,0,["ACE_MainActions","TalkCivilian"]] call ace_interact_menu_fnc_removeActionFromObject;
};