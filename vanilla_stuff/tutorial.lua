id="tutorial"

-- TUTORIAL DATA
base={
	chamber_max=1, firepower=4, firerange=3, spread=55, ammo_max=6,
	--chamber_max=0, firepower=0, firerange=0, spread=0, ammo_max=0,
	pawn_promote=1, soul_slot=-1, bishop_tempo=-1, rook_tempo=-1, queen_tempo=1, queen_hp=-1, king_hp=-2,
	gain={}
}
local pan_contents = {
	[1] = {
		chess={{piece=2},{text="chess_tuto_1"}},
		ctrl={
			{text="ctrl_tuto_1_1"}, {stick="leftStick"},
			{text="ctrl_tuto_1_2"},	{but="validate"}
		},
	},
	[3] = {
		chess={{piece=3},{text="chess_tuto_3"}},
		ctrl={
			{text="ctrl_tuto_3_1"}, {stick="rightStick"},
			{text="ctrl_tuto_3_2"},	{but="shoot"},
			{line=true},
			{text="ctrl_tuto_3_3"},	{but="reload"}
		}
	},
	[4] = {
		chess={{piece=1},{text="chess_tuto_4"}},
		ctrl={
			{text="ctrl_tuto_4_1"},	{stick="rightStick", stick2="leftStick"},
			{text="ctrl_tuto_4_2"}, {but="pause"}
		}
	},
	[5] = {
		chess={{space=40},{piece=4},{text="chess_tuto_5_1"},{line=true},{piece=0},{text="chess_tuto_5_2"}},
		ctrl={{space=40},
			{text="ctrl_tuto_5_1"},
			{line=true},
			{text="ctrl_tuto_5_2"}, {but="tutoRead"},
			{space=4},
			{text="ctrl_tuto_5_3"}, {but="lstickb"}
		}
	}
}

function populate_events()
	tuto_events = {
		[1] = {
			{ev=ev_spawn_bishop, params={5, 0}},
			{ev=ev_dialogue, params={false, "dialogue_tuto_1_1"}},
			{ev=t1_move_cine},
			{ev=ev_wait, params={20}},
			{ev=ev_spawn, params={2, 7, 1}},
			{ev=ev_wait, params={20}},
			{ev=ev_set_hero_angle, params={0.0}},
			{ev=ev_dialogue, params={true, "dialogue_tuto_1_2"}},
			{ev=ev_set_hero_angle, params={0.5}},
			{ev=ev_dialogue, params={false, "dialogue_tuto_1_3"}},
			{ev=ev_dialogue, params={true, "dialogue_tuto_1_4"}},
			{ev=ev_set_hero_angle, params={0.25}},
			{ev=ev_show_objectives, params={1}},
			{ev=ev_show_tuto_panels},
			{ev=ev_reset_gameplay}
		},
		[2] = {
			{ev=ev_set_hero_angle, params={0.75}},
			{ev=ev_spawn_bishop, params={0,7}},
			{ev=t2_move_cine},
			{ev=ev_dialogue, params={true,"dialogue_tuto_2_1"}},
			{ev=ev_dialogue, params={false,"dialogue_tuto_2_2"}},
			{ev=ev_show_objectives, params={2}},
			{ev=ev_reset_gameplay}
		},
		shotgun_picked_up = {
			{ev=ev_set_hero_angle, params={0.75}},
			{ev=ev_shotgun},
			{ev=ev_reset_gameplay},
			{ev=ev_set_hero_angle, params={0.25}},
			{ev=ev_dialogue, params={true,"dialogue_tuto_2_3"}},
			{ev=ev_dialogue, params={false,"dialogue_tuto_2_4"}},
			{ev=ev_dialogue, params={true,"dialogue_tuto_2_5"}},
			{ev=ev_end}
		},
		[3] = {
			{ev=ev_set_hero_angle, params={0.75}},
			{ev=ev_spawn, params={3,7,1}},
			{ev=ev_dialogue, params={true,"dialogue_tuto_3_1"}},
			{ev=ev_tuto_box, params={100,20,164,"tuto_barrels"}},
			{ev=ev_tuto_box, params={108,29,132,"tuto_ammo"}},

			{ev=ev_show_objectives, params={3}},
			{ev=ev_show_tuto_panels},
			{ev=ev_reset_gameplay}
		},
		rook_hurt = {
			{ev=ev_dialogue, params={true,"dialogue_tuto_3_2"}}
		},
		[4] = {
			{ev=ev_set_hero_angle, params={0.75}},
			{ev=ev_spawn, params={1,1,0}},
			{ev=ev_spawn, params={1,6,0}},
			{ev=ev_dialogue, params={true,"dialogue_tuto_4_1"}},
			{ev=ev_dialogue, params={false,"dialogue_tuto_4_2"}},
			{ev=ev_dialogue, params={true,"dialogue_tuto_4_3"}},
			{ev=ev_show_objectives, params={4}},
			{ev=ev_show_tuto_panels},
			{ev=ev_reset_gameplay}
		},
		[5] = {
			{ev=ev_set_hero_angle, params={0.75}},
			{ev=ev_dialogue, params={true,"dialogue_tuto_5_1"}},
			{ev=ev_dialogue, params={true,"dialogue_tuto_5_2"}},
			{ev=ev_tuto_box, params={126,29,168,"tuto_folly_shields"}},
			
			{ev=ev_show_tuto_panels},
			{ev=ev_reset_gameplay}
		},
		retry = {
			{ev=ev_show_tuto_panels},
			{ev=ev_reset_gameplay}
		}
	}
