Loop
{
    Process, Exist , notepad.exe
    if ErrorLevel = 0
        Loop, 1 {
            Sleep, 1000
            Run, notepad.exe
        }
}
