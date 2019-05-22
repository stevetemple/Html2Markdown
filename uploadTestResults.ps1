cd $env:APPVEYOR_BUILD_FOLDER
cd test\Html2Markdown.Test

Write-Host "- About to upload test results"

$wc = New-Object "System.Net.WebClient"

Get-ChildItem -Path *.trx |
Foreach-Object {
    $wc.UploadFile("https://ci.appveyor.com/api/testresults/mstest/$($env:APPVEYOR_JOB_ID)", (Resolve-Path $_.FullName))
}

Write-Host "- Results uploaded"