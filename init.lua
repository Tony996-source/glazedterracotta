
local clay = {
	{"white",      "White"},
	{"silver",     "Silver"},
	{"grey",       "grey"},
	{"black",      "Black"},
	{"purple",     "Purple"},
	{"blue",       "Blue"},
	{"cyan",       "Cyan"},
	{"green",      "green"},
	{"lime",       "Lime"},
	{"yellow",     "Yellow"},
	{"brown",      "Brown"},
	{"orange",     "Orange"},
	{"red",        "Red"},
	{"magenta",    "Magenta"},
	{"pink",       "Pink"},
    {"light_blue", "Light Blue"},
}


for _, clay in pairs(clay) do

	-- node definition

minetest.register_node("glazedterracotta:" .. clay[1], {
		description = clay[2] .. " Glazed Terracotta",
		tiles = {"glazed_terracotta_" .. clay[1] ..".png"},
		groups = {cracky = 3, glazedterracotta = 1},
		sounds = default.node_sound_stone_defaults(),
	})

	-- craft from dye and any glazzed terracotta

minetest.register_craft({
		output = "glazedterracotta:" .. clay[1],
		recipe = {
			{"group:glazedterracotta", "dye:" .. clay[1],  ""},
			{"", "",  ""},
			{"", "",  ""}
		},
	})
	
	local stairs_mod = minetest.get_modpath("stairs")
local stairsplus_mod = minetest.get_modpath("moreblocks")
	and minetest.global_exists("stairsplus")

-- register stairsplus stairs if found
	if stairsplus_mod then

		stairsplus:register_all("glazedterracotta", "glazedterracotta_" .. clay[1], "glazedterracotta:" .. clay[1], {
			description = clay[2] .. " Glazed Terracotta",
			tiles = {"glazed_terracotta_" .. clay[1] .. ".png"},
			groups = {cracky = 3},
			sounds = default.node_sound_stone_defaults(),
		})

		stairsplus:register_alias_all("glazedterracotta", clay[1], "glazedterracotta", "glazedterracotta_" .. clay[1])
		minetest.register_alias("stairs:slab_glazedterracotta_".. clay[1], "glazedterracotta:slab_glazedterracotta_" .. clay[1])
		minetest.register_alias("stairs:stair_glazedterracotta_".. clay[1], "glazedterracotta:stair_glazedterracotta_" .. clay[1])

-- basic materials.
minetest.register_craftitem("glazedterracotta:terracotta_base", {
	description = "Uncooked Terracotta Base",
	inventory_image = "basic_materials_terracotta_base.png",
})

-- crafting

minetest.register_craft( {
	type = "shapeless",
	output = "glazedterracotta:terracotta_base 8",
	recipe = {
		"default:clay_lump",
		"default:gravel",
	},
})

	end
end
