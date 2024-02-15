id="skirmish"
setup={
	slots_max={10,10},
}

weapons={ -- The vanille Throne shotguns
	{ gid=0, name="Solomon",			chamber_max=2, firepower=4, firerange=3, spread=55, ammo_max=6, },
	{ gid=1, name="Victoria", 		chamber_max=1, firepower=5, firerange=4, spread=45, ammo_max=3, },
	{ gid=2, name="Ramesses II",	chamber_max=2, firepower=4, firerange=3, spread=65, ammo_max=5, knockback=50, },
	{ gid=3, name="Richard III",	chamber_max=3, firepower=3, firerange=5, spread=75, ammo_max=8, pierce=25 },
	{ gid=4, name="Makeda",				chamber_max=2, firepower=3, firerange=3, spread=50, ammo_max=6, blade=2 },
}

base={
	-- promotion=1, -- Pawn promotion disabled for this game mode
	surrender=1,
	gain={0,0,0,0,1,2,3,5},
	militia=1
}

function initialize()
	-- You have to create a bank if you want to save stuff.
	-- This isn't needed if you already created a save bank in your script.lua file.
	newbnk(128,64,4)
	
	-- We want to use our own weapon spritesheet
	newsrf("weapons.png", "weapons")
	mode.weapons_index=mid(0,bget(1,4),#weapons-1)
end

function start()
	init_game()

	score=0
	dif=2
	mode.lvl=0
	mode.turns=0
	next_floor()
end

function get_start_square() -- Black King start position
	return gsq(3+irnd(2),3+irnd(2))
end

-- Spawn pieces
-- Here we're using prepend and append to execute code before and after the game calls its 'spawn_pieces' internal function.
local army
prepend("spawn_pieces", function()
	army,white_army=white_army,{}
end, "sample_skirmish")
append("spawn_pieces", function()
	white_army=army
	
	local pieces={}
	for k,n in pairs(army) do
		if k~=5 then
			for i=1,n do
				add(pieces,k)
			end
		end
	end
	add_event(ev_side_spawn, pieces)
end, "sample_skirmish")

-- Progression
function on_empty()
	-- When the floor is cleared we end the level.
	end_level(grow)
end

function next_floor()
	mode.lvl=mode.lvl+1
	mode.turns=0
	new_level()
end

function grow()
	-- Level up

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

function on_new_turn()
	-- The White King arrives
	if mode.turns==8 and (white_army[5] or 0)>=1 then
		add_event(ev_side_spawn,5)
	end
end

function on_hero_death() -- Game Over
	-- Clean up gamemode-specific appends and prepends
	prepend("spawn_pieces", nil, "sample_skirmish")
	append("spawn_pieces", nil, "sample_skirmish")
	
	-- Save score if new highscore
	local score=mode.lvl+1
	if mode.lvl>bget(0,1) then bset(0,1,mode.lvl) end
	savbnk()
	
	-- Call gameover
	gameover()
end

-- Weapons & unlocks
function get_weapons_list()
	local a={0}
	for i=2,#weapons do
		if bget(i,4)==1 then add(a,i-1) end
	end
	return a
end

function check_unlocks()
	local function unlock(x)
		if bget(x,4)==0 then
			bset(x,4,1)
			savbnk()
			fx_unlock(weapons[x].name,{icon={x=21,y=282,w=12,h=6}})
		end
	end
	if get_firerange()>=6 then unlock(2) end
	if stack.knockback>=100 then unlock(3) end
	if stack.chamber_max>=4 then unlock(4) end
	if stack.blade and stack.blade>=4 then unlock(5) end
end

-- Interface
function draw_inter()
	-- Draw the tutorial background.
	spritesheet("tutorial")
	sspr(208,0,320,182,0,0)
	spritesheet("gfx")

	-- Write the current level at the top of the screen.
	local s = "Fray: "
	local x = lprint(s,MCW/2,board_y-19,3,1)
	lprint(mode.lvl,x,board_y-19,5)
end

