
CARDS={
	{ gid=0, n=3, id="Ermine Belt", 				ammo_max=3 },
	{ gid=1, n=2, id="Rightful Curtsy", 		ammo_max=1, knockback=50 },
	{ gid=2, n=1, id="Elite Gem", 					firerange=1, ammo_regen=1 },
	{ gid=3, n=3, id="Extra Barrel", 				pwe=6, spread=7, chamber_max=1 },
	{ gid=4, n=1, id="Royal Loafers", 			special="strafe"	},	
	{ gid=5, n=1, id="Majestic Censer",			soul_slot=1,ammo_max=1  },
	{ gid=6, n=1, id="Sacred Crown",				need_soul=1, crown=1  }, 
	{ gid=7, n=2, id="Blunderbuss",					spread=30, firepower=2  },
	{ gid=8, n=1, id="Engraved Scope",			special="scope" },	
	{ gid=9, n=2, id="Holy Gunpowder",			firepower=1,  },
	{ gid=10, n=1, id="Ritual Dagger",			blade=1, king_hp=-2, firerange=-1 },
	{ gid=11, n=1, id="August Presence",		presence=1  },
	{ gid=12, n=1, id="Crow's Blessing",		firerange=2 },	
	{ gid=17, n=1, id="The Moat",						moat=4 },		
	{ gid=13, n=1, id="Wand of Downpour",		wand={0,10}  },
	{ gid=14, n=1, id="Wand of Frenzy",			wand={1} },
	{ gid=15, n=1, id="Wand of Wrath",			wand={2,"firepower"} },
	{ gid=16, n=1, id="Wand of Wings",			wand={3,3}},
	{ gid=20, n=1, id="Wand of Gust",				wand={4} },	
	{ gid=25, n=1, id="Kingdom Wealth", 		pwe=3,ammo_max=6,	leader_hp=2 },	
	{ gid=18, n=2, id="Gradual Absolution", need_soul=2,pwe=2,absolution=1 },	
	{ gid=19, n=1, id="Taunting Hop", 			hop=1},		
	{ gid=21, n=1, id="Unfaithful Steed",		need=1,steed=1, flip_on="no_knight"},	
	{ gid=22, n=1, id="Unjust Decree", 			pwe=2,need_chamber_max=2, firepower=-1, special="decree" },
	{ gid=23, n=3, id="Kingly Alms", 				grenades_max=2, special="grenade" },
	{ gid=24, n=1, id="Subtle Poison", 			pwe=2,queen_hp=-1,leader_hp=-1, queen_poison=15}, 
	{ gid=26, n=2, id="Small Fry Harvest",  pwe=2,ammo_max=1,pawn_shell=1}, 
	{ gid=27, n=2, id="A Piercing Truth", 	pierce=30},	--firepower=-1
	{ gid=28, n=2, id="Black Mist", 				mist=1,firerange=-1 },
	{ gid=29, n=1, id="King's Shoulders",		pwe=2,grab=1 },
	{ gid=30, n=2, id="High Focus", 				spread=-18,firepower=1,flip_on="contact"},
	{ gid=31, n=1, id="Courteous Jousting", need=1, knight_joust=1, spread=-10 },	
	{ gid=32, n=1, id="Cornered Despot", 		firepower=2, flip_on="inner" },	
	

	-- NEW CARDS	
	{ gid=33, n=1, id="Sawed-off Justice", 	firepower=2, firerange=-1, recoil=1 },
	{ gid=34, n=1, id="Welcome Gift", 			firepower=4, flip_on="first-reload" },	
	{ gid=35, n=1, id="Cannon Fodder", 			pawnreap=1 },
	{ gid=36, n=1, id="Possessed", 					soul_slot=2, gain=2, need_card={"Conclave","Unholy Call"}},
	{ gid=37, n=1, id="Philanthropy", 			need_grenade=1, grenades_max=1, freegren=1, special="grenade", need_card="Kingly Alms"	},
	{ gid=38, n=3, id="Imperial Shot Put", 	cannonball=1, ammo_max=-1, need_card="King's Shoulders"	},
	{ gid=39, n=1, id="Egotic Maelstrom",		delay=10, cycle=1, delayed={firepower=1} },
	{ gid=40, n=1, id="Church Organ", 			ammo_max=2, chamber_max=2, need_card="Cathedral"	},
	{ gid=41, n=1, id="Black Plague",				plague=1,	firerange=-1, need_card={"Crow's Blessing","Ravenous Rats"}	},
	{ gid=42, n=1, id="Ravenous Rats",			rats=1 },
	{ gid=43, n=1, id="Deep Water",					deepwater=1, need_card="The Moat" },
	{ gid=44, n=1, id="Unholy Call",				pentagrams=3	},
	{ gid=45, n=1, id="Undercover Mission",	waypoint=1	},
	{ gid=46, n=2, id="Caltrops",						caltrops=1, delay_mult=-50	},
	{ gid=47, n=1, id="Nightbane",					blade=3	},
	{ gid=48, n=1, id="Bushido",						blade=2, bushido=1, firepower=-1	},
	{ gid=49, n=1, id="Bloodless Coups",		pawn_peace=1, pawn_curse=1	},
	
	-- POST BETA CARDS
	{ gid=50, n=1, id="Wand of Hypnosis",		wand={5}	},	
	{ gid=51, n=1, id="Presbyopia",					queen_minr=2, bishop_minr=2, need_card="Golden Aging"	},
	{ gid=52, n=1, id="Golden Aging",				need={4,8}, delay=10, cycle=1, queen_hp=-1, king_hp=-1, delayed={queen_tempo=1,leader_tempo=1}	},
	{ gid=53, n=1, id="Fool Companion",			need=8,	jester_guard=1,	need_card="The Jester"		},
	{ gid=54, n=1, id="Force-feeding",			overload=1, ammo_max=1			},

	--
	
	
	
	--
	{ gid=60, id="Backups", 					gain={0,0,0}, n=3  },
	{ gid=61, id="Cavalry", 					delay=15, gain={1,1} },
	{ gid=62, id="Conclave", 					delay=15, gain={2,2}  },	
	{ gid=63, id="Entitle", 					sac=0, gain=1, ammo_max=-1  },
	{ gid=64, id="Cardinal", 					sac=0, gain=2, ammo_max=-1 },	
	{ gid=65, id="Remparts",  				sac={0,0}, gain={3}, n=2  },	
	{ gid=66, id="Pillage",  					sac=3, gain={0,0,0,0,0}, pawn_hp=1  },	
	{ gid=67, id="Crusades",  				sac=2, gain={1,1}  },		
	{ gid=68, id="Peace",  						sac=1, gain={2,2}  },	
	{ gid=69, id="King's Mistress",		need=4, gain=4, queen_cage=3  },
	{ gid=70, id="Revolution",  			sac=2, gain={0,0,0,0,0,0},  },	
	{ gid=71, id="Bodyguard",  				need={1,8}, knight_bodyguard=1, knight_hp=1 },	
	{ gid=72, id="Ruins",  						gain={3,0,0}, rook_hp=-2  },	
	{ gid=73, id="Assault",  					need={0,0,0,0,0}, gain=0, assault=1  },
	{ gid=74, id="Kite Shield",  			need={1,1}, gain=0, knight_shield=1 },
	{ gid=75, id="Zealots", 					need=2, pawn_tempo=-1, bishop_tempo=-1, flip_on="no_bishop"  },
	{ gid=76, id="Militia", 					need={0,0,0}, gain=0, militia=1 },
	{ gid=77, id="Ammunition Depot",	n=2, gain=3, rook_shell=2	},
	{ gid=78, id="Scouting",					sac=1, gain={0,0}, pawn_tempo=-1 },	
	{ gid=79,	id="Pikemen",						need={0,0}, pawn_hp=1, pikemen=1 },
	{ gid=80,	id="Ascension",					need={2,2}, bishop_flying=1 },
	{ gid=81,	id="Castle",						need={3,8}, rook_castle=1, rook_hp=1 },	
	{ gid=82,	id="Conscription",			n=2, gain=0, delay=5, cycle=1 },
	{ gid=83,	id="Theocracy",					sac=5, gain=2, need=2, bishop_hp=2, theocracy=1, },
	{ gid=85,	id="Iron Maiden",				need=4, queen_iron=1, queen_tempo=2, flip_on="only_queen" },	
	{ gid=86,	id="Court of the King",	n=2, gain={1,1,2,3},all_tempo=1  },
	{ gid=87,	id="The Red Book",			gain=2, bishop_orth=1  },
	{ gid=88,	id="Saboteur",					n=2, sac={0,0}, gain=2, bad_shells=1  },	
	{ gid=89, id="Homecoming",				n=1, gain={4}, pwe=0	},
	{ gid=90,	id="Lookout Tower",			n=2, gain=3, delay=20, alarm=1 },	
	{ gid=91,	id="Throne Room",				need=5, king_hp=2, queen_hp=1 },
	{ gid=92,	id="The Secret Heir",		gain=0, heir=1 },
	{ gid=93,	id="Genderqueer",				sac=2, gain=4, delay=10 },
	
	-- NEW
	{ gid=94, id="Karma", 						sqb_spread=30, sqw_firepower=-1  },
	{ gid=95, id="Undead Armies",			knight_rep=0, rook_rep=0, bishop_rep=0, pawn_hp=-1  },
	{ gid=96, id="Shortage", 					sac=0, ammo_max=-3, grenades_max=-1	},
	{ gid=97, id="Succubus", 					gain=4, soul_slot=1	},
	{ gid=98, id="Bunker", 						need={0,0,0}, sac=3, need_grenade=1, pawn_hp=1, king_hp=1, grenade_dmg=-1, need_card="Kingly Alms"	},
	{ gid=99, id="Sanctity", 					gain=2, bishop_sanctity=1, need_card="Conclave"	},
	{ gid=100, id="Knightmare", 			gain=1, knight_wraith=1, knight_hp=-1, need_card="Black Mist"	},
	{ gid=101, id="Highest Dungeon", 	need={3}, all_hp=1, flip_on="no_rook",need_card="Remparts" },
	{ gid=102, id="Cathedral",				sac=2, gain=3, rook_protect=1, need_card="Cardinal"},
	{ gid=103, id="The Bridge",				bridge=1, delay=10, gain=1, need_card="The Moat" },
	{ gid=104, id="Divine Healing",		need={2}, bishop_hp=1, bishop_healer=2 },
	{ gid=105, id="Last Guardian",		need={0,0}, pawn_lastg=1},
	{ gid=106, id="Trowel",						need={3,0}, rook_hp=4, flip_on="no_pawn"},
	{ gid=107, id="Full Plate Armor",	blade=-1, all_hp=1, all_tempo=1 },
	{ gid=108, id="Military Academy",	delay=10, gain=1, cycle=1 },
	{ gid=109, id="Witch's Curse",		need=4, firepower=-1, firerange=-1, spread=10, queen_curse=1 },
	
	--- POST BETA CARDS
	{ gid=110, id="Saddle",						knight_carry=1, knight_tempo=1, need_card="Cavalry" }, --
	{ gid=111, id="The Jester",				need=0, gain=0, jester=1, need_card="Throne Room" }, --
	{ gid=112, id="Guillotine",				sac=5, need_card="Revolution" }, --
	{ gid=113, id="Analysis Paralysis", n=2, paralysis=6, need_card="High Focus" },
	

	
	-- A G C D
	
	-- SPECIFIC
	
	
}

