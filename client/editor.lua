RegisterCommand("record", function(source , args)
    StartRecording(1)
    ESX.ShowNotification("Started Recording!")
end)

RegisterCommand("clip", function(source , args)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(source , args)
    StopRecordingAndSaveClip()
    ESX.ShowNotification("Saved Recording!")
end)

RegisterCommand("delclip", function(source , args)
    StopRecordingAndDiscardClip()
    ESX.ShowNotification("Deleted Recording!")
end)

RegisterCommand("editor", function(source , args)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    ESX.ShowNotification("Later aligator!")
end)
