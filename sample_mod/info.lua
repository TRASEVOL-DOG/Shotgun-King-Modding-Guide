name="sample_mod" -- Make this match your mod's folder

title="Official Sample Mod"
by="punkcake_delicieux"
description=[[
Hi punks,

This is the official sample mod for Shotgun King: The Final Checkmate!

It adds a moustache and skirmish mode to the game, as well as a custom chess piece and two new cards!

This is mostly meant as an example of things you can do. Feel free to download it and modify the code, have fun with it!

If you want to learn how to mod Shotgun King, currently your best bet is the Punkcake Discord where we have a bunch of resources and a handful of active modders! Join us at https://discord.gg/NjmypEPHsz

Love you,
-PUNKCAKE Delicieux 🥞
]]

cover="cover.png" -- This is the mod preview that will appear on the steam workshop

--default_lang="frank" -- This lets you set a default language for when your mod is active

priority_hint=0 -- A higher number means your mod will automatically be placed higher in people's mod loading order
mode_description = {
	["skirmish"] = "Skirmish|You're walking in the forest when suddenly ennemies attack!|The White King only ever arrives on turn 8."
}
mode_record = { -- This lets you display a highscore for each of your game modes.
	["skirmish"] = { name="best score: ", bx=0, by=1 } -- bx and by are coordinates in the mod's save bank.
}