data:extend(
{
  {
    type = "tile",
    name = "swamp",
    needs_correction=false,
    collision_mask =
    {
      "resource-layer",
      "doodad-layer"
    },
    layer = 40,
    variants =
    {
      main =
      {
        {
          picture = "__hostile-vegetation__/graphics/terrain/water-green/water-green1.png",
          count = 8,
          size = 1
        },
        {
          picture = "__hostile-vegetation__/graphics/terrain/water-green/water-green2.png",
          count = 8,
          size = 2
        },
        {
          picture = "__hostile-vegetation__/graphics/terrain/water-green/water-green4.png",
          count = 6,
          size = 4
        }
      },
      inner_corner =
      {
        picture = "__hostile-vegetation__/graphics/terrain/water-green/water-green-inner-corner.png",
        count = 6
      },
      outer_corner =
      {
        picture = "__hostile-vegetation__/graphics/terrain/water-green/water-green-outer-corner.png",
        count = 6
      },
      side =
      {
        picture = "__hostile-vegetation__/graphics/terrain/water-green/water-green-side.png",
        count = 8
      }
    },
    map_color={r=31, g=48, b=18},
    ageing=0.0005
  }

})
