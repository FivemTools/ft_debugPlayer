-- @Date:   2017-06-11T23:21:35+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-07-02T18:11:30+02:00
-- @License: GNU General Public License v3.0

-- Get All player data
TriggerEvent("ft_debugPlayer:SvAddSimpleCommand", "SvPlayers", 2, function (source, args)

  TriggerEvent("ft_gamemode:SvGetPlayers", function (players)
    TriggerEvent("ft_debugBase:SvDebug", players)
  end)

end)

-- Get Player data
TriggerEvent("ft_gamemode:SvAddSimpleCommand", "SvPlayer", 2, function (source, args)

  TriggerEvent("ft_gamemode:SvGetPlayer", source, function (player)
    TriggerEvent("ft_debugBase:SvDebug", player)
  end)

end)

-- Get all value in Player data (client)
TriggerEvent("ft_gamemode:SvAddSimpleCommand", "ClPlayer", 2, function (source, args)

  TriggerClientEvent("ft_debugPlayer:ClGetPlayer", source)

end)

-- Get Value in Player data (client)
TriggerEvent("ft_gamemode:SvAddSimpleCommand", "ClPlayerData", 2, function (source, args)

  TriggerClientEvent("ft_debugPlayer:ClGetPlayerData", source, args[2])

end)

-- Set Value in Array to Player data (client)
TriggerEvent("ft_gamemode:SvAddSimpleCommand", "ClSetPlayerData", 2, function (source, args)

  local data = {}
  local name = args[1]
  local value = args[2]
  data[name] = value

  TriggerEvent("ft_debugBase:SvDebug", data)
  TriggerClientEvent("ft_debugPlayer:ClSetPlayerData", source, data)

end)

-- Set Value in Array to Player data (server)
TriggerEvent("ft_gamemode:SvAddSimpleCommand", "SvSetPlayerData", 2, function (source, args)

  local data = {}
  local name = args[1]
  local value = args[2]
  data[name] = value

  TriggerEvent("ft_gamemode:SvSetPlayerData", source, data)

end)

-- Kick Player
TriggerEvent("ft_gamemode:SvAddSimpleCommand", "ClKickPlayer", 2, function(source, args)

  TriggerEvent('ft_gamemode:SvKickPlayer', source, "Test")

end)

-- Save player pos command
TriggerEvent("ft_gamemode:SvAddSimpleCommand", "SvPos", 2, function(source, args)

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
