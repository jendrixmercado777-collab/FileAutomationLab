# Step 1: Get today's date and go back 7 days
$cutoff = (Get-Date).AddDays(-7)

# Step 2: Find .txt files that were last changed before that date
$oldFiles = Get-ChildItem -Path . -File | Where-Object { $_.Extension -eq ".txt" -and $_.LastWriteTime -lt $cutoff }

# Step 3: Show what was found
Write-Host "Cutoff date: $cutoff"
Write-Host "Number of old files found: $($oldFiles.Count)"
$oldFiles | ForEach-Object { Write-Host "Found: $($_.Name) - $($_.LastWriteTime)" }

# Step 4: Copy the old files to a Backup folder (-WhatIf = test mode, nothing is really copied)
$oldFiles | Copy-Item -Destination ".\Backup" -WhatIf