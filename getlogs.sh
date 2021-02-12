#!/bin/bash

# Check if time period argument exists and set a default if not
if [ -z "$1" ]; then
	t=1h
else
	t=$1
fi

# Set default export folder and date format appended to files
d=$(date "+%Y-%m-%d_%H.%M")
f=~/Desktop/Sketch_Logs_$d

# Say hello :)
echo ""
echo "  Let’s get them 💎 logs"
echo ""
sleep 1s

# Create folder where all will be exported
echo "  Creating folder on Desktop…"
mkdir -p "$f"
wait

# Get the Sketch Collaboration log from the system/console log
echo "  Copying Collaboration logs…"
log show --last $t --predicate '(subsystem == "com.bohemiancoding.sketch3.xcode") && (category == "collaboration")' --info >"$f/Collab-$d.log"
wait

# Get the Sketch logs from the system/console log
echo "  Copying Console logs…"
log show --last $t --predicate 'processImagePath CONTAINS[c] "Sketch"' --info >"$f/Console-$d.log"
wait

# Find and get all the Sketch crash logs within the given period
echo "  Copying Crash logs…"
find ~/Library/Logs/DiagnosticReports -mtime -$t -iname "*sketch*.crash" -exec cp {} "$f" \;
wait

# Copy installed Sketch plugins list
echo "  Copying Plugins list…"
cp ~/Library/Application\ Support/com.bohemiancoding.sketch3/crash.environment.log "$f/plugins.json"
wait

# Copy Sketch preferences
echo "  Copying Sketch preferences…"
find ~/Library/Preferences -mtime -$t -iname "*sketch3*.plist" -exec cp {} "$f" \;
wait

# Get some basic OS/CPU/GPU info
echo "  Copying anonymous system info…"
system_profiler -detaillevel mini SPDisplaysDataType SPHardwareDataType SPSoftwareDataType >"$f/system_info.txt"
wait

# Zip it
echo ""
echo "  Zipping it all up…"
zip -r -X -dd -j -q "$f.zip" "$f"
wait

# Delete the folder
echo "  Cleaning up…"
rm -rf "$f"
wait

echo ""
echo "  All done! 🎉"
echo "  Please send back the Sketch Logs zip file."
echo ""

# Reveal the zip file in Finder
open -R "$f.zip"
