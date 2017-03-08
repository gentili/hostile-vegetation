data:extend(
{
  {
    type = "tree",
    name = "absorber",
    icon = "__base__/graphics/icons/dead-tree.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 1,
      result = "raw-wood",
      count = 2
    },
    emissions_per_tick = 0.000,
    max_health = 20,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    pictures =
    {
      {
        filename = "__hostile-vegetation__/graphics/entity/absorber/absorber.png",
        flags = { "mipmap" },
        width = 200,
        height= 160,
        shift = {1.5, -0.5}
      }
    }
  }
})
