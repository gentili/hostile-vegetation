data:extend(
{
  {
    type = "tree",
    name = "absorber",
    icon = "__hostile-vegetation__/graphics/icons/absorber.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    emissions_per_tick = 0.000,
    max_health = 20,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    subgroup = "trees",
    order = "a[tree]-b[dead-tree]",
    pictures =
    {
      {
        filename = "__hostile-vegetation__/graphics/entity/absorber/absorber.png",
        flags = { "mipmap" },
        width = 200,
        height= 160,
        shift = {1.9, -0.5}
      }
    }
  }
})
