
## Intro

Hi punks!

So you want to mod Shotgun King huh? Have sick ideas for some new cards, new ways to play the game, or you want to make a graphical mod, maybe even just change a few sprites, or simply propose a new translation for the game? Well all these things are possible and I'm about to teach you how!

Prior coding knowledge is not necessarily needed, though it will help if you have some. If you don't then you may well get away with copy-pasting things and changing the right values, or this can in fact be a good opportunity to learn some basic coding. In any case this guide should help.

This is going to be quite extensive and you may not be interested in everything that'll be in here. Please feel free to skip parts or home-in to whatever seems relevant to what you're trying to achieve with your mod.

In fact, reading this guide is not mandatory at all, and you may simply download the sample mod, modify it and figure things out for yourself. In any case the sample mod is there to be used as a working reference, even if you do read this whole thing.

But let's get to it.


## General Notes on Modding, SUGAR and Lua

Shotgun King was made with SUGAR, that's the name of our game engine which we made ourselves. In SUGAR we use the scripting language Lua to make the games, and that's what you'll be using too.

Lua is pretty great here because it's quite accessible. The language's syntax is fairly easy to read, it uses only a few keywords and core concepts, but it's also very flexible so you can do pretty much anything with it.

SUGAR doesn't exactly use the full Lua language and especially not its standard libraries, but rather a dumbed-down version of it, much like the Fantasy console Pico-8. In fact, if you are completely new to Lua, I suggest taking a loot at Pico-8's Lua Syntax Primer until the part about Pico-8 shorthands, which do not exist in Sugar. https://www.lexaloffle.com/dl/docs/pico-8_manual.html#Lua_Syntax_Primer

If you want to go one step further in learning Lua, you may also read the start of the official Lua manual, which really isn't awfully long. Just read until you reach 2.7 and no further, (unless you want to) the rest won't be useful here. https://www.lua.org/manual/5.1/manual.html

One thing to keep in mind if you've never worked with code before: code is executed in a linear way. Instructions, variable assignations and function calls will be executed one at a time, in the order the program reads them. It is a common pitfall to assume a piece of code executes before another when in fact it does not, creating unwanted results. If you (or the game) call function a and then function b. The content of function a will be executed and only when it's done will function b begin to execute.

In case of errors usually the game will crash and generate a crashlog, at the end of which you'll find an error message. In your mod you can use the `_log("hello")` function to write things in the log files, which can help with debugging.

SUGAR's API, that's what we call the entire set of functions available in the engine, is fully documented in a manual which you can look at here. We don't necessarily recommend you read it entirely, but rather you can look for certain functions in it by searching for keywords like "input" or "audio", or by looking for specific functions.

Most of the SUGAR functions are available for modding Shotgun King, but not all. Some, like the bank functions, used for saving stuff, are a little modified and we'll cover them in a further section called "Saving". Some others are strictly forbidden, so as not to let you temper too much with the game's basic functionalities. Others still, functions that would load or modify a file, are made to only be able to use files inside your mod folder, out of concern for security.

Finally, on top of the functions provided by SUGAR come the game's own functions and variables, which are woefully undocumented and quite like a jungle you will have to navigate by feel. We do provide you with a function called `gimme()` which will return tables listing variable and function names. For example, `gimme("global")` will return a list of global names currently available in the game, some of which will be the names of functions you can use in your mod. You may also use `gimme("forbidden")`, `gimme("replaceable")` and `gimme("autocall")`, each returning a list of function and variable names relevant to that parameter.

This last paragraph is getting quite advanced though. For most basic stuff you'll be fine using what you can find in the sample files we supply here in this github repo.


## info.lua

This file is required for your mod to appear in-game. It should be right in your mod's folder and contain something like this:

```lua
name="mod_folder_name"

title="My Sick-Ass Mod"
by="your_username"

description=[[
Hi punks,
This is my sick-ass mod that does sick-ass stuff.
Thanks for checking it out, love you!
]]

cover="cover_file_in_mod_folder.png"

default_lang="optional_forced_language"
priority_hint=0

mode_description = {
	["my_game_mode"] = "Sick-Ass|Check this out it's my game mode that I made myself!"
}
mode_record = {
	["my_game_mode"] = { name="best score: ", bx=0, by=0 }
}
```

