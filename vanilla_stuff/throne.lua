id="throne"
setup={
	slots_max={10,10},
}
weapons={
	{ gid=0, name="Solomon",			chamber_max=2, firepower=4, firerange=3, spread=55, ammo_max=6, },
	{ gid=1, name="Victoria", 		chamber_max=1, firepower=5, firerange=4, spread=45, ammo_max=3, },
	{ gid=2, name="Ramesses II",	chamber_max=2, firepower=4, firerange=3, spread=65, ammo_max=5, knockback=50, },
	{ gid=3, name="Richard III",	chamber_max=3, firepower=3, firerange=5, spread=75, ammo_max=8, pierce=25 },
	{ gid=4, name="Makeda",				chamber_max=2, firepower=3, firerange=3, spread=50, ammo_max=6, blade=2 },
	{ gid=4, name="Alexander",		chamber_max=2, firepower=4, firerange=3, spread=65, ammo_max=8, search=1 },
	{ gid=4, name="Yvan IV",			chamber_max=1, firepower=4, firerange=2, spread=50, ammo_max=6, all_freereload=1 },

}


-- NEW SHOTGUN : ghost shotgun : +1 soul slot + start empty ( +1 regen ammo )


ranks={
	{ nothing=1 },
	{ gain={0,0} },
	{ gain={3} },
	{ king_hp=1 },
	{ gain={1} },
	{ spread=10 },
	{ king_hp=1 },
	{ gain={2} },	-- at floor 3 ?
	
	{ rook_hp=1 },
	{ knight_hp=1 },
	{ boss_hprc=200 },
	{ spread=15 },
	{ rook_hp=1 },
	{ ammo_max=-1 },
	{ all_hp=1, ammo_max=2 },
}
base={
	pawn_promote=1, surrender=1,
	gain={0,0,0,1,5,2,0},

}

intro=true

-- X2-4 Y4 weapons unlock
-- X0 ranks pref
-- X1 weapon pref

function initialize()
	newsrf("assets/gfx/weapons.png", "weapons")
	mode.ranks_index=mid(0,bget(0,4),#ranks-1)
	mode.weapons_index=mid(0,bget(1,4),#weapons-1)
end

function start()

	if intro and not DEV then
		intro=false
		init_vig({1,2,3},start)
		return
	end

	init_game()
	mode.lvl=0
	mode.turns=0


	if START_LVL then
		build_stack()
		mode.lvl=START_LVL
		for ti=0,1 do
			for fi=1,min(START_LVL,10) do
				local ca=pick({team=ti})
				local card=new_card(ca.id)
				if get_free_card_slot(card)==nil then
					kl(card)
					break
				end
				add_card(card)
				ca.n=ca.n-1
				if ca.n>0 then add(cards.pool,ca) end
			end
		end
		if START_LVL==11 and game_mode=="throne" then
			add(upgrades,{gain={6},sac={5}})
		end
	end



	next_floor()

end
function next_floor()
	mode.lvl=mode.lvl+1
	new_level()
end
function grow()
	if mode.lvl<11 then
		local data={
			id="level_up",
			pan_xm=1,
			pan_ym=2,
			pan_width=80,
			pan_height=96,
			choices={
				{{team=0},{team=1}}, --,{team=0}
				{{team=0},{team=1}},
			},
			force={
				{lvl=3,id="Homecoming",choice_index=0, card_index=1, desc_key="queen_escape" },
				{lvl=3,id="Homecoming",choice_index=1, card_index=1, desc_key="queen_everywhere" }
			}
		}
		level_up(data,next_floor)
	elseif mode.lvl==11 then
		add(upgrades,{gain={6},sac={5}})
		build_stack()
		init_vig({4},next_floor)
	end
end
function outro()

	local v={6,7}
	local best=13

	trig_achievement("COMPLETE")

	if hero.apo then
		v={14}
		trig_achievement("NEW_JOB")
	elseif boss.book then
		best=14
		v={8,6,11}
		trig_achievement("AVENGED")
		if chamber>0  then
			best=15
			v={8,9,10,6,12}
			trig_achievement("EXORCISED")
		end
	elseif boss.type==10 then
		v={13,6,7}
		trig_achievement("MARITAL_PEACE")
	elseif boss.type==11 then
		v={15,6,7}
		trig_achievement("END_OF_THE_WORLD")
	end

	-- BEST FLOOR & BEST RANK
	local rank=mode.ranks_index+1
	bank("save")
	if mode.lvl>bget(rank,1) then bset(rank,1,mode.lvl) end
	if rank>bget(0,1) then bset(0,1,rank) end

	-- BEST TIME
	local best_time=bget(rank,2)
	if best_time==0 or chrono_time<best_time then
		bset(rank,2,chrono_time)
		new_best_time=true
	end

	-- OTHER ACHIEVEMENTS
	local shotgun=weapons[mode.weapons_index+1]
	trig_achievement(sbs(uppercase(shotgun.name)," ", "_"))
	trig_achievement("RANK_"..(mode.ranks_index+1))
	ach_event("win")


	--
	save()


	-- COLLECTION
	check_collections()


	init_vig(v,init_menu)
end

-- ON
function on_empty()
	end_level(grow)
end
function on_hero_death()
	local rank=mode.ranks_index+1
	bank("save")
	if mode.lvl>bget(rank,1) then bset(rank,1,mode.lvl) end
	save()
	gameover()
end
function on_boss_death()


	if boss.type==6 and not boss.dark then
		
		-- CHECK BLACK BISHOP SPAWN
		local bishops=get_pieces(2)
		local book=has_card("The Red Book")
		local theo=stack.torn_theo
		if book and theo and #bishops==1 then	
			storm_all_but(bishops[1],spawn_dark_bishop)	
			return
		end
		
		-- CHECK QUEEN MOTHER
		local queens=get_pieces(4)
		if #queens==1 and queens[1].iron then
			storm_all_but(queens[1],spawn_mother_queen)		
			return
		end
	
		-- CHECK HORSEMEN OF THE APOCALYPSE
		local knights=get_pieces(1)
		knights.list=1
		if #knights==4 then
			storm_all_but(knights,spawn_horsemen)
			return
		end
		
	end
	

	-- END GAME
	music("ending_A",0)
	fade_to(-4,30,outro)

end

-- WEAPONS & pref
function get_weapons_list()
	local a={0}
	for i=2,#weapons do
		if bget(i,4)==1 then add(a,i-1) end
	end
	return a
end

function get_max_rank()
	return bget(0,1)+1
end

function check_unlocks()

	bank("save")
	local function unlock(x)
		if bget(x,4)==0 then
			bset(x,4,1)
			save()
			fx_unlock(weapons[x].name,{icon={x=21,y=282,w=12,h=6}})
		end
	end
	if get_firerange()>=6 then unlock(2) end
	if stack.knockback>=100 then unlock(3) end
	if stack.chamber_max>=4 then unlock(4) end
	if stack.blade and stack.blade>=4 then unlock(5) end
	if (inter.searched or 0) >= 4 then unlock(6) end
	if stack.firerange==0 then unlock(7) end


end
function save_preferences()
	bset(0,4,mode.ranks_index)
	bset(1,4,mode.weapons_index)
	save()
	--log(mode.ranks_index)
end
--
function draw_inter()
	--spritesheet("tutorial") -- bg (maybe add it as easter egg)
	--sspr(208,0,320,182,0,0)
	--spritesheet("gfx")

	local s = lang.floor_.." "
	local x = lprint(s,MCW/2,board_y-19,3,1)
	lprint(mode.lvl,x,board_y-19,5)
end


