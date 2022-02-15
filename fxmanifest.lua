fx_version 'adamant'
game 'gta5'
version '1.0'
author 'imdarket'

shared_script 'config.lua'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
}

client_scripts {
	'client/depot.lua',
	'@PolyZone/client.lua',
	'@PolyZone/ComboZone.lua',
	'client/main.lua',
	'client/qb-garages.lua',
}

server_scripts {
	'server/depot.lua',
	'server/main.lua',
	'server/qb-garages.lua',
	'@oxmysql/lib/MySQL.lua'
}

escrow_ignore {
	'config.lua',
}

lua54 'yes'