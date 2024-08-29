--@module = true
--@enable = true
--[====[
hardcoded_gfx
===========

Toggles hardcoded graphical overrides. Currently only affects the black background.

Usage
-----

	enable hardcoded_gfx
	disable hardcoded_gfx
]====]

local swap_graphics = reqscript("internal/swap_graphics")
local GLOBAL_KEY = "hardcoded_gfx"

enabled = enabled or false

function isEnabled()
	return enabled
end

dfhack.onStateChange[GLOBAL_KEY] = function(state)
	if state == SC_WORLD_UNLOADED then
		dfhack.run_command("disable", GLOBAL_KEY)
		return
	end

	if state == SC_WORLD_LOADED then
    	dfhack.run_command("enable", GLOBAL_KEY)
	end
end

if dfhack_flags.module then
	return
end

if not dfhack_flags.enable then
	print(dfhack.script_help())
	print(string.format("Hardcoded GFX lua scripts are currently %q", enabled and "enabled" or "disabled"))
	return
end

if dfhack_flags.enable_state then
	swap_graphics.onLoad()
	print("Custom hardcoded GFX enabled")
	enabled = true
else
	swap_graphics.onUnload()
	print("Custom hardcoded GFX disabled")
	enabled = false
end