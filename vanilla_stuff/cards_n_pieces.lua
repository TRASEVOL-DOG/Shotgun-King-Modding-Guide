
CARDS={
	{ gid=0, ext=0, n=3, id="Ermine Belt", 				ammo_max=3,  }, --need_tag={"bleed","stealth"}
	{ gid=1, ext=0, n=2, id="Rightful Curtsy", 		ammo_max=1, knockback=50 },
	{ gid=2, ext=0, n=1, id="Elite Gem", 					firerange=1, ammo_regen=1 },
	{ gid=3, ext=0, n=3, id="Extra Barrel", 			pwe=6, spread=7, chamber_max=1 },
	{ gid=4, ext=0, n=1, id="Royal Loafers", 			special="strafe"	},	
	{ gid=5, ext=0, n=1, id="Majestic Censer",		soul_slot=1,ammo_max=1  },
	{ gid=6, ext=0, n=1, id="Sacred Crown",				need_soul=1, crown=1  }, 
	{ gid=7, ext=0, n=2, id="Blunderbuss",				spread=30, firepower=2  },
	{ gid=8, ext=0, n=1, id="Engraved Scope",			search=1, special="scope" },	
	{ gid=9, ext=0, n=2, id="Holy Gunpowder",			firepower=1,  },
	{ gid=10, ext=0, n=1, id="Ritual Dagger",			blade=1, leader_hp=-2, firerange=-1 },
	{ gid=11, ext=0, n=1, id="August Presence",		presence=1  },
	{ gid=12, ext=0, n=1, id="Crow's Blessing",		firerange=2 },				
	{ gid=13, ext=0, n=1, id="Wand of Downpour",	wand={0,10}  },
	{ gid=14, ext=0, n=1, id="Wand of Frenzy",		wand={1} },
	{ gid=15, ext=0, n=1, id="Wand of Wrath",			wand={2,"firepower"} },
	{ gid=16, ext=0, n=1, id="Wand of Wings",			wand={3,3}},
	{ gid=17, ext=0, n=1, id="The Moat",					moat=4 },
	{ gid=18, ext=0, n=2, id="Gradual Absolution", need_soul=2,pwe=2,absolution=1 },	
	{ gid=19, ext=0, n=2, id="Taunting Hop", 			hop=1, hop_dmg=1},	
	{ gid=20, ext=0, n=1, id="Wand of Gust",			wand={4} },	
	{ gid=21, ext=0, n=1, id="Unfaithful Steed",	need=1,steed=1, flip_on="no_knight"},	
	{ gid=22, ext=0, n=1, id="Unjust Decree", 		pwe=2,need_chamber_max=2, firepower=-1, special="decree" },
	{ gid=23, ext=0, n=3, id="Kingly Alms", 			grenades_max=1, grenade_center_dmg=2, special="grenade" },
	{ gid=24, ext=0, n=1, id="Subtle Poison", 		pwe=2,queen_hp=-1,leader_hp=-1, queen_poison=15}, 
	{ gid=25, ext=0, n=1, id="Kingdom Wealth", 		pwe=3,ammo_max=6,	leader_hp=2 },
	{ gid=26, ext=0, n=2, id="Small Fry Harvest", pwe=2,pawn_shell=1,blade=1}, 
	{ gid=27, ext=0, n=2, id="A Piercing Truth", 	pierce=30},	--firepower=-1
	{ gid=28, ext=0, n=2, id="Black Mist", 				mist=1,firerange=-1 },
	{ gid=29, ext=0, n=1, id="King's Shoulders",	pwe=2,grab=1 },
	{ gid=30, ext=0, n=2, id="High Focus", 				spread=-18,firepower=1,flip_on="contact"},
	{ gid=31, ext=0, n=1, id="Courteous Jousting",need=1, knight_joust=1, spread=-10 },	
	{ gid=32, ext=0, n=1, id="Cornered Despot", 	firepower=2, flip_on="inner" },	

	{ gid=33, ext=1, n=1, id="Sawed-off Justice", firepower=2, firerange=-1, recoil=1 },
	{ gid=34, ext=1, n=1, id="Welcome Gift", 			firepower=4, flip_on="first-reload", welcome=1 },	
	{ gid=35, ext=1, n=1, id="Cannon Fodder", 		pawnreap=1 },
	{ gid=36, ext=1, n=1, id="Possessed", 				soul_slot=2, gain=2, need_card={"Conclave","Unholy Call"}},
	{ gid=37, ext=1, n=1, id="Philanthropy", 			grenades_max=2, grenade_dmg=-1, special="grenade" },
	{ gid=38, ext=1, n=3, id="Imperial Shot Put", cannonball=1, ammo_max=-1, need_card="King's Shoulders"	},
	{ gid=39, ext=1, n=1, id="Egotic Maelstrom",	delay=10, cycle=1, delayed={firepower=1} },
	{ gid=40, ext=1, n=1, id="Church Organ", 			ammo_max=2, chamber_max=2, need_card="Cathedral"	},
	{ gid=41, ext=1, n=1, id="Black Plague",			plague=1,	firerange=-1, need_card={"Crow's Blessing","Ravenous Rats"}	},
	{ gid=42, ext=1, n=1, id="Ravenous Rats",			rats=1 },
	{ gid=43, ext=1, n=1, id="Deep Water",				deepwater=1, need_card="The Moat" },
	{ gid=44, ext=1, n=1, id="Unholy Call",				pentagrams=3	},
	{ gid=45, ext=1, n=1, id="Undercover Mission",waypoint=1 },
	{ gid=46, ext=1, n=2, id="Caltrops",					caltrops=15, bleed_slow=1	}, --delay_mult=-50
	{ gid=47, ext=1, n=1, id="Nightbane",					blade=3	},
	{ gid=48, ext=1, n=1, id="Bushido",						blade=2, bushido=1, firepower=-1	},
	{ gid=49, ext=1, n=1, id="Bloodless Coups",		pawn_peace=1, pawn_curse=1	},
	{ gid=50, ext=1, n=1, id="Wand of Hypnosis",	wand={5}	},	
	{ gid=51, ext=1, n=1, id="Presbyopia",				queen_bishop_minr=2, need_card="Golden Aging"	},
	{ gid=52, ext=1, n=1, id="Golden Aging",			need={4,8}, delay=10, cycle=1, leader_queen_hp=-1,delayed={leader_queen_tempo=1}	},
	{ gid=53, ext=1, n=1, id="Fool Companion",		jester_guard=1,	need_card="The Jester"		},
	{ gid=54, ext=1, n=1, id="Force-feeding",			overload=1, full_firepower=1		},
	
	{ gid=55, ext=2, n=1, id="Seer's Orb",				special="orb", search=1, orb=1			},
	{ gid=56, ext=2, n=2, id="Fearsome", 					fearsome=1, ammo_max=1 },	
	{ gid=57, ext=2, n=1, id="Human Shield", 			humanshield=1, need_card="Fearsome", ammo_max=2 },
	{ gid=58, ext=2, n=1, id="Reign of Terror", 	terrorism=1, need_card="Fearsome", ammo_max=-2 },
	{ gid=59, ext=2, n=1, id="Selective Listening", 	tactic=2 },
	{ gid=60, ext=2, n=1, id="Monarch's Confidence", need_chamber_max=2, confidence=1 },
	{ gid=61, ext=2, n=2, id="The Mole", 					ammo_max=1, spy=1, need={0,0,0,0,0,0,0} },
	{ gid=62, ext=2, n=1, id="Elusive", 					hop=1, elusive=1 },
	{ gid=63, ext=2, n=1, id="Holoking", 					holoking=1 },
	{ gid=64, ext=2, n=1, id="Cloaking Device",		holocloak=1, holoreveal=1, need_card="Holoking" },	
	{ gid=65, ext=2, n=2, id="Low-Cost Disguise",	pawn_disguise=2 },	
	{ gid=66, ext=2, n=1, id="Wand of Souls",			wand={6} },
	{ gid=67, ext=2, n=1, id="Wand of Execution", wand={7} },
	{ gid=68, ext=2, n=2, id="Patience",					ammo_max=1, browse=1, floor_max=9 },
	{ gid=69, ext=2, n=3, id="Bold Plan",					replace_white_card=1 },
	{ gid=70, ext=2, n=1, id="Silencer",					silencer=1, firerange=-1, need_tag="cloak", },
	{ gid=71, ext=2, n=1, id="Ambush",						grenade_dmg=1, firerange=2, need_tag="cloak", flip_on="not_cloaked" },
	{ gid=72, ext=2, n=1, id="Ancient Flagstone",	flagstones=1 },
	{ gid=73, ext=2, n=1, id="Tearing Bullets",		tearing=1 },
	{ gid=74, ext=2, n=1, id="Indelible Memories",	grenades_max=1,	grenade_bleed=1, special="grenade" },
	{ gid=75, ext=2, n=1, id="Mystic Shackles",		shackles=1, need_tag="orb"	},
	{ gid=76, ext=2, n=1, id="Secret Move",				hop=1, botte=2, need_tag="jump" }, -- Botte Secrete
	{ gid=77, ext=2, n=1, id="Sacred Light",			grenades_max=1, grenade_dmg=-2, grenade_stun=2, grenade_proof=1, special="grenade" },
	{ gid=78, ext=2, n=1, id="Workshop",					delay=8, cycle=1, delayed={mk_grenades=1,mk_ammo=2}, need_tag="grenade" },
	
	
	
	-- White cards
	{ gid=80, ext=0, id="Backups", 					gain={0,0,0}, n=3, team=1  },
	{ gid=81, ext=0, id="Cavalry", 					delay=15, gain={1,1} },
	{ gid=82, ext=0, id="Conclave", 				delay=15, gain={2,2}  },	
	{ gid=83, ext=0, id="Entitle", 					sac=0, gain=1, ammo_max=-1  },
	{ gid=84, ext=0, id="Cardinal", 				sac=0, gain=2, ammo_max=-1 },	
	{ gid=85, ext=0, id="Remparts",  				sac={0,0}, gain={3}, n=2  },	
	{ gid=86, ext=0, id="Pillage",  				sac=3, gain={0,0,0,0,0}, pawn_hp=1  },	
	{ gid=87, ext=0, id="Crusades",  				sac=2, gain={1,1}  },		
	{ gid=88, ext=0, id="Peace",  					sac=1, gain={2,2}  },	
	{ gid=89, ext=0, id="King's Mistress",	need=4, gain=4, queen_cage=3  },
	{ gid=90, ext=0, id="Revolution",  			sac=2, gain={0,0,0,0,0,0},  },	
	{ gid=91, ext=0, id="Bodyguard",  			need={1,8}, knight_bodyguard=1, knight_hp=1 },	
	{ gid=92, ext=0, id="Ruins",  					gain={3,0,0}, rook_hp=-2  },	
	{ gid=93, ext=0, id="Assault",  				need={0,0,0,0,0}, gain=0, pawn_assault=1  },
	{ gid=94, ext=0, id="Kite Shield",  		need={1,1}, gain=0, knight_shield=1 },
	{ gid=95, ext=0, id="Zealots", 					need=2, pawn_tempo=-1, bishop_tempo=-1, flip_on="no_bishop"  },
	{ gid=96, ext=0, id="Militia", 					need={0,0,0}, gain=0, pawn_militia=1 },
	{ gid=97, ext=0, id="Ammunition Depot",	n=2, gain=3, rook_shell=2	},
	{ gid=98, ext=0, id="Scouting",					sac=1, gain={0,0}, pawn_tempo=-1 },	
	{ gid=99, ext=0, id="Pikemen",					need={0,0}, pawn_hp=1, pawn_pike=1, pawn_reformed=1 },
	{ gid=100, ext=0,	id="Ascension",				need={2,2}, bishop_flying=1 },
	{ gid=101, ext=0,	id="Castle",					need={3,8}, rook_castle=1, rook_hp=1 },	
	{ gid=102, ext=0,	id="Conscription",		n=2, gain=0, delay=5, cycle=1 },
	{ gid=103, ext=0,	id="Theocracy",				sac=5, gain=2, need={2,2}, bishop_hp=2, theocracy=1, ruler=2, no_ruler=1},
	{ gid=104, ext=0,	id="Fallen Dynasty", 	fallen=1, pwe=0	},
	{ gid=105, ext=0,	id="Iron Maiden",			need={4,4}, sac=4, queen_iron=1, queen_tempo=2, flip_on="only_queen" },	
	{ gid=106, ext=0,	id="Court of the King",	n=2, gain={1,1,2,3},all_tempo=1  },
	{ gid=107, ext=0,	id="The Red Book",		gain=2, bishop_orth=1, },
	{ gid=108, ext=0,	id="Saboteur",				n=2, sac={0,0}, gain=2, bad_shells=1  },	
	{ gid=109, ext=0,	id="Homecoming",			n=1, gain={4}, pwe=0	},
	{ gid=110, ext=0,	id="Lookout Tower",		n=2, gain=3, delay=20, alarm=1 },	
	{ gid=111, ext=0,	id="Throne Room",			need=5, leader_hp=2, queen_hp=1 },
	{ gid=112, ext=0,	id="The Secret Heir",	gain=0, heir=1 },
	{ gid=113, ext=0,	id="Genderqueer",			sac=2, gain=4, delay=10 },

	{ gid=114, ext=1, id="Karma", 						sqb_spread=30, sqw_firepower=-1, reversable=1  },
	{ gid=115, ext=1, id="Undead Armies",			knight_bishop_rook_rep=0, pawn_hp=-1  },
	{ gid=116, ext=1, id="Shortage", 					sac=0, ammo_max=-3, grenades_max=-1, need_tag="grenade"	},
	{ gid=117, ext=1, id="Succubus", 					gain=4, soul_slot=1	},
	{ gid=118, ext=1, id="Bunker", 						need={0,0,0}, sac=3, leader_pawn_hp=1, grenade_dmg=-1, need_tag="grenade"	},
	{ gid=119, ext=1, id="Sanctity", 					gain=2, bishop_sanctity=1, need_card="Conclave"	},
	{ gid=120, ext=1, id="Knightmare", 				gain=1, knight_wraith=1, knight_hp=-1, need_card="Black Mist"	},
	{ gid=121, ext=1, id="Highest Dungeon", 	need={3}, all_hp=1, flip_on="no_rook",need_card="Remparts" },
	{ gid=122, ext=1, id="Cathedral",					sac=2, gain=3, rook_protect=1, need_card="Cardinal"},
	{ gid=123, ext=1, id="The Bridge",				bridge=1, delay=10, gain=1, need_card="The Moat" },
	{ gid=124, ext=1, id="Divine Healing",		need={2}, bishop_hp=1, bishop_healer=2 },
	{ gid=125, ext=1, id="Last Guardian",			need={0,0}, pawn_lastg=1},
	{ gid=126, ext=1, id="Trowel",						need={3,0}, rook_hp=4, flip_on="no_pawn"},
	{ gid=127, ext=1, id="Full Plate Armor",	blade=-1, all_hp=1, all_tempo=1 },
	{ gid=128, ext=1, id="Military Academy",	delay=10, gain=1, cycle=1 },
	{ gid=129, ext=1, id="Witch's Curse",			need=4, firepower=-1, firerange=-1, spread=10, queen_curse=1 },
	{ gid=130, ext=1, id="Saddle",						need=1, knight_carry=1, knight_tempo=1 },
	{ gid=131, ext=1, id="The Jester",				need=0, gain=0, jester=1, need_card="Throne Room" },
	{ gid=132, ext=1, id="Guillotine",				sac=5, need_card="Revolution", exclude_tag="leader" },
	{ gid=133, ext=1, id="Analysis Paralysis", n=2, paralysis=6, search=1, need_card="High Focus" },

	{ gid=134, ext=2, id="Plumed Knight",			need=1, choose_knight_plumed=1			},
	{ gid=135, ext=2, id="Emergency Call",		need={0,0}, leader_emergency=1, gain=0			},
	{ gid=136, ext=2, id="Mangonel",					gain=3, rook_catapult=1, rook_tempo=1		},
	{ gid=137, ext=2, id="Governess",					gain=2, force_promote=4			},
	{ gid=138, ext=2, id="Mausoleum",					gain=3, rook_leaderbond=2			},
	{ gid=139, ext=2, id="Reverend Mother",		gain=4, queen_despair=1, need_card="Theocracy"	},
	{ gid=140, ext=2, id="Sokoban",						gain={0,0}, need={3,3}, rook_push=3 	},
	{ gid=141, ext=2, id="Tag Team",					need={2,3}, bishop_swap={3}, rook_swap={2}, rook_bishop_hp=1 }, --
	{ gid=142, ext=2, id="Unicorn",						knight_charge=1, gain=1 }, --
	{ gid=143, ext=2, id="Lady in the Tower", gain=3,	rook_killprom=4	 }, --
	{ gid=144, ext=2, id="Final Countdown", 	deathcount=12, deathcount_trig=6 }, 	
	{ gid=145, ext=2, id="Nomad Life", 				n=2, sac=3, gain={1,1,2}, knight_promote=1 }, 	
	{ gid=146, ext=2, id="Prison",						need={1,2,3},	gain={2,1}, knight_bishop_prison=3 },
	{ gid=147, ext=2, id="Inquisition",				gain=2, sac=0, bishop_uncover=1, bishop_investigate=1, need_tag={"mission","cloak"}	}, -- bishop can kill spy and cancel missions
	{ gid=148, ext=2, id="King's Look-alike", n=2, gain=5, false_king=1, leader_hp=1, no_ruler=1 },
	{ gid=149, ext=2, id="The Royal Hunt",		n=2, leader_bow=2 },	
	{ gid=150, ext=2, id="Tragic Homecoming",	n=1, gain={4}, pwe=0, queen_hp=2 },
	{ gid=151, ext=2, id="Buckler of Limos",	leader_armorgap=3, leader_tempo=1, need_firepower=5 },
	{ gid=152, ext=2, id="Vampirism",					leader_queen_vampire=1, leader_queen_hp=1, need_tag="bleed" }, --false_king=1,
	{ gid=153, ext=2, id="Commoner's Reign", 	sac=5, ruler=1, knight_hp=2, pwe=0 },
	{ gid=154, ext=2, id="Bouncy Castle", 		need_knockback=100, rook_hp=-2, trampoline=1 }, 
	
	{ gid=155, ext=2, id="Self-Defense", 			knight_hp=2, pwe=0 }, 
	{ gid=156, ext=2, id="Unsettled Throne", 	need_heir=1, heir=1, heirprom=1 }, 

}



