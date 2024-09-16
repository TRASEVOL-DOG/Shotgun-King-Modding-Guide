id="chase"

ban={
	"Egotic Maelstrom",
	"Undercover Mission",
	"Unholy Call",
	"Imperial Shot Put",

	"The Mole",
	"Bold Plan",
	"Patience",	
}

setup={
	slots_max={5,0},
}
base={
	chamber_max=2, firepower=4, firerange=3, spread=55, ammo_max=5, 
	ammo_regen=1, king_hp=-2, pawn_militia=1,
}

proba={0,0,0,0,1,1,2,2,3,3,4}
pieces_danger={1,3,3,6,9,0}
fill_last_slot=true
turns=0
recycle_down=1

function start()
	init_game()
	lvl=0

	-- SPAWNER
	score=0
	dif=2
	mode.turns=0

	
	-- LEVEL
	new_level()		

	-- FIRST SPAWN
	add_event( ev_side_spawn, {0,0,0})

	--
	--add_card("Militia")
	

end

function get_slot_data(team,i)
	if team==1 or i>4 then return nil end

	local data={
		x=19,
		y=13+i*32,
		team=team,
		side_icon=i==0 and 0 or 1,
	}	
	return data
end

-- ON
function on_hero_death()
	bank("save")
	if score > bget(0,3) then bset(0,3,score) end
	if mode.turns > bget(1,3) then bset(1,3,mode.turns) end
	
	save()
	gameover()
end
function on_new_turn()
	dif=dif+1/8
	local danger=0
	for b in all(bads) do
		danger=danger+(pieces_danger[b.type+1] or 0 )		
	end		
	

	
	-- NEW WAVE
	local tdif=dif+#get_slot_cards()
	
	if danger<tdif*.85 then 
		sfx("conscription")
		local a={}
		while danger<tdif do
			local tp=rnd(proba)
			add(a,tp)
			danger=danger+PIECES[tp+1].danger
			add_event(ev_side_spawn,tp)
		end
	end



	-- NEW KING
	if mode.turns%15==5 then
		add_event(ev_side_spawn,5)
	end
	
	-- NEW AMMO BOX
	if mode.turns%20==10 then
		add_event(ev_spawn_item,"ammo_box")
	end

		

end
function on_bad_death(e)
	local danger=pieces_danger[e.type+1]
	if not danger then return end
	local bounty=danger*5
	score=score+bounty

	if e.type==5 then
		local data={
			id="level_up", 
			pan_xm=3,
			pan_ym=1, 
			pan_width=128,
			pan_height=64,
			choices={
				{{team=0}},{{team=0}},{{team=0}},
			},
		}
		

		
		add_event(bind(level_up,data,continue_run))
	end


	--[[
	local p=mke(0,e.x,e.y)
	p.dp=DP_FX
	p.life=60
	p.vy=-2
	p.frict=.92
	p.dr=function(e,x,y)
		local str=bounty..""
		lprint(str,x,y,4,1,1)
	end
	--]]
	

end

function continue_run()
	hero.win=nil
	hero.first_reload=nil
	new_turn()
	--clean_up(new_turn)
end



function get_start_square()
	return gsq(3+irnd(2),3+irnd(2))
end


--
function draw_inter()
	local s=lang.score_
	local x = lprint(s,MCW/2,board_y-19,3,1)
	lprint(score,x,board_y-19,5)
end



-- NEED SOLVE
-- cards with sacrifice or adding piece
-- can't use wand/grenade the turn I get them

-- ? 1+ mist ?
