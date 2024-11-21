mainGui := Gui("+AlwaysOnTop +Resize")
Tab := mainGui.Add("Tab2", "x0 y0 w409 h358", ["Run Macro", "Generate"])

Tab.UseTab(1)
fileList := mainGui.Add("ListView", "x8 y32 w194 h259 +LV0x4000", ["Mouse Steps"])
mainGui.Add("Button", "x224 y32 w80 h23", "Select File").OnEvent('Click', SelectFile)
mainGui.Add("Button", "x224 y64 w80 h23", "Discard").OnEvent('Click', Discard)
mainGui.Add("Button", "x224 y96 w80 h23", "Start").OnEvent('Click', Start)
mainGui.Add("CheckBox", "x224 y128 w120 vLoopScript", "Loop Script")
mainGui.Add("Button", "x224 y160 w80 h23", "Stop Script").OnEvent('Click', StopScript)
SB := mainGui.Add("StatusBar", , "Status Bar")

Tab.UseTab(2)
listView := mainGui.Add("ListView", "x8 y32 w200 h254 +LV0x4000", ["Index", "X", "Y/Char", "Delay"])
mainGui.Add("Button", "x224 y32 w80 h23", "&SaveScript").OnEvent('Click', Save)
mainGui.Add("Button", "x224 y64 w80 h23", "&Toggle Record").OnEvent('Click', ToggleRecord)
mainGui.Add("Button", "x224 y96 w80 h23", "&Clear List").OnEvent('Click', ClearList)
mainGui.Add("Text", "x8 y288 w301 h23 +0x200", "Hold Alt and Click to save mouse location")

mainGui.Title := "Mouse macro by TrungB83"
mainGui.Show("w317 h358")

WM_CLOSE := 0x0010
mouseClicks := []
global logDir := A_ScriptDir "\mouseLog"
global recording := false
global loopScript := false
global stopRun := false
return

;=================================Hotkey macro==========================

F1:: {
    Suspend
    Record()
}


F2:: {
    Suspend
    Record()
}

Record() {
    if (Recording or Playing)
        return
      Coord:=InStr(A_ThisLabel,"Win") ? "Window":"Screen"
      LogArr:=[], oldid:="", Log(), Recording:=1, SetHotkey(1)
      ShowTip("Recording")
    return
}


F4:: {
    StopScript()
}

OnClose() {
    ExitApp
}

;=================================Generate macro==========================

Alt:: {
    if (recording) {
        Click()
        MouseGetPos(&mouseX, &mouseY)
        UpdateListView(mouseX, mouseY, "")
    }
}

ToggleRecord(*) {
    global recording
    recording := !recording
    if (recording) {
        Hotkey "alt", "On"
        RecordInput()
    } else {
        Hotkey "alt", "Off"
    }
}

RecordInput() {
}

UpdateListView(mouseX, mouseY, char) {
    global listView, mouseClicks
    index := mouseClicks.Length + 1
    mouseClicks.Push({ Index: index, X: mouseX, Y: char, Delay: 0 })
    listView.Delete()
    for click in mouseClicks {
        listView.Add("", click.Index ", " click.X ", " click.Y ", " click.Delay)
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

    for click in mouseClicks {
        FileAppend(click.Index ", " click.X ", " click.Y ", " click.Delay "`n", filePath)
    }
    MsgBox("Saved script in: " filePath)
    listView.Delete()
}

stopScript(*) {
    global stopRun
    stopRun := true
}

Log(str:="", Keyboard:=0) {
    global LogArr
    static LastTime
    t:=A_TickCount, Delay:=(LastTime ? t-LastTime:0), LastTime:=t
    IfEqual, str,, return
    i:=LogArr.MaxIndex(), r:=LogArr[i]
    if (Keyboard and InStr(r,"Send,") and Delay<1000)
    {
      LogArr[i]:=r . str
      return
    }
    if (Delay>200)
      LogArr.Push("Sleep, " (Delay//2))
    LogArr.Push(Keyboard ? "Send, {Blind}" str : str)
  }

;=================================Run macro==========================
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
                mouseSteps.Push({ Index: Trim(coords[1]), X: +(Trim(coords[2])), Y: +(Trim(coords[3])), Delay: +(Trim(coords[4])) })
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
    global mouseSteps, loopScript, stopRun
    stopRun := false
    if (mouseSteps.Length > 0) {
        Sleep(5000)
        loop {
            for step in mouseSteps {
                UpdateStatusBar(step)
                MouseMove(step.X, step.Y, 100)
                Click
                Sleep(step.Delay)
                if (stopRun) {
                    break
                }
            }
            if (!loopScript) {
                break
            }
        }
    }
}

UpdateStatusBar(value) {
    global SB
    SB.Text := "Current Mouse Position: " value.X ", " value.Y
}

