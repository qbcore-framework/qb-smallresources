RegisterCommand("record", function()
    StartRecording(1)
    QBCore.Functions.Notify("Started Recording!", "success")
end)

RegisterCommand("clip", function()
    StartRecording(0)
end)

RegisterCommand("saveclip", function()
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify("Saved Recording!", "success")
end)

RegisterCommand("delclip", function()
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify("Deleted Recording!", "error")
end)

RegisterCommand("editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify("Later aligator!", "error")
end)
