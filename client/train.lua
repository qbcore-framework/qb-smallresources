Citizen.CreateThread(function() 
	SwitchTrainTrack(0, true) -- Main train track(s) around LS and towards Sandy Shores 
	SwitchTrainTrack(3, true) -- Metro tracks 
	SetTrainTrackSpawnFrequency(0, 120000) -- The Train spawn frequency set for the game engine 
	SetTrainTrackSpawnFrequency(3, 120000) -- The Metro spawn frequency set for the game engine 
	SetRandomTrains(true) -- Telling the game we want to use randomly spawned trains 
end)