fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'


client_scripts {
  'config.lua',
  'client.lua',
  '@vorp_core/client/dataview.lua',
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'config.lua',
  'server.lua',
  '@vorp_core/client/dataview.lua',
}

dependency '/assetpacks'
