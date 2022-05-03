fx_version "cerulean"

game "gta5"

description 'ESX Supreme Empresas'
author 'SupremeBoy#2186'

version '1.0'

client_scripts {
  'Config.lua',
  'Client/*.lua'
}

server_scripts {
  "@mysql-async/lib/MySQL.lua",
  'Config.lua',
  'Server/*.lua'
}
