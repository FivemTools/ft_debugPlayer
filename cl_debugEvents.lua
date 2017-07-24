-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

-- Get all player data
RegisterNetEvent('ft_debugPlayer:ClGetPlayer')
AddEventHandler('ft_debugPlayer:ClGetPlayer', function()
  Citizen.CreateThread(function()

    local data = exports.ft_gamemode:GetPlayerData(nil)
    TriggerServerEvent("ft_debugBase:SvDebug", data)

  end)
end)

-- Get value in player data
RegisterNetEvent('ft_debugPlayer:ClGetPlayerData')
AddEventHandler('ft_debugPlayer:ClGetPlayerData', function(name)
  Citizen.CreateThread(function()

    local data = exports.ft_gamemode:GetPlayerData(name) or "empty2"
    TriggerServerEvent("ft_debugBase:SvDebug", data)

  end)
end)

-- Set player data
RegisterNetEvent('ft_debugPlayer:ClSetPlayerData')
AddEventHandler('ft_debugPlayer:ClSetPlayerData', function(data)
  Citizen.CreateThread(function()

    TriggerEvent("ft_gamemode:ClSetPlayerData", data)
    TriggerEvent("ft_debugPlayer:ClGetPlayer")

  end)
end)