Most everything here is self-explanatory I think.

The cover file has to exist in your mod folder if you want to upload your mod to the Steam Workshop, more on that at the end of this guide. The cover should be a png picture with a dimension respecting the 16:9 ratio. (1920 x 1080 for example)

The `default_lang` line is optional. It's mostly useful for translation mods with no gameplay modification. It forces the game to use the mentioned language file, which should be contained in your mod. (see the next section about Language) If you're not interested in this, you should remove the line entirely.

`priority_hint` is used to automatically place your mod in the player's load order the first time it is detected. A higher number means your mod will be higher in the list, and so load earlier than other mods. It can also be negative. This setting can be important for mod compatibility, but if you don't know what to set it to you should leave it at 0.

`mode_description` stores descriptions for your custom game modes. (See the section about Game Modes) These descriptions will appear in the in-game gamemode menu when selectiong your mod's gamemods. The `|` character is used as a line separator, which lets you do multi-line descriptions. The first line will be drawn with a brighter color, so you can use it to write the gamemode's name. If you have no custom game mode you can remove this entirely.

`mode_record` stores information the game may use to retrieve highscores for custom gamemodes. This too is used in the gamemode menu. For each gamemode, `name` is what to write before the score, and `bx` and `by` are coordinates in your mod's save bank where the game can find the score to display. (More on save banks in the Saving section) Like for `mode_description` if you have no custom game mode you can remove this entirely.

Again, this file needs to exist and be filled out for your mod to be detected by the game, and then for it to be uploaded to the Steam workshop.


## Language

The game uses a system of keys to repertoriate the text to be used for any language. You may find these keys in the language files stored in the `lang` folder.

Translation mods may copy the `english.txt` file into their mod's own `lang` folder, rename the file to the language they'll be translating to, and translate key text corresponding to each key in the file directly. Only change the text to the right of '##' on each line. Instances of "$1" or similar mean that some other text or number will be inserted there.

Additionally some words support specific plural forms, particularly the piece names. In some languages the plural form of a word is not so simple as adding an 's' at the end of it. So you may use this syntax:
Example:s:Examples
Example:3:Examplesss -- will only be used to write "3 Examplesss"

Note that in this syntax the first string should already be translated, so for example in Spanish we have:
Peón:s:Peones

The game will automatically detect files in your mod's lang folder and add them to the language options in the game's settings. If your info.lua file has a `default_lang` key, it will force the game to load that language. If your mod has nothing else than one or multiple translations and it's info.lua file and cover image, then the mod is considered to be a translation mod and will not disable achievements when active.

Alternatively, the language keys can be manipulated in code. In your script.lua file (see the next section) you can directly modify the `lang` table which holds all the text keys. For example you can say `lang["play"] = "Let's go!!"` and it will change what's displayed on the game's main menu for the play button.


## script.lua

Apart from custom translations and custom game modes, script.lua is the main code file of your mod. This is where you may add cards, pieces, (more on these things later) but also inject code into the game. If your mod is enabled and a script.lua file exists, that file will be run when the game launches.

This is where it gets a little more technical. If you are new to coding and can't grasp all the information here, don't worry it's fine, I promise.

When your script.lua is run, it is run in a secured environment specific to your mod. Any other file required in your script.lua will also be run in that environment. Every mod's environment is stored in MODS[modname].env. The environment only lets you access functions and variables from the global envrionement that we consider safe to use. Most notably, it restricts file reading and writing to your mod's folder, and allows saving to a file specific to your mod, specially created by the game in the save folder.


## Loading new assets and replacing vanilla ones

For loading and using assets you should refer to the SUGAR manual. Essentially you'll be using newsrf(file, key), newsfx(file, key) and newmus(file, key) for loading spritesheets from png files, sound effects from wav files, and musics from mp3 files respectively.

In the game's code, every asset (spritesheet, sound effect or music) is stored with a specific key. Replacing any of these assets in the game is as easy as loading a new asset with one of these specific keys in your mod.

For the spritesheets, the game uses "cards", "title", "intro", "weapons", "codex", and "tutorial". You can find the corresponding png files in the Vanilla Assets folder in the github repo. For each of these files you can modify the sprites and load up the spritesheet again in your mod's code to see the changes in-game.

