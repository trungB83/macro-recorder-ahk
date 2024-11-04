#Requires AutoHotkey v2.0

destination := A_ScriptDir . "\images\destination.png"
launch := A_ScriptDir . "\images\run.png"
vanguard := A_ScriptDir . "\images\VG.png"
orbit := A_ScriptDir . "\images\orbit.png"
eternity := A_ScriptDir . "\images\Eternity.png"
nightfall := A_ScriptDir . "\images\nightfall.png"
vg := A_ScriptDir . "\images\vg.png"

isPaused := false

Pause:: {
    isPaused := !isPaused
    if (isPaused) {
        MsgBox("The application has been paused.")
    } else {
        MsgBox("The application has resumed.")
    }
}

F5:: {
    Reload
}

F3:: {
    ; coordmode("Pixel", "Window")
    coordmode("Mouse", "Window")
    windowID := WinExist("ahk_exe Destiny2.exe")
    if (windowID) {
        WinGetPos(&windowX, &windowY, &windowWidth, &windowHeight, windowID)
        windowInfo := { X: windowX, Y: windowY, Width: windowWidth, Height: windowHeight }
        MsgBox("Destiny 2 window found!")
        MoveMouseToCenter(windowWidth, windowHeight)
        MsgBox("Tìm kiếm hình ảnh trong vùng: " .
            windowInfo.X . ", " .
            windowInfo.Y . ", " .
            (windowInfo.X + windowInfo.Width) . ", " .
            (windowInfo.Y + windowInfo.Height))
        commandCode := ""
        while (!isInteger(commandCode)) {
            input := InputBox(
                "The script is now running.`nPress F4 to stop the script.`nPress F5 to restart the script.`nPress Pause to pause the script.`n1, nightfall | 2, Vanguard OP | 3, DOE | 4, OnSlaugh | 5, Revenant Normal:",
                "AFK by TrungB83", "")
            if (input.Result = "Cancel")
                commandCode := 0
            else
                commandCode := input.value
        }

        if (commandCode >= 1 && commandCode <= 3) {
            startMacro(commandCode, windowInfo)
        } else {
            MsgBox("Invalid CommandCode. Please enter 1, 2, or 3.")
        }
    } else {
        MsgBox("Destiny 2 window not found.")
    }
}

F4:: {
    MsgBox("The script has been stopped.", "AFK by TrungB83", "Iconi T2")
    ExitApp
}

MoveMouseToCenter(windowWidth, windowHeight) {
    centerX := windowWidth // 2
    centerY := windowHeight // 2
    MouseMove centerX, centerY
}

GetImagePath(commandCode) {
    switch (commandCode) {
        case 1:
            return [destination]
        case 2:
            return [eternity]
        case 3:
            return [launch]
        case 4:
            return [nightfall]
        case 5:
            return [destination, vanguard, vg, launch, orbit]
        default:
            return []
    }
}

startMacro(commandCode, windowInfo) {
    imagePaths := GetImagePath(commandCode)
    for index, currentImagePath in imagePaths {
        if (currentImagePath != "") {
            performImageSearch(currentImagePath, windowInfo)
            Sleep 5000
        }
    }
}

performImageSearch(imagePath, windowInfo) {
    ; MsgBox("Tìm kiếm hình ảnh trong vùng: " .
    ;     windowInfo.X . ", " .
    ;     windowInfo.Y . ", " .
    ;     (windowInfo.X + windowInfo.Width) . ", " .
    ;     (windowInfo.Y + windowInfo.Height))
    if ImageSearch(&FoundX, &FoundY, windowInfo.X, windowInfo.Y, windowInfo.X + windowInfo.Width, windowInfo.Y +
        windowInfo.Height, imagePath) {
        MouseMove FoundX, FoundY
        MouseClick
    }
    else {
        MsgBox("Image not found.")
    }
}