end
-- END OF DATA

function trigger_events(id)
	if tuto_events[id] then
		for event in all(tuto_events[id]) do
			add_event(event.ev, unpack(event.params or {}))
		end
	end
end

function get_slot_data(team,i)
	if i>0 then return nil end

	local data={
		x=7+team*24+team*(MCW-48-14),
		y=13,
		team=team,
	}

	return data
end

function set_mode_state()
	mode.hide_turn=true
	mode.hurt_dialogue=false

	mode.no_shotgun=mode.lvl<=2
	mode.hide_cards=mode.lvl<=4
	mode.infinite_shield=mode.lvl<=4
	mode.always_show_danger=mode.lvl<=4

	if mode.lvl == 5 then
		add(base.gain, 5)
		add(base.gain, 0)
		add(base.gain, 0)
		add(base.gain, 0)
		base.surrender = true
	end
end

start_from_menu=true
skip_dialogue_5=false
tuto_intro=true
function start()
	if not tuto_events then populate_events() end
	if tuto_intro and not DEV then
		tuto_intro=false
		init_vig({1},start)	
		return
	end
	base.gain={}
	base.surrender=nil
	init_game()
	if mode.start_from_menu then
		mode.lvl=START_LVL or 0
		mode.start_from_menu=false
		--if DEV then mode.lvl=1 end
	else
		mode.lvl=4
		mode.skip_dialogue_5=true
		add_card(new_card("Extra Barrel"))
		add_card(new_card("Homecoming"))

	end
	next_floor()
	
	create_objectives()
	create_tuto_panels()

	local castle=mke()
	add_child(board,castle)
	castle.dp=DP_TOP
	castle.dr=function(e,x,y)
		if mode.lvl ~= 2 then
			spritesheet("tutorial")
			sspr(16,0,192,30,-32,SQ*8)
			spritesheet("gfx")
		end
	end
end

function get_board_size()
	if mode.lvl == 2 then
		return 3,8
	else
		return 8,8
	end
end

function next_floor()
	mode.lvl=mode.lvl+1

	set_mode_state()
	new_level()

	mode.in_cine = true
	if mode.lvl == 2 then
		mk_altar()
		mk_shotgun_pickup()
	end
	if mode.skip_dialogue_5 then
		trigger_events("retry")
	else
		trigger_events(mode.lvl)
	end
