--config
require "config.config"

require "stdlib.log.logger"
require "stdlib.event.event"

global.logger = Logger.new("mojo-exploration", nil, Config.debug_mode, nil)


-- logic


global.exploration = {
	findable_items = {

	},

}

script.on_event(defines.events.on_player_created, function(event)
	global.logger.log("on_player_created start")

	global.logger.log("on_player_created end")
end)

script.on_event(defines.events.on_chunk_generated, function(event)
	global.logger.log("on_chunk_generated end")

	local surface = event.surface
	local chunkArea = event.area
	local player = game.players[0]

	local foundRuins = surface.find_entities_filtered{area = chunkArea, name = "ancient-ruin-placeholder"}

	if #foundRuins > 0 then
		global.logger.log("found ruins " .. #foundRuins)

		local x = 0
		local y = 0

		for i, ruin in pairs(foundRuins) do
			x = x + ruin.position.x
			y = y + ruin.position.y
		end

		x = x / #foundRuins
		y = y / #foundRuins

		surface.create_entity({
			name="ancient-ruin-1",
			amount=1,
			position={x, y},
			force=game.forces.neutral
		})
	end

	global.logger.log("on_chunk_generated end")
end)