script.on_init(function()
    if not storage.shrug_count then
        storage.shrug_count = {}
    end
end
)

commands.add_command("statistic", "Get your shrug count", function(command)
    local player = game.players[command.player_index]

    player.print("Your shrug count is: " ..( storage.shrug_count[player.name] or 0))
end
)


commands.add_command("leaderboard", "Print the leaderboard of shrug counts", function(command)
    local player = game.players[command.player_index]
    local leaderboard = {}
    local data = {}
    local count = 0


    for a, b in pairs(storage.shrug_count) do
        count = count + 1
        data[a] = b
    end

    if count == 0 then
        return
    end



    while #leaderboard < 10 and #leaderboard < count do
        local best = { "none", 0 }
        for a, b in pairs(data) do
            if b > best[2] then
                best = { a, b }
            end
        end

        table.insert(leaderboard, best)
        data[best[1]] = nil
        best = {}
    end

    local message = "Shrug Leaderboard (top 10)"

    for a, b in pairs(leaderboard) do
        message = message .. "\n" .. b[1] .. " " .. tostring(b[2])
    end

    player.print(message)
end
)



commands.add_command("shrug", "¯\\_(ツ)_/¯", function(command)
    local player = game.players[command.player_index]
    local args = ""

    if command.parameter ~= nil then
        args = command.parameter
    end

    if not storage.shrug_count[player.name] then
        storage.shrug_count[player.name] = 1
    else
        storage.shrug_count[player.name] = storage.shrug_count[player.name] + 1
    end


    player.force.print(player.name .. ": ¯\\_(ツ)_/¯ " .. args, { color = player.chat_color })
end
)
