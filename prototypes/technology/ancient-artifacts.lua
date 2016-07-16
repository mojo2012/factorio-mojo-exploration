data:extend({
	{
		type = "technology",
		name = "tesla-turrets",
		icon = "__base__/graphics/technology/laser-turrets.png",
		enabled = false,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "tesla-turret"
			}
		},
		prerequisites = {"turrets", "laser", "battery"},
		unit = {
			count = 75,
			ingredients =
			{
				{"science-pack-1", 13},
				{"science-pack-2", 10},
				{"science-pack-3", 5}
			},
			time = 45
		},
		order = "a-j-b"
	}
})