end

function on_empty()
	if mode.lvl == 2 then
		return true
	end
	if mode.lvl == 5 then
		bset(0,6,1)
		save()
		init_vig({2,3},bind(init_menu, true))
		return
	end
	
	if #events > 0 then
		return true
	end

	trigger_end()
end
function on_hero_death()
	gameover(mode.start)
end

function select_cards()
	local data={
		id="level_up", 
		pan_xm=1,
		pan_ym=1, 
		pan_width=80,
		pan_height=96/2,
		choices={
			{{team=0},{team=1}},
		},
		force={
			{ id="Extra Barrel",choice_index=0, card_index=0, desc_key="tuto_card_black" },
			{ id="Homecoming",choice_index=0, card_index=1, desc_key="tuto_card_white" }
		}
	}
	mode.block_ui_ctrl=true
	launch_dialogue(true,"dialogue_tuto_powerup",bind(wait, 10, function() mode.block_ui_ctrl=false end))
	level_up(data,next_floor)
end

function trigger_end()
	hide_tuto_panels()
	hide_objectives()
	rm_altar()
	if mode.lvl == 4 then
		end_level(select_cards)
	else
		wait(90,fade_to,-4,20)
		end_level(next_floor, true)
	end
	if ally_bishop then 
		fx_ascend(ally_bishop)
	end
end

function move_ally(nxt) 
	local a=get_range(ally_bishop)

	-- SORT
	local function side(sq)
		if sq.py>4 then return 1 
		elseif sq.py<4 then return -1
		else return 0 end
	end
	local f=function(sq) 
		local sco=sq[ally_bishop.seek]+sq.risk
		if sq.py <= 1 or sq.py >= 6 or sq.px <= 1 or sq.px >= 6 then
			sco = sco + 50
		end
		return sco	
	end
	
	shuffle(a)
	custom_sort(a,f)
	if #a>0 then
		ally_bishop.cd=0
		ally_bishop.ready=false
		ally_bishop.still=nil
		goto_sq(ally_bishop,a[1],TEMPO,nxt)	
		nxt=nil
	end
end

function on_piece_move(e)
	if e == hero then
		if mode.lvl == 1 then
			if e.sq.py == 7 and (e.sq.px == 3 or e.sq.px == 4) then
				trigger_end()
			elseif not mode.in_cine then
				move_ally(nil)
				sfx("jump")
			end
		elseif mode.lvl == 2 then
			if e.sq.py == 3 and shotgun_pickup then
				trigger_events("shotgun_picked_up")
			end
		end
	end
end


function on_bad_hurt(e)
	if mode.lvl == 3 and e.type == 3 and not mode.hurt_dialogue then
		mode.hurt_dialogue=true
		trigger_events("rook_hurt")
	end
end

function get_start_square()
	if mode.lvl == 1 then
		return gsq(4,0)
	elseif mode.lvl == 2 then
		return gsq(1,7)
	else
		return gsq(4,7)
	end
end

function draw_inter()
	spritesheet("tutorial")
	if mode.lvl == 2 then
		sspr(0,32,144,64,board_x-48,board_y-30)
	else
		sspr(208,0,320,182,0,0)
	end

	spritesheet("gfx")
	
	if mode.lvl<4 then
		rov = nil
	end
end

-- Tuto 1: movement
function t1_move_cine()
	local tempo = 30
	move_hero_ang(gsq(4,1), nil, true, tempo)
	wait((tempo+5)*1, move_hero_ang, gsq(4,2), nil, true, tempo)
	wait((tempo+5)*2, move_hero_ang, gsq(4,3), nil, true, tempo)
	wait((tempo+5)*3, goto_sq, ally_bishop, gsq(3,2), tempo)
	wait((tempo+5)*3, sfx, "jump")
	wait((tempo+5)*4, event_nxt)
end

