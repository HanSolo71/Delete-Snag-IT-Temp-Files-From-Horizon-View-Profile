#Location Of The Datastore for Each Profile
$FileLocationDataStore = "\\fileshare\Profiles\*\AppData\Roaming\TechSmith\SnagIt\DataStore\*"

#Location Of The Thumbnails for each profile
$FileLocationThumbnails = "\\fileshare\Profiles\*\AppData\Roaming\TechSmith\SnagIt\SnagIt\Thumbnails\*"

#Set date limit for how long you would like to keep files
$datelimit = (Get-Date).AddDays(-30)

Get-ChildItem $FileLocationDataStore -Force | Where-Object {$_.LastWriteTime -lt $datelimit} | Remove-Item -Include *.snag, *.snagundo -Force -confirm:$false -Recurse
Get-ChildItem $FileLocationThumbnails -Force | Where-Object {$_.LastWriteTime -lt $datelimit} | Remove-Item -Include *.thumb -Force -confirm:$false -Recurse