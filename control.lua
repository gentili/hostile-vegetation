local function on_player_mined_item(event) 
    game.players[event.player_index].print("You mined!")
end

local function on_tick(event)
    -- Check for filth every second
    if event.tick % 60 == 0 then
        
    end
end

local function on_gui_click(event)
    game.players[event.player_index].print("You clicked!")
end

script.on_event(defines.events.on_player_mined_item, on_player_mined_item)
script.on_event(defines.events.on_tick, on_tick)
script.on_event(defines.events.on_gui_click, on_gui_click)