-- Cine shotgun
function t2_move_cine()
	local tempo = 30
	move_hero_ang(gsq(1,6), nil, true, tempo)
	wait((tempo+5)*1, move_hero_ang, gsq(1,5), nil, true, tempo)
	wait((tempo+5)*2, goto_sq, ally_bishop, gsq(2,5), tempo)
	wait((tempo+5)*2, sfx, "jump")
	wait((tempo+5)*3, event_nxt)
end

function mk_altar()
	altar=mke()
	add_child(board,altar)
	altar.y=SQ
	altar.dp=DP_PIECES
	altar.c_deep=60+irnd(60)	
	altar.dr=function(e,x,y)
		if e.c_deep then
			local c=e.c_deep/60
			c=1-ease_out_back(1-c)
			y=y+c*20
			pal_inc(min(0,1-c*5))
		end
		spritesheet("tutorial")
		if mode.no_shotgun then
			sspr(144,32,48,32,x,y)
		else
			sspr(144,64,48,32,x,y)
		end
		spritesheet("gfx")
	end
end

function rm_altar()
	if not altar then return end
	local function f()
		altar.c_deep=1
		altar.rev_c=true
		altar.life=80
		altar=nil
	end
	wait(70,f)
end

function mk_shotgun_pickup()
	shotgun_pickup=mke()
	shotgun_pickup.dp=DP_TOP
	shotgun_pickup.x=board.x+12
	shotgun_pickup.y=board.y+10+16
	shotgun_pickup.child_invis=true
	shotgun_pickup.dr=function(e,x,y)
		if e.anim_pickup then
			if e.t < 170 then
				circfill(x+12,y+4-e.t/17,15*e.t/170,4+cyc(2,8))
				spritesheet("gfx")
				sspr(112,0,24,8,x,y-e.t/17)
			else

				-- RAY
				tcamera(-x,-y)
				e.back=1
				foreach(e.ents or {},dre)
				e.back=nil
				foreach(e.ents or {},dre)
				tcamera(x,y)

				--[[ NO MORE PINKS = NEW FX

				local nb=8
				local da=1/nb/4
				for i=1,nb do
					local an=i/nb
					local spin=e.t/200
					spin=spin+(e.t*i)/2813.675
					
					if i%2==1 then spin=spin*-1 end
					
					--
					local	ax=x+cos(an+da+spin)*MCW
					local	ay=y+sin(an+da+spin)*MCW
					local	bx=x+cos(an-da+spin)*MCW
					local	by=y+sin(an-da+spin)*MCW
					local cl=i%4+4					
					trifill(x+12,y+offy,ax+12,ay+offy,bx+12,by+offy,cl)
				end
				--]]
				
				for i=0,1 do
					if i==0 then fillp_dissolve(.5) end
					circfill(x+12,y-6,20+(1-i)*8-cos(e.t/60)*5,5)
					fillp()
				end
				
				spritesheet("gfx")
				sspr(112,0,24,8,x,y-10)
				
				
				
			end
		else
			spritesheet("gfx")
			sspr(112,0,24,8,x,y+round(cos(t/150)))
		end
	end
end

function ev_shotgun()
	shotgun_pickup.anim_pickup = true
	shotgun_pickup.t = 0
	music("level_up_A")
	shotgun_pickup.upd=function(e)
		
		if e.t%8==0 and e.t>170 then
			local ray=mke(0,12,-6)
			add_child(e,ray)
			ray.a=rnd(1)
			ray.va=0.005
			ray.life=60+irnd(60)
			ray.cl=4+irnd(2)
			ray.upd=function(e)
				e.a=e.a+e.va
			end
			ray.dr=function(e,x,y)		
			
				local c=1
				if e.t<30 then c=e.t/30 end
				if e.life<30 then c=e.life/30 end
			
				local ex=x+cos(e.a)*MCW
				local ey=y+sin(e.a)*MCW


				local ra=.02*c		
				local cl=ray.cl
				if e.par.back then
					cl=5
					ra=ra*2
					fillp_dissolve(.5)
				end
				
				local ax=x+cos(e.a-ra)*MCW
				local ay=y+sin(e.a-ra)*MCW
				local bx=x+cos(e.a+ra)*MCW
				local by=y+sin(e.a+ra)*MCW
				trifill(ax,ay,bx,by,x,y,cl)
				fillp_dissolve()
				
			end
			--del(ents,ray)
			--add(e,ray)
		
		end
		for ray in all(e) do upe(ray)	end
		
		if btnp("validate") and shotgun_pickup.t > 170 then

			mode.no_shotgun=false
			sfx("level_up_sel")
			music("codex")
			kl(shotgun_pickup)
			shotgun_pickup=nil
			event_nxt()
		end
	end
