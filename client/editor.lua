RegisterCommand("record", function(_ , _)
    StartRecording(1)
    QBCore.Functions.Notify("Started Recording!", "success")
end)

RegisterCommand("clip", function(_ , _)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(_ , _)
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify("Saved Recording!", "success")
end)

RegisterCommand("delclip", function(_ , _)
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify("Deleted Recording!", "error")
end)

RegisterCommand("editor", function(_ , _)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify("Later aligator!", "error")
end)
