--@module = true

local utils = require("utils")

local old_black = 2566
local has_changed_black = false

function onLoad()
	--Save this integer so we can undo this
	if not has_changed_black then
		old_black = df.global.gps.black_background_texpos[0]
		--print(old_black)
		has_changed_black = true
	end
	
	local new_black = dfhack.screen.findGraphicsTile('HACK_BLACKBG', 0, 0) or 32
	--print(new_black)
	df.global.gps.black_background_texpos[0] = new_black
end

function onUnload()
	df.global.gps.black_background_texpos[0] = old_black
end