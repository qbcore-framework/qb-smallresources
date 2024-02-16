-- 0 = Companion
-- 1 = Respect
-- 2 = Like
-- 3 = Neutral
-- 4 = Dislike
-- 5 = Hate
-- 255 = Pedestrians

-- "AMBIENT_GANG_HILLBILLY" -- sandy shores + random trash {1813.9053955078,3780.8464355469,33.536880493164},
-- "AMBIENT_GANG_CULT" -- hillbillys with their dicks out {-1109.9310302734,4915.4189453125,217.24272155762},
-- "AMBIENT_GANG_LOST" - All lost gang members

-- "MISSION4", -- WEST
-- "MISSION5", -- CENTRAL
-- "MISSION6", -- EAST

-- "AMBIENT_GANG_FAMILY" -- Family (Green clothes near grove) {-173.74082946777,-1621.7894287109,33.628547668457},
-- "AMBIENT_GANG_BALLAS" -- Grove Stret Gangs

-- "AMBIENT_GANG_MEXICAN" -- mexican gang around {326.61358642578,-2034.1141357422,20.908306121826},
-- "AMBIENT_GANG_SALVA" || "AMBIENT_GANG_MARABUNTE" -- gang bangers in fudge lane area - east side LS {1236.2904052734,-1616.4357910156,51.829231262207},

-- "AMBIENT_GANG_WEICHENG" -- little seoul {-759.36694335938,-927.24609375,18.555536270142},

-- mission 8 is the group we set to when we want all civilians to attack them, or gangs etc.


	-------- PLAYER
	-- PLAYER / FAMILY --
	SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_FAMILY`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `PLAYER`)

	-- PLAYER / BALLAS --
	SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_BALLAS`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `PLAYER`)

	-- PLAYER / VAGOS --
	SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_MEXICAN`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `PLAYER`)

	-- PLAYER / LOST MC --
	SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_LOST`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `PLAYER`)

	-- PLAYER / WEICHENG --
	SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_WEICHENG`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `PLAYER`)

	-- PLAYER / MARABUNTA --
	SetRelationshipBetweenGroups(1, `PLAYER`, `AMBIENT_GANG_SALVA`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `PLAYER`)

	-- PLAYER / COP --
	SetRelationshipBetweenGroups(1, `PLAYER`, `COP`)
	SetRelationshipBetweenGroups(1, `COP`,`PLAYER`)

	-- PLAYER / MISSION3 --
	SetRelationshipBetweenGroups(1, `PLAYER`, `MISSION3`)
	SetRelationshipBetweenGroups(1, `MISSION3`,`PLAYER`)

	-- PLAYER / MISSION7 --
	SetRelationshipBetweenGroups(1, `PLAYER`, `MISSION7`)
	SetRelationshipBetweenGroups(1, `MISSION7`, `PLAYER`)

	-- PLAYER / PRISONER --
	SetRelationshipBetweenGroups(1, `PLAYER`, `PRISONER`)
	SetRelationshipBetweenGroups(1, `PRISONER`, `PLAYER`)

	-------- POLICE / EMS

	-- MISSION2 / BALLAS --
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION2`)
	SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_BALLAS`)

	-- MISSION2 / FAMILY --
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION2`)
	SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_FAMILY`)

	-- MISSION2 / WEICHENG --
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION2`)
	SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_WEICHENG`)

	-- MISSION2 / MARABUNTA --
	SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_SALVA`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION2`)

	-- MISSION2 / VAGOS --
	SetRelationshipBetweenGroups(1, `MISSION2`, `AMBIENT_GANG_MEXICAN`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION2`)

	-- MISSION2 / NORELATIONSHIP --
	SetRelationshipBetweenGroups(1, `MISSION2`, `NO_RELATIONSHIP`)
	SetRelationshipBetweenGroups(1, `NO_RELATIONSHIP`, `MISSION2`)

	-- MISSION2 / CIVMALE --
	SetRelationshipBetweenGroups(1, `MISSION2`, `CIVMALE`)
	SetRelationshipBetweenGroups(1, `CIVMALE`, `MISSION2`)

	-- MISSION2 / CIVFEMALE --
	SetRelationshipBetweenGroups(1, `MISSION2`, `CIVFEMALE`)
	SetRelationshipBetweenGroups(1, `CIVFEMALE`, `MISSION2`)

	-- MISSION2 / MISSION7 --
	SetRelationshipBetweenGroups(1, `MISSION2`, `MISSION7`)
	SetRelationshipBetweenGroups(1, `MISSION7`, `MISSION2`)

	-------- MISC

	-- COP / MISSION7 --
	SetRelationshipBetweenGroups(1, `COP`, `MISSION7`)
	SetRelationshipBetweenGroups(1, `MISSION7`, `COP`)

	-- COP / LOST MC --
	SetRelationshipBetweenGroups(1, `COP`, `AMBIENT_GANG_LOST`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_LOST`, `COP`)

	-- COP / PRISONER --
	SetRelationshipBetweenGroups(1, `COP`, `PRISONER`)
	SetRelationshipBetweenGroups(1, `PRISONER`, `COP`)

	-- MISSION4 / WEICHENG --
	SetRelationshipBetweenGroups(1, `MISSION4`, `AMBIENT_GANG_WEICHENG`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_WEICHENG`, `MISSION4`)

	-- MISSION5 / FAMILY --
	SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_FAMILY`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_FAMILY`, `MISSION5`)

	-- MISSION5 / BALLAS --
	SetRelationshipBetweenGroups(1, `MISSION5`, `AMBIENT_GANG_BALLAS`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_BALLAS`, `MISSION5`)

	-- MISSION6 / MARABUNTA --
	SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_SALVA`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_SALVA`, `MISSION6`)

	-- MISSION6 / VAGOS --
	SetRelationshipBetweenGroups(1, `MISSION6`, `AMBIENT_GANG_MEXICAN`)
	SetRelationshipBetweenGroups(1, `AMBIENT_GANG_MEXICAN`, `MISSION6`)

	-- MISSION7 / MISSION7 --
	SetRelationshipBetweenGroups(1, `MISSION7`, `MISSION7`)
