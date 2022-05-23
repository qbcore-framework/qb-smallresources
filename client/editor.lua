RegisterCommand("record", function()
    StartRecording(1)
    QBCore.Functions.Notify(Lang:t("editor.record"), "success")
end)

RegisterCommand("clip", function()
    StartRecording(0)
end)

RegisterCommand("saveclip", function()
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify(Lang:t("editor.save"), "success")
end)

RegisterCommand("delclip", function()
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify(Lang:t("editor.delete_clip"), "error")
end)

RegisterCommand("editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify(Lang:t("editor.editor"), "error")
end)