For sound effects there's quite a few more keys, and some of them are somewhat cryptic. We won't provide the assets there but you can listen to them by calling `sfx(key)` in your mod's code. Here's the list of keys:
"alleluia", "ammo", "ascend", "backup_call", "backup_land", "bishop_resist", "black_mist", "blade", "book_float", "boost", "boss_crumble", "boss_jump", "boss_land", "cancel", "card_land", "castle", "catch", "codex_cycle_item", "codex_sel", "codex_unsel", "conscription", "crystal_xpl", "decay_jingle", "detected", "disrupt", "eat", "execute_disruption", "extra_turn", "flash_boss", "flip_back", "grab_cancel", "grab_done", "grenade_beep", "grenade_bounce", "grenade_fall", "grenade_xpl", "gust", "healing", "hero_leave", "hero_light", "hero_spawn", "hero_spawn_boom", "hurt", "hurt_boss", "hypnosys", "hypno_execute", "incantation", "jester", "jump", "land", "legacy", "level_up_sel", "level_up_zoom", "lift", "lost_king", "menu_in", "menu_out", "missile", "mission", "next_vig", "next_vig_2", "pause", "penta", "penta_full", "penta_reset", "plague", "promote", "raise", "rat", "reap_soul", "refill_wand", "reload", "retire", "scope", "sel_disruption", "sel_opt", "shell_ground", "shell_land", "shell_spark", "shield", "shoot", "shoot_0", "shoot_1", "shoot_2", "shoot_3", "shoot_4", "show_book", "soul", "spawn", "spawn_final", "splash", "start", "start_detune", "tear_up", "throw", "throw_impact", "tic", "tile_move", "tile_out", "trg_in", "trg_out", "turn_card", "twinkle", "unsoul", "unused_xpl", "use_card", "wand", "water_poison", "wrong", "wrong_shield", "xpl"

Musics often come in two parts, an A part that plays once, and then a B part that loops indefinitely after the A part. Here's the list of keys: 
"boss_A", "boss_B", "chase", "codex", "ending_A", "ending_B", "endless", "fireplace", "gameover", "gameover_w_fx", "ingame", "level_up_A", "level_up_B", "title_A", "title_B"

Of course you can also load assets with totally different keys and in fact that is encouraged for mod compatibility, because if two mods use the same key for an asset they're loading, then the last one loaded will override the other. But in this case you will have to use the assets yourself, with your own custom code, with the exception of custom card sprites, speaking of which...


## Custom Cards

Adding new cards is a relatively simple way of adding content to the game. The game uses a system of keywords and values to easily define a card's effect on various stats the game will automatically use.

For example I may add a card like this:

```lua
add(CARDS, {
	gid=0, spsheet="samplemod_cards",
	team=0, n=1, pwe=1,
	id="Voodoo Doll",
	king_hp=-1, king_tempo=1
})
```

This card, when picked, will remove one max hp on the white king piece, and slow it down so it will take one more turn before each move.

Let's break down the elements in this little piece of code.

First of all, we're adding all this to CARDS, this is a global table the game uses to store all the cards in the game. Next, what we're adding is a new table containing the card's information, hence the use of { and }.

Inside our little table, we have a gid, which stands for 'grid index', this is the place of the card in its spritesheet when considering 10 cards per row, starting at 0. So if this card used the first card on the second row of the spritesheet, gid would be 10. Here it's 0, so the card will use the very first card sprite in its spritesheet.

Next is spsheet, and that's the card's spritesheet! Here I set it to "samplemod_cards", but you should set it to a spritesheet that's specific to your mod and that you loaded before all this. For example here I would have had to call `newsrf("newcards.png", "samplemod_cards")` for my card to work properly. You can also not specify a spritesheet for your card by omitting spsheet="something" entirely and then the card will use sprites from the vanilla cards instead.

`team` is 0 for a black card and 1 for a white card. `n` is the maximum number of copies of this card you can get in a run. `pwe` stands for 'probability weight' and impacts how likely your card is to appear in-game as a random choice. `pwe` is optional and defaults to 1.

`id` is the name of the card as it will appear in the game.

