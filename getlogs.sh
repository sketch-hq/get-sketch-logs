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
mkdir -p $f &
echo "  Creating folder on Desktop…"
wait

# Get the Sketch Collaboration log from the system/console log
log show --last $t --predicate '(subsystem == "com.bohemiancoding.sketch3.xcode") && (category == "collaboration")' --info >$f/Collab-$d.log &
echo "  Copying Collaboration logs…"
wait

# Get the Sketch logs from the system/console log
log show --last $t --predicate 'processImagePath CONTAINS[c] "Sketch"' --info >$f/Console-$d.log &
echo "  Copying Console logs…"
wait

# Find and get all the Sketch crash logs within the given period
find ~/Library/Logs/DiagnosticReports -mtime -$t -iname "*sketch*.crash" -exec cp {} $f \; &
echo "  Copying Crash logs…"
wait

# Copy installed Sketch plugins list
cp ~/Library/Application\ Support/com.bohemiancoding.sketch3/crash.environment.log $f/plugins.json &
echo "  Copying Plugins list…"
wait

# Copy Sketch preferences
find ~/Library/Preferences -mtime -$t -iname "*sketch3*.plist" -exec cp {} $f \; &
echo "  Copying Sketch preferences…"
wait

# Get some basic OS/CPU/GPU info
system_profiler -detaillevel mini SPDisplaysDataType SPHardwareDataType SPSoftwareDataType >$f/system_info.txt &
echo "  Copying anonymous system info…"
wait

# Zip it
cd $f
zip -r -X -dd -q $f.zip * &
echo ""
echo "  Zipping it all up…"
wait

# Delete the folder
rm -rf $f &
echo "  Cleaning up…"
wait

echo ""
echo "  All done! 🎉"
echo "  Please send back the Sketch Logs zip file."
echo ""

# Reveal the zip file in Finder
open -R $f.zip
