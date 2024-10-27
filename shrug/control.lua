commands.add_command("shrug", [[¯\_(ツ)_/¯]], function (command)
    local player = game.players[command.player_index]
    local args = ""
    if command.parameter ~= nil then
        args = command.parameter
    end 
    game.player.force.print(player.name .. ": ¯\\_(ツ)_/¯ " .. args, {color = player.chat_color} )
end
)

