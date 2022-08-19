RegisterCommand("record", function()
    StartRecording(1)
    TriggerEvent('QBCore:Notify', "Started Recording!", "success")
end, false)

RegisterCommand("clip", function()
    StartRecording(0)
end, false)

RegisterCommand("saveclip", function()
    StopRecordingAndSaveClip()
    TriggerEvent('QBCore:Notify', "Saved Recording!", "success")
end, false)

RegisterCommand("delclip", function()
    StopRecordingAndDiscardClip()
    TriggerEvent('QBCore:Notify', "Deleted Recording!", "error")
end, false)

RegisterCommand("editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    TriggerEvent('QBCore:Notify', "Later aligator!", "error")
end, false)
