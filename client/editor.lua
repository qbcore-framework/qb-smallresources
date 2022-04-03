RegisterCommand("record", function(source , args)
    StartRecording(1)
    QBCore.Functions.Notify(Lang:t("editor.record"), "success")
end)

RegisterCommand("clip", function(source , args)
    StartRecording(0)
end)

RegisterCommand("saveclip", function(source , args)
    StopRecordingAndSaveClip()
    QBCore.Functions.Notify(Lang:t("editor.save"), "success")
end)

RegisterCommand("delclip", function(source , args)
    StopRecordingAndDiscardClip()
    QBCore.Functions.Notify(Lang:t("editor.delete_clip"), "error")
end)

RegisterCommand("editor", function(source , args)
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    QBCore.Functions.Notify(Lang:t("editor.editor"), "error")
end)
