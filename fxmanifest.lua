fx_version 'cerulean'
game 'gta5'

description 'QB-SmallResources'
version '1.0.0'

shared_scripts { 
	'@qb-core/import.lua',
	'config.lua'
}

server_scripts {
    'server/main.lua',
	'server/consumables.lua',
	'server/hostage.lua'
}

client_scripts {
	'client/fireworks.lua',
	'client/binoculars.lua',
    'client/calmai.lua',
    'client/consumables.lua',
    'client/crouchprone.lua',
    'client/cruise.lua',
    'client/density.lua',
    'client/discord.lua',
    'client/engine.lua',
    'client/fireworks.lua',
    'client/hudcomponents.lua',
	'client/ignore.lua',
	'client/point.lua',
    'client/recoil.lua',
    'client/removeentities.lua',
    'client/seatbelt.lua',
    'client/tackle.lua',
	'client/teleports.lua',
	'client/weapdraw.lua',
    'client/weapdrop.lua'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat'
}

exports {
	'HasHarness'
}