end

-- Basic events
function ev_end()
	trigger_end()
	--event_nxt()
end

function ev_reset_gameplay()
	remove_buts() -- needed or tuto crash when player click
	mode.in_cine = false
	hero.force_ang=nil
	reset_mode()
	reset_move_cursor()
	if not mode.no_shotgun then refill_ammo(event_nxt)
	else event_nxt() end
end

function ev_wait(tmp)
	wait(tmp, event_nxt)
end

function ev_spawn(type,x,y)
	local p=new_piece(type,true,gsq(x,y))
	
	piece_transition(p,TEMPO)
	wait(TEMPO, event_nxt)
end
function ev_spawn_bishop(x,y)
	ally_bishop=new_piece(2,false,gsq(x,y))
	
	piece_transition(ally_bishop,TEMPO)
	wait(TEMPO, event_nxt)
end

function move_hero_ang(tsq,f,skip_reload,tempo)
	local x = tsq.x - hero.sq.x
	local y = tsq.y - hero.sq.y
	hero.force_ang=atan2(x,y)
	move_hero(tsq,f,skip_reload,tempo)
end

function ev_set_hero_angle(ang)
	hero.force_ang=ang
	event_nxt()
end

function piece_transition(p, tempo)
	local fdi=0
	for di=0,3 do
		if dsq(p.sq,di)==nil then 
			fdi=di
		end
	end
	local dx=DIR[fdi*2+1]*16
	local dy=DIR[fdi*2+2]*16
	
	p.x=p.x+dx
	p.y=p.y+dy
	p.c_fade_in=tempo
	mv(p,-dx,-dy,tempo)
end

function ev_tuto_box(x,y,w,str_key)
	local box=mke()
	if str_key == "tuto_barrels" then mode.highlight_barrels=true
	elseif str_key == "tuto_ammo" then mode.highlight_ammo=true
	elseif str_key == "tuto_folly_shields" then mode.highlight_shields=true end
	
	box.dr=function(e,x,y)
		local txt = get_lang(str_key, MOUSE and "space" or RELOAD_BUTTON)
		n = find(txt, "\n")

		local hTxt=-5000
		hTxt=pprint(sub(txt, n), x+3, hTxt+3, w-8-11, 3)+2
		hTxt=hTxt+5000

		rectfill(x,y,x+w-1,y+hTxt-1,1)
		rect(x,y,x+w-1,y+hTxt-1,3)
		line(x-1,y+1,x-1,y+hTxt,2)
		line(x-1,y+hTxt,x+w,y+hTxt,2)
		hdclear(x,y,x+w-1,y+hTxt-1)

		lprint(sub(txt, 0, n), x+3, y+3, 4)
		pprint(sub(txt, n), x+3, y+3, w-8-11, 3)
		
		draw_button("validate", x+w-11, y+hTxt-12)
	end
	box.dp=DP_TOP
	box.x,box.y=x,y

	box.upd=function()
		if btnp("validate") and box.t > 10 then
			mode.highlight_barrels=nil
			mode.highlight_ammo=nil
			mode.highlight_shields=nil
			kl(box)
			event_nxt()
		end
	end
end


