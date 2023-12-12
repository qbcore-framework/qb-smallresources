--  Relationship Types:
--  0 = Companion
--  1 = Respect
--  2 = Like
--  3 = Neutral
--  4 = Dislike
--  5 = Hate

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
