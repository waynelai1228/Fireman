# This script is written with reference to
# https://blog.jourdant.me/post/3-ways-to-download-files-with-powershell
$url = "http://live.sysinternals.com/tcpview.exe"
$output = "$PSScriptRoot\tcpview.exe"
$start_time = Get-Date

$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
#OR
(New-Object System.Net.WebClient).DownloadFile($url, $output)

Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"