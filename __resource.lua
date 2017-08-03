-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

dependencies {

  "ft_gamemode",
  "ft_debugBase",

}

-- Scripts
client_scripts {

  "cl_debugEvents.lua",

}

server_scripts {

  "sv_debugCmd.lua",

}