`king_hp` specifies a modification to the max hp of king pieces. `king_tempo` specifies a modification to the number of turns between king moves. In both cases the syntax is modular, meaning we could also have `knight_hp=-2` to remove 2 hp from knight pieces, or `bishop_bodyguard=1` to apply the Bodyguard effect to bishops, making the white king invincible until you've beaten all bishops. In all these cases, the game will look for a piece name before that first '_', then look for a stat to modify after that '_', and it will apply the effect value to that stat on that piece. You can do this with custom pieces as well, and you can absolutely do this for new made-up stats to use with custom code in your mod.

Some other non-modular effects include `spread=10` or `ammo_max=5` which modify the shotgun's spread and max ammo by the given value.

The `gain` and `sac` effects will let you add and remove pieces from the white army. For example `gain={0,0,0,0}, sac=1` will add 4 pawns (piece 0) and remove a knight (piece 1). For both effects you can use either a table to mention multiple pieces, or just the piece type to remove only one piece.

The list of possible effects is quite long and so I invite you to go fishing in the definitions of the vanilla cards graciously provided in this github repo.

Note that effects which use piece's name will also work for custom pieces. Which is a perfect transition for the next section!


## Custom Pieces

Adding custom cards is good fun and all, but maybe you're a sicko who thinks chess just doesn't have enough pieces. Weird but okay, we got you covered. Be warned that this is more advanced stuff than custom cards, feel free to skip ahead to the next section if your head starts hurting.

For maximum customisabilty custom pieces use callbacks. That's what we call functions stored and passed around as variables. When defining your custom piece, you'll be able to specify a function the game will use to know where the piece can move, another it will use to draw the piece, etc.

Let's take a look at the custom piece added in the sample mod, and take it step by step.

```lua
local ranger_typ = #PIECES
lang["piece_"..ranger_typ] = "Ranger"
lang["short_piece_"..ranger_typ] = "Ranger"

add(PIECES, {type=ranger_typ,
	name="ranger", hp=4, tempo=3, give_soul=true, danger=6, seek="wdist",
```

Much like the cards, the chess pieces of the game are stored in a global table called PIECES. This is where we'll be adding our custom piece. However, each piece must have a unique id, this is why we are getting the size of the PIECES table to use as type id for our new piece. You can also use a totally different number, like 23634 for example, but if another mod uses the exact same type number for a custom piece, then a conflict will arise and only one of the two pieces will be used in the game. This id is what we'll be using for adding or removing this piece in the white army with cards and game modes.

After getting our piece type, we use it specify the piece's name in the lang table. The "piece_" key is used in card and game mode descriptions, while the "short_piece_" key is used in the left panel where you can see a piece's stats when hovering it. This name has to be 6 characters long maximum so that it can fit in that panel.

Then we actually start adding the piece to the PIECES table. We make sure to mention both the `type` number we'll be using for this piece, and the `name` of the piece which will be used for card effects. (example here: `ranger_hp=1` to add 1 max hp to our custom piece)

`hp` and `tempo` are the piece's basic stats. `give_soul` defines whether this piece should give you its soul when it dies. `danger` is a value that you may use in game modes. For example it's used in the vanilla Chase mode to decide which piece to spawn next depending on the wanted level of difficulty. `seek` defines the way of calculating ideal moves. Typically you'll be wanting to use "wdist", which simply makes your piece go as close as possible to the black king until it can attack it.

```lua
	custom_range = function(e,max_range,flying,add_sq)
		local max = min(max_range or 2, 2)
		local x,y = e.sq.px, e.sq.py
		
		for yy=-max,max do
			for xx=-max,max do
				if (xx==max or y==max) and abs(xx)+abs(yy)<=3 then
					add_sq(gsq(x+xx, y+yy))
				end
			end
		end
	end,
	
	custom_atk = function(e,max_range,flying,add_sq)
		local max = min(max_range or 1, 1)
		local x,y = e.sq.px, e.sq.py
		
		for yy=-max,max do
			for xx=-max,max do
				if (xx~=0 or yy~=0) then
					add_sq(gsq(x+xx, y+yy))
				end
			end
		end
	end,
```

These functions are called by the game to get where the piece should be able to move and attack respectively. `custom_range` is also used for soul movement in case this piece has `give_soul=true`.

