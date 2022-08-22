RegisterCommand("record", function()
    StartRecording(1)
    TriggerEvent('QBCore:Notify', Lang:t("notify.recording_on"), "success")
end, false)

RegisterCommand("clip", function()
    StartRecording(0)
end, false)

RegisterCommand("saveclip", function()
    StopRecordingAndSaveClip()
    TriggerEvent('QBCore:Notify', Lang:t("notify.recording_saved"), "success")
end, false)

RegisterCommand("delclip", function()
    StopRecordingAndDiscardClip()
    TriggerEvent('QBCore:Notify', Lang:t("notify.recording_del"), "error")
end, false)

RegisterCommand("editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    TriggerEvent('QBCore:Notify', Lang:t("notify.editor"), "error")
end, false)
