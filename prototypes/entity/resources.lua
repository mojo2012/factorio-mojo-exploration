
-- autoplace
data:extend({
	{
		type = "autoplace-control",
		name = "ancient-ruin-placeholder",
		richness = true,
		order = "b-e"
	},
	{
		type = "noise-layer",
		name = "ancient-ruin-placeholder"
	},
})


-- resource
data:extend({
	{
		type = "resource",
		name = "ancient-ruin-placeholder",
		flags = {"placeable-neutral"},
		map_color = {r=0.1, g=1, b=0.1},
		map_grid = false,
		collision_box = {{ -1, -1}, {1, 1}},
		selection_box = {{ -1, -1}, {1, 1}},
		minimum = 1,
		normal = 5,
		minable = {
			hardness = 1,
			mining_time = 1,
			results = {
				{
				  name = "stone",
				  amount_min = 1,
				  amount_max = 1,
				  probability = 0.7
				},
				{
				  name = "alien-artifact",
				  amount_min = 1,
				  amount_max = 1,
				  probability = 0.1
				}
			}
		},
		order="a-b-f",
		icon = "__mojo-exploration__/graphics/empty.png",
		stage_counts = {0},
		stages = {
			sheet =
			{
				filename = "__mojo-exploration__/graphics/entity/ancient-ruin-placeholder.png",
				--filename = "__mojo-exploration__/graphics/debug.png",
				priority = "extra-high",
				width = 100,
				height = 100,
				frame_count = 1,
				direction_count = 1,
				variation_count = 1
			}
		},
		autoplace = {
			control = "ancient-ruin-placeholder",
			sharpness = 1,
			sharpness = 0.99,
			max_probability = 0.035,
			richness_base = 6000,
			richness_multiplier = 30000,
			richness_multiplier_distance_bonus = 10,
			coverage = 0.02, -- Cover on average 2% of surface area.
			peaks = {
				{
					noise_layer = "ancient-ruin-placeholder",
					noise_octaves_difference = -1,
					noise_persistence = 0.4,
				}
			},
		}
	}
})

data:extend({
	{
		type = "container",
		name = "ancient-ruin-1",
		icon = "__mojo-exploration__/graphics/empty.png",
		flags = {"placeable-neutral" },
		max_health = 1000,
		corpse = "medium-remnants",
		order="a-b-f",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		resistances = {
			{
				type = "fire",
				percent = 80
			}
		},
		collision_box = {{-5, -5}, {5, 5}},
		selection_box = {{-5, -5}, {5, 5}},
		fast_replaceable_group = "container",
		inventory_size = 32,
		vehicle_impact_sound =	{ filename = "__base__/sound/car-stone-impact.ogg", volume = 0.65 },
		picture = {
			filename = "__mojo-exploration__/graphics/entity/ancient-ruin-1.png",
			priority = "extra-high",
			width = 400,
			height = 400,
			shift = {0.1875, 0}
		},
	},
	{
		type = "container",
		name = "ancient-ruin-2",
		icon = "__mojo-exploration__/graphics/empty.png",
		flags = {"placeable-neutral" },
		max_health = 1000,
		corpse = "medium-remnants",
		order="a-b-f",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		resistances = {
			{
				type = "fire",
				percent = 80
			}
		},
		collision_box = {{-5, -5}, {5, 5}},
		selection_box = {{-5, -5}, {5, 5}},
		fast_replaceable_group = "container",
		inventory_size = 32,
		vehicle_impact_sound =	{ filename = "__base__/sound/car-stone-impact.ogg", volume = 0.65 },
		picture = {
			filename = "__mojo-exploration__/graphics/entity/ancient-ruin-1.png",
			priority = "extra-high",
			width = 400,
			height = 400,
			shift = {0.1875, 0}
		},
	},
	{
		type = "container",
		name = "ancient-ruin-3",
		icon = "__mojo-exploration__/graphics/empty.png",
		flags = {"placeable-neutral" },
		max_health = 1000,
		corpse = "medium-remnants",
		order="a-b-f",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		resistances = {
			{
				type = "fire",
				percent = 80
			}
		},
		collision_box = {{-5, -5}, {5, 5}},
		selection_box = {{-5, -5}, {5, 5}},
		fast_replaceable_group = "container",
		inventory_size = 32,
		vehicle_impact_sound =	{ filename = "__base__/sound/car-stone-impact.ogg", volume = 0.65 },
		picture = {
			filename = "__mojo-exploration__/graphics/entity/ancient-ruin-1.png",
			priority = "extra-high",
			width = 400,
			height = 400,
			shift = {0.1875, 0}
		},
	},
	{
		type = "container",
		name = "ancient-ruin-4",
		icon = "__mojo-exploration__/graphics/empty.png",
		flags = {"placeable-neutral" },
		max_health = 1000,
		corpse = "medium-remnants",
		order="a-b-f",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		resistances = {
			{
				type = "fire",
				percent = 80
			}
		},
		collision_box = {{-5, -5}, {5, 5}},
		selection_box = {{-5, -5}, {5, 5}},
		fast_replaceable_group = "container",
		inventory_size = 32,
		vehicle_impact_sound =	{ filename = "__base__/sound/car-stone-impact.ogg", volume = 0.65 },
		picture = {
			filename = "__mojo-exploration__/graphics/entity/ancient-ruin-1.png",
			priority = "extra-high",
			width = 400,
			height = 400,
			shift = {0.1875, 0}
		},
	},
})