For both functions, the game passes a `add_sq` ("add square") function which you need to call to add movement options for the piece. However you can't just use board coordinates, the game has a small table for each tile of the checkboard, and that's what you want. Fortunately you can get these tables by calling `gsq(x,y)` with the right coordinates. The `add_sq` function will automatically detect whether a tile has already something on it or if it's a moat tile, and it will return false if your piece shouldn't be allowed to go further than that tile, or true if it's all clear. (this isn't used in our example here, meaning our piece can jump over other pieces or moats, like the knight piece)

If you don't want your piece's attack pattern to be different from its movement pattern then you only need to define `custom_range` and remove `custom_atk`, in which case `custom_range` will be used for both cases.

```lua
	custom_dr = function(e,x,y,angle)
		spritesheet("samplemod_pieces")
		if angle then
			aspr(e.iron and 1 or 0, x, y, angle)
		else
			spr(e.iron and 1 or 0, x, y)
		end
	end,
	
	custom_debris = function(p,x,y)
		spritesheet("samplemod_pieces")
		sspr(24,16,8,8,x-4,y-4)
	end,
	
	custom_move_dr = function(x,y)
		spritesheet("samplemod_pieces")
		spr(16, x, y, 1.5, 1.5)
	end
})
```

These are the last elements of our custom piece and they're all drawing functions. The functions `spritesheet`, `spr`, `aspr` and `sspr` are all described in the Sugar manual and I suggest you take a look for yourself there.

`custom_dr` simply draws our piece. It is used to draw our piece on the board, on the piece's stats panel, and on soul cards. The `angle` parameter is usually nil, unless the piece is being held or thrown with King's Shoulders, in which case you may use it to rotate your piece's sprite.

`custom_debris` is an optional function which will draw one piece of debris specific to your custom piece, like there is for each of the vanilla pieces. If not set, then that piece of debris will be drawn with a generic sprite instead.

`custom_move_dr` is used to draw your piece's movement pattern in the stats panel.

And that's it! Once your piece is defined, you can add it to the game by using `gain=ranger_typ` in a custom card for example and you can affect its stats with something like `ranger_hp=-2`. Or you can use it in a custom game mode!


## Game Modes

Custom game modes can be created by having a `modes` folder in your mod folder. Any lua file in there will be considered by the game to be a new game mode. Selecting one of these game modes in-game will load its lua file and act accordingly to its content.

You may refer to the sample mod's skirmish.lua game mode file, or to any of the vanilla game modes provided in this Github repo.

Your mode's lua file is loaded in a new environment separate from the mod environment we talked about earlier, but the idea is the same, this environment is securized so you won't be able to use some functions in destructive ways. In this case the environment is stored in a global variable simply called `mode`.

After loading the mode's file, the game will call its `initialize()` function if it exists. This is a good place to load any spritesheet you might need or load progress. (see the next section about saving)

At this point, if you defined `weapons` table and/or a `ranks` table, the game will move on to a menu allowing the player to select a weapon and rank, and call `get_weapons_list()` and `get_max_rank()` from your mode's code. `get_weapons_list()` should return a table with indexes for the shotguns that are unlocked for your game mode. `get_max_rank()` Should return the maximum rank unlocked. Once the player hits "play", or if `weapons` and `ranks` weren't defined at all, then we move on to the actual gameplay.

`start()` is called to initialize the run and start things going. Your game mode should contain a table called `base` which defines the starting conditions of the game. For example in the sample mod skirmish mode we have this:

```lua
base={
	-- promotion=1, -- Pawn promotion disabled for this game mode
	surrender=1,
	gain={0,0,0,0,1,2,3,5},
	militia=1
}
```

