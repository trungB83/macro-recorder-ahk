#Requires AutoHotkey v2.0

mainGui := Gui("+AlwaysOnTop +Resize")
Tab := mainGui.Add("Tab2", "x0 y0 w409 h328", ["Run Macro", "Generate"])

Tab.UseTab(1)
fileList := mainGui.Add("ListView", "x8 y32 w194 h259 +LV0x4000", ["Mouse Steps"])
mainGui.Add("Button", "x224 y32 w80 h23", "Select File").OnEvent('Click', SelectFile)
mainGui.Add("Button", "x224 y64 w80 h23", "Discard").OnEvent('Click', Discard)
mainGui.Add("Button", "x224 y96 w80 h23", "Start").OnEvent('Click', Start)
SB := mainGui.Add("StatusBar", , "Status Bar")

Tab.UseTab(2)
listView := mainGui.Add("ListView", "x8 y32 w200 h254 +LV0x4000", ["Mouse Clicks"])
mainGui.Add("Button", "x224 y32 w80 h23", "&SaveScript").OnEvent('Click', Save)
mainGui.Add("Button", "x224 y64 w80 h23", "&Toggle Record").OnEvent('Click', ToggleRecord)
mainGui.Add("Button", "x224 y96 w80 h23", "&Clear List").OnEvent('Click', ClearList)
mainGui.Add("Text", "x8 y288 w301 h23 +0x200", "Hold Alt and Click to save mouse location")

mainGui.Title := "Mouse macro by TrungB83"
mainGui.Show("w317 h327")

WM_CLOSE := 0x0010
mouseClicks := []
global logDir := A_ScriptDir "\mouseLog"
global recording := false
return

;========================Run macro============================

SelectFile(*) {
    global mouseSteps, fileList
    selectedFile := FileSelect(3, , "Open a file", "Text Documents (*.txt)")
    if (selectedFile) {
        fileContent := FileRead(selectedFile)
        mouseSteps := []
        fileList.Delete()
        for line in StrSplit(fileContent, "`n") {
            if (line) {
                fileList.Add("", line)
                coords := StrSplit(line, ",")
                mouseSteps.Push({ X: +(Trim(coords[2])), Y: +(Trim(coords[3])) })
            }
        }
    }
}

Discard(*) {
    global fileList, mouseSteps
    fileList.Delete()
    mouseSteps := []
}

Start(*) {
    global mouseSteps
    if (mouseSteps.Length > 0) {
        Sleep(5000)
        for step in mouseSteps {
            UpdateStatusBar(step)
            MouseMove(step.X, step.Y, 100)
            Click
            Sleep(1000)
        }
    }
}

UpdateStatusBar(value) {
    global SB
    SB.Text := "Current Mouse Position: " value.X ", " value.Y
}

;=================================Generate macro==========================
Alt:: {
    if (recording) {
        Click()
        MouseGetPos(&mouseX, &mouseY)
        UpdateListView(mouseX, mouseY)
    }
}

ToggleRecord(*) {
    global recording
    recording := !recording
    if (recording) {
        Hotkey "alt", "On"
    } else {
        Hotkey "alt", "Off"
    }
}

UpdateListView(mouseX, mouseY) {
    global listView, mouseClicks
    mouseClicks.Push({ X: mouseX, Y: mouseY })
    listView.Delete()
    for index, click in mouseClicks {
        listView.Add("", index ", " click.X ", " click.Y)
    }
}

ClearList(*) {
    global listView, mouseClicks
    mouseClicks := []
    listView.Delete()
}

Save(*) {
    global mouseClicks, logDir
    fileIndex := 1
    filePath := logDir "\1.txt"
    while FileExist(filePath) {
        fileIndex++
        filePath := logDir "\" fileIndex ".txt"
    }

    for index, click in mouseClicks {
        FileAppend(index ", " click.X ", " click.Y "`n", filePath)
    }
    MsgBox("Saved script in: " filePath)
    listView.Delete()
}

OnClose() {
    ExitApp
}
