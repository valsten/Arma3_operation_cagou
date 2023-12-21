cutText ["", "BLACK FADED"];
10 fadeSound 1;
10 fadeMusic 0.5;
sleep 2;
titleCut ["", "BLACK IN", 5];

[] spawn {
	sleep 6;
	playMusic ["LeadTrack01_F_EPA", 1];
	sleep 5;
	[
	[
		"Aircraft Carrier FS Charles de Gaulle",
		2,
		2
	],
	[
		"Off the coast of the Horizon Islands",
		2,
		2
	],
	[
		"2nd Marine Infantry Parachute Regiment",
		2,
		2
	],
	[
		"Operation Kagou", 
		2, 
		2, 
		4
	]
] spawn BIS_fnc_EXP_camp_SITREP;
};