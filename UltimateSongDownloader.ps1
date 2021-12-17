# This script works only with mezzoforte.ru!
# Script will help you downlaod all your favorite artist's albums much faster than doing it manually.

$MyPath = "C:\Users\User\Downloads\TheBeatles"
$LinkDownloadFrom = "https://mezzoforte.ru/al/the_beatles.html"
function CheckSong($currentSongPath, $Album, $Song) {
    IF (Test-Path $currentSongPath) {
        If ((Get-Item $currentSongPath).length -gt 0kb) {
            Write-Host " OK!" -fore Green
        }
        Else {
            $global:BrokenCount ++
            Add-Content -Path "$MyPath\BrokenSongs.txt" -Exclude help* -Value "$album-$song $currentSongPath"
            Write-host " ITS BROKEN!" -fore Red
            
        }
    }
}
function TrimClean($from) {
    $fromTrim = $from -creplace '[^/]*/', ''
    $fromRep = $fromTrim.Replace('_', ' ')
    $fromRep = $fromRep.Replace('-', ' ')
    $Trimmed = $fromRep.Substring(0, $fromRep.Length - 4)
    return $Trimmed
}

$BrokenCount = 0
$TotalCount = 0

$sw = [Diagnostics.Stopwatch]::StartNew()
New-Item -Path $MyPath -ItemType "file" -Name 'BrokenSongs.txt'

$response = Invoke-WebRequest -Uri $LinkDownloadFrom -Method GET
$albumData = $response.links | where { $_.class -eq 'link_to_album' } | Select-Object href

foreach ($albumItem in $albumData) {
    $trimmedAlbum = $albumItem -creplace '^[^=]*=', ''
    $trimmedAlbum = $trimmedAlbum.Substring(0, $trimmedAlbum.Length - 1)
    $Link = "https://mezzoforte.ru" + $trimmedAlbum
    $albumName = TrimClean($Link)
    Write-Host ALBUM:   $albumName
    $response = Invoke-WebRequest -Uri $Link -Method GET
    $songData = $response.links | where { $_.class -eq 'download_link_in_list' } | Select-Object href
    New-Item -Path "$MyPath\$albumName" -ItemType "directory"
    foreach ($songItem in $songData) {
        $trimmedSong = $songItem -creplace '^[^=]*=', ''
        $trimmedSong = $trimmedSong.Substring(0, $trimmedSong.Length - 5)
        $songLink = "https://mezzoforte.ru" + $trimmedSong + "mp3"
        $songName = TrimClean($songLink)
        Write-Host SONG: $songName -nonewline
        $Path = "$MyPath\$albumName\$songName.mp3"
        $wc = New-Object System.Net.WebClient
        $wc.DownloadFile($songLink, $Path)
        $TotalCount ++
        CheckSong $Path $albumName $songName
    }
}
$sw.Stop()
$seconds = $sw.Elapsed.Seconds % 60
$minutes = $sw.Elapsed.Minutes

write-host "Total amount of songs:  $TotalCount" -fore Green
write-host "Amount of broken songs:  $BrokenCount" -fore Red
write-host "Time elapsed: $minutes Min $seconds Sec"
write-host "DONE!" -fore Blue -NoNewline;