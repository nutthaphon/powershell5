$no_version = $(ls D:\Backup\spbr???? | Measure-Object -Line | Select-Object -Property Lines)
If ($no_version.Lines -gt 10) {
    'Your backup set more than 10 versions, the oldest will be deleted.'
    ls D:\Backup\spbr???? | Sort LastWriteTime | Select-Object -Last 1 | rm -Recurse -WhatIf
}