-- TUTO PANEL
ctrl_panel=nil
chess_panel=nil
function create_tuto_panels()
	ctrl_panel=mke()
	ctrl_panel.dp=DP_INTER
	ctrl_panel.ctrl_info=true
	ctrl_panel.dr=dr_tuto_panel
	ctrl_panel.x=(3*MCW+8*SQ)/4+100

	chess_panel=mke()
	chess_panel.dp=DP_INTER
	chess_panel.ctrl_info=false
	chess_panel.dr=dr_tuto_panel
	chess_panel.x=(MCW-8*SQ)/4-100	
end

function hide_tuto_panels()
	mv(chess_panel,-100,0,30)
	mv(ctrl_panel,100,0,30)
end

function ev_show_tuto_panels()
	chess_panel.x=(MCW-8*SQ)/4-100
	if not mode.no_shotgun then chess_panel.x = chess_panel.x-12 end
	mv(chess_panel,100,0,30)

	ctrl_panel.x=(3*MCW+8*SQ)/4+100
	mv(ctrl_panel,-100,0,30)

	wait(30,event_nxt)
end

function dr_tuto_panel(e,x,y)
	local h=content_tuto_panel(e, x, -5000)+5000
	content_tuto_panel(e, x, (MCH-h)/2+4)
end

function content_tuto_panel(e, x, pY)
	if info and not e.ctrl_info then return pY end

	local pan_content = pan_contents[mode.lvl]
	if pan_content then
		local lines = pan_content.chess
		if e.ctrl_info then lines = pan_content.ctrl end
		local width=65
		if e.ctrl_info then width=70 end

		for content in all(lines) do
			if content.space then
				pY=pY+content.space
			elseif content.text then
				pY = pprint(get_lang(content.text), x, pY, width, 3, 1)
			elseif content.piece then
				pY=pY+2
				spr(16+content.piece,x-20,pY)
				rectfill(x,pY-4,x+24,pY+20,1)
				dr_movemap(PIECES[content.piece+1],x,pY-4)
				pY=pY+20
			elseif content.line then
				line(x-20,pY,x+20,pY,2)
				pY=pY+2
			elseif content.but and (content.but == "tutoRead" or MOUSE and content.but == "info") then
				if MOUSE then
					pY = pY + draw_stick("cursor", x-6, pY, true)
				else
					local hw = (butInfo["info"].w + 7 + butInfo["leftPage"].w * 2 + 5)/2
					local h = max(butInfo["info"].h, max(butInfo["leftPage"].h, 7))
					draw_button("info", x - hw, pY + ceil((h - butInfo["info"].h) / 2), true, flr(time()%4)==0)
					spritesheet(console_sheet)
					sspr( 0,48,7,7, butInfo["info"].w + x - hw, pY)
					draw_button("leftPage", butInfo["info"].w + 7 + x - hw, pY, true, flr(time()%4)==2)
					spritesheet(console_sheet)
					sspr( 0,55,5,7, butInfo["info"].w + 7 + butInfo["leftPage"].w + x - hw, pY)
					draw_button("rightPage",	butInfo["info"].w + 7 + butInfo["leftPage"].w + 5 	+ x - hw, pY, true, flr(time()%4)==2)
					pY = pY + max(butInfo["info"].h, max(butInfo["leftPage"].h, 7))
				end
			elseif content.but then
				if MOUSE then
					local replace = {
						validate = "validate",
						shoot = "validate",
						reload = "spacebar",
						pause = "escape",
						lstickb = "lstickb"
					}
					local but = replace[content.but]
					pY = pY + draw_button(but, x-2-flr(butInfo[but].w/2.0), pY, true)
				else
					pY = pY + draw_button(content.but, x-2-flr(butInfo[content.but].w/2.0), pY, true)
				end
			elseif content.stick then
				if MOUSE then
					pY = pY + draw_stick("cursor", x-4, pY+1, true)
				else
					if content.stick2 then
						local fnt = font()
						font("pico")
						print("û", x-4, pY+2, 3)
						font(fnt)
						draw_stick(content.stick, x-7-12, pY, true)
						pY = pY + draw_stick(content.stick2, x-7+12, pY, true)
					else
						pY = pY + draw_stick(content.stick, x-7, pY, true)
					end
				end
			end
			pY = pY + 2
		end
		pY = pY - 2
	end
	return pY
