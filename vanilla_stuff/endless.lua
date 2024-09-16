id="endless"
setup={
	slots_max={10,10},
}
base={
	chamber_max=2, firepower=4, firerange=3, spread=55, ammo_max=5,
	pawn_promote=1, surrender=1,
	gain={3,0,0,0,1,5,2,0}
}
function start()
	init_game()
	mode.lvl=0
	mode.turns=0
	next_floor()
end
function next_floor()
	mode.lvl=mode.lvl+1
	new_level()
end
function on_empty()
	end_level(grow)		
end
function on_hero_death()
	bank("save")
	if mode.lvl > bget(0,2) then
		bset(0,2,mode.lvl)
	end
	save()
	gameover()	
end


function grow()

	local data={
		id="level_up", 
		pan_xm=1,
		pan_ym=2, 
		pan_width=80,
		pan_height=96,
		choices={
			{{team=0},{team=1}},
			{{team=0},{team=1}},
		},
		force={
			{lvl=3,id="Homecoming",choice_index=0, card_index=1, desc_key="queen_escape" },
			{lvl=3,id="Homecoming",choice_index=1, card_index=1, desc_key="queen_everywhere" }
		}
	}	


	if mode.lvl<11 then
		level_up(data,next_floor)
	else			
		decay_up(next_floor)
	end	
end

--
function draw_inter()
	local s = lang.floor_.." "
	local x = lprint(s,MCW/2,board_y-19,3,1)
	lprint(mode.lvl,x,board_y-19,5)
end
