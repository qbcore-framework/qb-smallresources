local relationshipTypes = {
    "GANG_1",
    "GANG_2",
    "GANG_9",
    "GANG_10",
    "AMBIENT_GANG_LOST",
    "AMBIENT_GANG_MEXICAN",
    "AMBIENT_GANG_FAMILY",
    "AMBIENT_GANG_BALLAS",
    "AMBIENT_GANG_MARABUNTE",
    "AMBIENT_GANG_CULT",
    "AMBIENT_GANG_SALVA",
    "AMBIENT_GANG_WEICHENG",
    "AMBIENT_GANG_HILLBILLY",
    "DEALER",
    "HATES_PLAYER",
    "NO_RELATIONSHIP",
    "SPECIAL",
    "MISSION2",
    "MISSION3",
    "MISSION4",
    "MISSION5",
    "MISSION6",
    "MISSION7",
    "MISSION8"
}

CreateThread(function()
	while true do
		Wait(50)
		for _, group in ipairs(relationshipTypes) do
			SetRelationshipBetweenGroups(3, GetHashKey('PLAYER'), GetHashKey(group)) -- 5 is always hostile
			SetRelationshipBetweenGroups(3, GetHashKey(group), GetHashKey('PLAYER')) -- 5 is always hostile
		end
	end
end)