end

-- OBJECTIVES PANEL
function create_objectives() 
	objectives=mke()
	objectives.dp=DP_INTER
	objectives.dr=dr_objectives
	objectives.x,objectives.y=5,5-50
end

function dr_objectives(e,x,y)
	if not e.obj then return end
	lprint(get_lang("objectives_tuto"), x, y, 4)
	pprint(get_lang("objective_tuto_"..e.obj), x, y+6, 85, 3)
end

function hide_objectives()
	if not objectives then return end
	mv(objectives,0,-50,30)
end

function ev_show_objectives(num)
	objectives.obj=num
	objectives.x=5
	objectives.y=5-50
	mv(objectives,0,50,30)
	wait(30,event_nxt)
end

-- DIALOGUE BOX
FRAME_DIA_BISHOP={0,3,4,0,3,5,3,4}
FRAME_DIA_KING={0,3,4,0,3,0,4}
FRAME_BLINK={0,1,2,2,1,0}
function dr_dialogue(e,x,y)
	local w,h=192,47
	rectfill(x,y,x+w-1,y+h-1,1)
	rect(x,y,x+w-1,y+h-1,3)
	line(x-1,y+1,x-1,y+h,2)
	line(x-1,y+h,x+w,y+h,2)
	hdclear(x,y,x+w-1,y+h-1)

	if e.is_king then
		spritesheet("tutorial")
		sspr(0,140,45,42,x+w-45-2,y+3)

		local f=0
		local tAnim=round(e.t/6)
		if e.typing then
			f=FRAME_DIA_KING[tAnim%#FRAME_DIA_KING+1]
		else
			f=FRAME_BLINK[mid(1,tAnim%50,#FRAME_BLINK)]
		end
		sspr(48+f*24,141,24,39,x+w-45-2+14,y+4)

		pprint(get_lang("black_king"), x+3, y+3, 192, 4)
		pprint(e.txt, x+3, y+3+6, w-49, 3, 0, e.ttypewriter)

		draw_button("validate", 244-45, 160)
	else
		spritesheet("tutorial")
		sspr(0,96,45,42,x+2,y+3)

		local f=0
		local tAnim=round(e.t/6)
		if e.typing then
			f=FRAME_DIA_BISHOP[tAnim%#FRAME_DIA_BISHOP+1]
		else
			f=FRAME_BLINK[mid(1,tAnim%50,#FRAME_BLINK)]
		end
		sspr(48+f*24,97,24,39,x+14,y+4)

		pprint(get_lang("black_bishop"), x+2+45+2, y+3, 192, 4)
		pprint(e.txt, x+2+45+2, y+3+6, w-49, 3, 0, e.ttypewriter)

		draw_button("validate", 244, 160)
	end

end

function launch_dialogue(is_king, key, on_close)
	local dia=mke()
	dia.dr=dr_dialogue
	dia.dp=DP_TOP
	dia.is_king=is_king
	dia.txt=get_lang(key)
	dia.x,dia.y=64,124
	dia.ttypewriter=0
	dia.typing=true
	local fast=false
	local len = safesize(dia.txt)

	dia.upd=function()
		dia.ttypewriter=dia.ttypewriter+(fast and 5 or .5)
		if dia.ttypewriter>len then fast=true dia.typing=false end		

		
		if dia.typing then
			if dia.t%(fast and 3 or 6)==0 then
				_sfx("tic",3,.2,0,.5+hrnd(.02))
			end
			if btnp("validate") and dia.t > 10 then
				fast=true
			end
		else
			if btnp("validate") then
				kl(dia)
				if on_close then on_close() end
			end
		end
	end
end
function ev_dialogue(is_king, key)
	launch_dialogue(is_king, key, event_nxt)
end