The `surrender` setting will destroy all the other white pieces when the white king dies. `gain` gives the initial army composition using a number for each piece type. (here we have 4 pawns (type 0), 1 knight (type 1), 1 bishop (type 2), one rook (type 3) and one king (type 5). For this mode `militia` is on, meaning pawns can move in any direction. Note that the effects and syntax is the same as for cards, and indeed you may use any card effects to define your game mode's starting situation.

During gameplay a couple of other functions are called automatically. Notably, when no more white pieces are present on the board the game calls `on_empty()`, which is usually a good place to trigger a level up. Note that failing to do anything in that function will softlock the game.

`on_new_turn()` is called before each turn, and `on_hero_death()` is called when the black king dies. A couple of other such `on_` functions are automatically called and you can get the list with `gimme("autocall")`. Note that these functions are only called if they're defined in your game mode's code, they won't work if they are defined in your mod's script.lua.

`check_unlocks()` is also called every turn to allow you to save new shotgun unlocks or whatever else you want. (more on saving in just a minute)

You may call `gameover()` to end the game mode and trigger the "retry" menu.

It's quite difficult to cover everything you can do with game modes because the system was designed to be open-ended so you may be able to do whatever you want. I would strongly suggest starting with the sample mod's skirmish file or with any of the vanilla game modes and go from there, editing as you go.


## Saving

We provide a couple of functions to easily and safely save progress for your mod. Note that all your mod's game modes will share the same save and it's up to you to manage where you save what.

Your mod's save is called a "bank", it's a grid of values which you must create like this: `newbnk(128,64,4)` This creates a 128x64 grid of 4-bytes unsigned values, meaning each cell can contain any positive integer value from 0 to 4,294,967,295. If a save file exists for your mod, then its content will automatically loaded into your newly created bank.

Once your bank is created you may save values inside it using `bset(x,y,v)`. Then you may retrieve these values with `bget(x,y)`. But remember that you can only ever store positive non-decimal numbers.

Once you're done writing values in your bank you need to call `savbnk` to actually save to file. Doing this may slow down the game a little bit, so it is advised to avoid doing it too often. A few times during a same run is fine, doing it just when a run ends is ideal.

In the vanilla game, this system is used to save game mode ranks and shotgun unlocks, but also codex stats, achievement unlocks, and even the settings.

For custom game modes, you may let the game know where to find highscores in your bank to display on the game mode menu. Just use this in your info.lua file and set bx and by to where the highscore should be retrieved for each mode:

```lua
mode_record = {
	["my_game_mode"] = { name="best score: ", bx=0, by=0 }
}
```

This is totally optional though, as is saving anything for your game. It's just there if you want to use it. :)


## Append & Prepend

This is another tool which is entirely optional but may prove very useful.

Mods get two functions which allow you to automatically call a function before or after every time one of the game's functions is called.

`append(game_function_name, your_function, id)` and `prepend([same thing])` let you do this in a cummulative way, meaning multiple functions can be appended to a same base-game function by using a system of ids. The id will let you remove your appended function when it is no longer needed, by doing `append(game_function_name, nil, id)`. (or the same thing with `prepend()`)

Appended and prepended functions will receive whatever arguments the base-game function receives, however they cannot intercept what the function returns directly.

You may append any base-game function, and you can list all options by using `gimme("global")`. (caution though, this will also return names of global variables which are not functions and cannot be appended or prepended)

Here's a very simple example of a prepend:

```lua
function rekt(e)
	_log("Rekt "..e.name.."!")
end

prepend("xpl", rekt, "rekt_msg")
```

This will print "Rekt pawn!" or "Rekt knight!" etc every time a piece explodes.


## Uploading to the Steam Workshop

Finally, once you consider your mod done, or at least in a playable state, you may want to upload it to the Steam Workshop.

Please make sure to review the "info.lua" section and check that you have correctly set your mod's title, description and cover. Your mod must have a cover picture to be uploaded to the workshop. It should have a 16:9 aspect ratio and be either a png or jpg file.

Once everything seems good, you can run the game and go into the mod menu. There you must type "UPLOAD" on your keyboard. If you type it correctly, some extra buttons will appear at the right of the mod list. Hit the button next to your mod and the game will attempt to upload it to the Steam Workshop.

If the upload fails the game will show a little cross and an error will be printed in the log.txt which you can find in the game's folder.

If the upload succeeds then the Steam overlay will appear with a window showing your mod's page on the Steam workshop. There you can edit your mod's description, add more images, and add patch notes if you update your mod.

When your mod is successfully uploaded the game will edit it's info.lua file to add an `id` field to it with a number between quotes. This is your mod's workshop item id. Do not touch it unless you want to create another new mod. This id will let you update your mod when you hit that upload button in the in-game mod menu.


## Thanks!

That's all you need to know to mod Shotgun King! We hope you have fun with it, and we sincerely thank you for being this involved with the game! We can't wait to see what you create!

Love,
-PUNKCAKE Délicieux 🥞
