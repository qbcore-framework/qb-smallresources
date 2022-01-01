RegisterCommand("record", function(source , args)
    StartRecording(1)
    QBCore.Functions.Notify("Started Recording!", "success")
end)

RegisterCommand("clip", function(source , args)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(source , args)
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify("Saved Recording!", "success")
end)

RegisterCommand("delclip", function(source , args)
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify("Deleted Recording!", "error")
end)

RegisterCommand("editor", function(source , args)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify("Later aligator!", "error")
end)
