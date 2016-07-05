--config
require "config.config"

require "stdlib.log.logger"
require "stdlib.event.event"




-- logic

global.exploration = {
	placableRuins = {
		[1] = "ancient-ruin-1",
		[2] = "ancient-ruin-2",
		[3] = "ancient-ruin-3",
		[4] = "ancient-ruin-4",
	},
	findable_items = {
		[1]  = nil,
		[2]  = { name = "tesla-turret", count = 1},
		[3]  = nil,
		[4]  = nil,
		[5]  = { name = "alien-artifact", count = 1},
		[6]  = { name = "alien-artifact", count = 4},
		[7]  = nil,
		[8]  = { name = "alien-artifact", count = 1},
		[9]  = nil,
		[10] = { name = "tesla-turret", count = 1},
		[11] = nil,
		[12] = nil,
		[13] = nil,
		[14] = nil,
		[15] = nil,
		[16] = nil,
		[17] = { name = "tesla-turret", count = 1},
		[18] = nil,
		[19] = nil,
		[20] = nil,
	},
	player_status = {
		last_minded_entity = nil
	}

}

-- initialization

Event.register(Event.core_events.init, function()
	global.logger = Logger.new("mojo-exploration", nil, Config.debug_mode, nil)
end)

Event.register(Event.core_events.load, function()
	global.logger = Logger.new("mojo-exploration", nil, Config.debug_mode, nil)
end)


-- on player creation

Event.register(defines.events.on_player_created, function(event)

end)

-- record the last mined ruin entity
Event.register(defines.events.on_preplayer_mined_item, function(event)
	if event.entity.name == "ancient-ruin-placeholder" then
		global.exploration.last_minded_entity = event.entity
	end
end)

-- if the user mines a ruin resource, this resource is removed from the map
-- (so that graves can only be looted once)
Event.register(defines.events.on_player_mined_item, function(event)
	if global.exploration.last_minded_entity ~= nil then
		
		global.exploration.last_minded_entity.destroy()
		global.exploration.last_minded_entity = nil
		
	end
end)

-- on chunk generation
-- we check for new ruin resources, and create ruin entities

Event.register(defines.events.on_chunk_generated, function(event)
	local surface = event.surface
	local chunkArea = event.area
	local player = game.players[0]

	local foundRuins = surface.find_entities_filtered{area = chunkArea, name = "ancient-ruin-placeholder"}

	if #foundRuins > 0 then
		--global.logger.log("found ruins " .. #foundRuins)

		placeRuins(foundRuins, surface, chunkArea)
		
	end
end)

-- places a ruin entity in a "ruin" resource field
function placeRuins(ruins, surface, area)

	-- init random generator
	math.randomseed(game.tick)

	local x = 0
	local y = 0

	for i, ruin in pairs(ruins) do
		x = x + ruin.position.x
		y = y + ruin.position.y
	end

	x = x / #ruins
	y = y / #ruins

	local ruinId = global.exploration.placableRuins[math.random(4)]

	local nonCollidingPosition = surface.find_non_colliding_position(ruinId, {x = x, y = y}, 40, 20)

	local ruinToPlace = { 
		name = ruinId,
		position = nonCollidingPosition,
		force = game.forces.neutral,
		amount = 1
	}

	if nonCollidingPosition ~= nil and surface.can_place_entity(ruinToPlace) then
		local ruinEntity = surface.create_entity(ruinToPlace)

		placeArtefacts(ruinEntity)
	else
		global.logger.log("Can't place ruin at " .. x ..":" .. y)
	end
end

-- takes an ruin entity and places some randomly generated items in it
function placeArtefacts(ruinEntity)

	-- generate random numbers >1, <10
	local random = math.random(10)
	local randomItem = global.exploration.findable_items[random]

	if randomItem ~= nil then
		local inventory = ruinEntity.get_inventory(defines.inventory.item_main)
		inventory.insert(randomItem)
	end

end