EXCLUDE={
	{"Throne Room","Theocracy"},
	{"Ritual Dagger","Theocracy"},
	{"Royal Loafers","Unjust Decree","Kingly Alms","Engraved Scope"},
	{"Royal Loafers","Sawed-off Justice"},
	{"Militia","Bloodless Coups"},
	{"Guillotine","The Secret Heir"},
}

PIECES={
	{type=0, name="pawn", 		hp=3, tempo=5, danger=1, seek="wdist" },
	{type=1, name="knight", 	hp=3, tempo=3, danger=3, seek="kdist", nocarry=1 },
	{type=2, name="bishop", 	hp=4, tempo=3, danger=3, seek="bdist" },
	{type=3, name="rook", 		hp=5, tempo=4, danger=6, seek="rdist", nocarry=1 },	
	{type=4, name="queen", 		hp=5, tempo=4, danger=9, seek="qdist" },
	{type=5, name="king", 		hp=8, tempo=4, danger=6, seek="wdist" },
	{type=6, name="boss", 		hp=24, tempo=3, danger=16, big=true, seek="wdist", nocarry=1 }, 
	{type=7, name="all", 		 	}, 
	{type=8, name="leader", 	},
	{type=9, name="cannonball", 	hp=99, tempo=4, seek="wdist", inert=true, freelift=1, nocarry=1 },
}