EXCLUDE={
	{"Royal Loafers","Sawed-off Justice"},
	{"Militia","Bloodless Coups"},
	{"Guillotine","The Secret Heir"},
	--
	{"The Red Book","The Royal Hunt"},
	{"The Red Book","Buckler of Limos"},
}

AUTO_REPLACE={
	{"Bodyguard","Commoner's Reign","Self-Defense"},
}

TAGS={
	{ id="leader", 		attributes={"leader","king"} },
	{ id="mission", 	attributes={"waypoint","spy"} },
	{ id="cloak", 		attributes={"holocloak","disguise"}},
	{ id="bleed", 		attributes={"grenade_bleed","tearing","caltrops"}},
	{ id="orb", 			attributes={"orb"}},
	{ id="jump", 			attributes={"hop"}},
	{ id="grenade",	attributes={"freegren","grenade"}},
}

PIECES={
	{ type=0, name="pawn", 		hp=3, tempo=5, 
		behavior={
			{ id="line",1,1,1,  move=1 },
			{ id="line",4,5,1,  atk=1 },			
		},
		danger=1, seek="wdist", hdy=2, 
	},
	{ type=1, name="knight", 	hp=3, tempo=3, 
		behavior={
			{ id="jump", move=1, atk=1, 2,-1,2,1, 1,2,-1,2, -2,-1,-2,1, -1,-2,1,-2 }
		},
		danger=3, seek="kdist", hdy=1, nocarry=1 
	},
	{ type=2, name="bishop", 	hp=4, tempo=3,
		behavior={
			{ id="line",4,7,8,  move=1, atk=1 },
		},
		danger=3, seek="bdist", hdy=0 
	},
	{ type=3, name="rook", 		hp=5, tempo=4,
		behavior={
			{ id="line",0,3,8,  move=1, atk=1 },
		},
		danger=6, seek="rdist", hdy=1, nocarry=1
	},	
	{ type=4, name="queen", 	hp=5, tempo=4,
		behavior={
			{ id="line",0,7,8,  move=1, atk=1 },
		},
		danger=9, seek="qdist", hdy=0
	},
	{ type=5, name="king", 		hp=8, tempo=4,
		behavior={
			{ id="line",0,7,1,  move=1, atk=1 },
		},
		danger=6, seek="wdist", hdy=0 
	},
	{ type=6, name="boss", 		hp=24, tempo=3, boss=1,
		behavior={
			{ id="line",0,3,1,  move=1, },
			{ id="jump",2,0,2,1, 0,2,1,2, -1,0,-1,1,  0,-1,1,-1,  atk=1, fatality="eat" },
		},
		danger=16, big=true, seek="wdist", hdy=-24, nocarry=1,
	},  -- was 24
	{ type=7, name="all", 		}, 
	{ type=8, name="leader", 	},
	{ type=9, name="cannonball", 	hp=99, tempo=4,
		behavior={},
		seek="wdist", hdy=0, inert=true, freelift=1, nocarry=1, knockback=100, 
	},
	{ type=10, name="queen mother", hp=30, tempo=4,
		behavior={
			{ id="line",0,7,8,  move=1, atk=1 },
		},
		danger=16, seek="qdist", hdy=0, boss=1, unlift=1 
	},
	{ type=11, name="horseman", 	hp=12, tempo=4,
		behavior={
			{ id="jump", move=1, atk=1, 2,-1,2,1, 1,2,-1,2, -2,-1,-2,1, -1,-2,1,-2 }
		},
		danger=9, seek="kdist", hdy=0, team_boss=1, soul_fx=1, unlift=1
	},
}
