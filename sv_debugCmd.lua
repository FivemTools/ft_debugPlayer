-- @Author: samuelds
-- @Date:   2017-06-07T20:56:10+02:00
-- @Project: FiveM Tools
-- @Last modified by:
-- @Last modified time: 2017-06-10T17:11:45+02:00
-- @License: GNU General Public License v3.0

-- Get All player data
TriggerEvent("ft:SvAddSimpleCommand", "SvPlayers", 2, function (source, args)

  TriggerEvent("ft:SvGetPlayers", function (players)
    TriggerEvent("ft_debugBase:SvDebug", players)
  end)

end)

-- Get Player data
TriggerEvent("ft:SvAddSimpleCommand", "SvPlayer", 2, function (source, args)

  TriggerEvent("ft:SvGetPlayer", source, function (player)
    TriggerEvent("ft_debugBase:SvDebug", player)
  end)

end)

-- Get all value in Player data (client)
TriggerEvent("ft:SvAddSimpleCommand", "ClPlayer", 2, function (source, args)

  TriggerClientEvent("ft_debugPlayer:ClGetPlayer", source)

end)

-- Get Value in Player data (client)
TriggerEvent("ft:SvAddSimpleCommand", "ClPlayerData", 2, function (source, args)

  TriggerClientEvent("ft_debugPlayer:ClGetPlayerData", source, args[2])

end)

-- Set Value in Array to Player data (client)
TriggerEvent("ft:SvAddSimpleCommand", "ClSetPlayerData", 2, function (source, args)

  local data = {}
  local name = args[1]
  local value = args[2]
  data[name] = value

  TriggerEvent("ft_debugBase:SvDebug", data)
  TriggerClientEvent("ft_debugPlayer:ClSetPlayerData", source, data)

end)

-- Set Value in Array to Player data (server)
TriggerEvent("ft:SvAddSimpleCommand", "SvSetPlayerData", 2, function (source, args)

  local data = {}
  local name = args[1]
  local value = args[2]
  data[name] = value

  TriggerEvent("ft:SvSetPlayerData", source, data)

end)

-- Kick Player
TriggerEvent("ft:SvAddSimpleCommand", "ClKickPlayer", 2, function(source, args)

  TriggerEvent('ft:SvKickPlayer', source, "Test")

end)

-- Save player pos command
TriggerEvent("ft:SvAddSimpleCommand", "SvPos", 2, function(source, args)

  local name = nil
  for _, text in pairs(args) do
    if name ~= nil then
      name = name .. " " .. text
    else
      name = text
    end
  end

  if name == nil then
    name = ""
  end

  TriggerClientEvent('ft_debugBase:ClPos', source, name)

end)
