-- Support functions

growth_min = 100
home_radius = 5

local function new_brood(absorber)
    local radius = home_radius
    local sqr_radius = radius*radius
    local position = absorber.position
    local targets = {}

    for i=-radius,radius do
        for j=-radius,radius do
            local x=position.x+i
            local y=position.y+j
            local cur_sqr_radius = i*i+j*j
            if cur_sqr_radius <= sqr_radius then 
                table.insert(targets,{sqr_radius=cur_sqr_radius,x=x,y=y})
            end
        end
    end
    table.sort(targets, function (a,b)
        return (a.sqr_radius < b.sqr_radius)
    end)
    return {absorber=absorber,
            stored=0,
            target_tiles=targets}
end

local function grow_brood(brood)
    local player = game.players[1]
    local surface = game.surfaces[1]
    local targets = brood.target_tiles
    while (targets[1]) do 
        v = targets[1]
        if surface.get_tile(v.x,v.y).name ~= "swamp" then
            surface.set_tiles({{name = "swamp",position={v.x,v.y}}})
            brood.stored = brood.stored - growth_min
        end
        table.remove(targets,1)
        if brood.stored < growth_min then
            return
        end
    end
    player.print("Need new targets!")
end

-- Init stuff

local function on_init()
    global.broods = {}
end

script.on_init(on_init)

-- Event stuff

local function on_tick(event)
    -- Check for filth every second
    if event.tick % 30 == 0 then
        local surface = game.surfaces[1]
        local player = game.players[1]
        surface.pollute(player.position,100)
        for i,brood in ipairs(global.broods) do
            -- absorb half of the ambient pollution 
            local pollution = surface.get_pollution(brood.absorber.position)
            if pollution > 0 then
                pollution = pollution / 2
                surface.pollute(brood.absorber.position, -pollution)
                brood.stored = brood.stored + pollution
                player.print(brood.stored)
                if brood.stored > growth_min then
                    grow_brood(brood)
                end
            end
        end
    end
end

local function on_chunk_generated(event)
end

local function on_built_entity(event)
    if global.broods[1] then
        return
    end
    local player = game.players[event.player_index]
    local surface = player.surface
    if event.created_entity.name == "stone-furnace" then

        local position = event.created_entity.position
        event.created_entity.destroy()
        player.insert({name="stone-furnace"})

        player.print(serpent.block(position))
        local absorber = surface.create_entity{
            name = "absorber",
            position = position,
            force=game.forces.enemies}
        surface.set_tiles({{name = "swamp",position=position}})
        global.broods[1] = new_brood(absorber)
    end
end

script.on_event(defines.events.on_tick, on_tick)
script.on_event(defines.events.on_chunk_generated, on_chunk_generated)
script.on_event(defines.events.on_built_entity, on_built_entity)

