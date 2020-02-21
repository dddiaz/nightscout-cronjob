# Before you run, make sure you export your nightscout base url and where you want the script to go.
# This is documented in the readme.

# 1) Variable replace the plist file
sed "s+script_dest_replace+$script_dest+g" ./com.dddiaz.nightscoutcron.plist.template > ./com.dddiaz.nightscoutcron.plist

# 2) Variable replace the nightscoutcron.sh file
sed "s+base_url_replace+$base_url+g" ./nightscoutcron.sh.template > ./nightscoutcron.sh


# 3) Show us the files
echo 'Showing plist file...'
cat ./com.dddiaz.nightscoutcron.plist

echo 'Showing cron shell script file...'
cat ./nightscoutcron.sh

# 4) Copy the files to the relevant locations
echo 'Copying files...'
cp ./nightscoutcron.sh $script_dest

# Make sure you set executable bit or your job will fail silently!!!
chmod +x $script_dest

# Job in this folder will only run when logged in and under your user
cp ./com.dddiaz.nightscoutcron.plist $HOME/Library/LaunchAgents
echo 'Copy complete!'

echo 'Register and launching your job!'
# Register your job with launchd
# DEBUG Only:
launchctl unload com.dddiaz.nightscoutcron.plist
launchctl load com.dddiaz.nightscoutcron.plist
echo 'Done! Check out the results at ~/glucose.txt'


###################################################
# TO unload:
# launchctl unload com.dddiaz.nightscoutcron.plist
# after a reboot:
# launchctl unload /Users/ddiaz/Library/LaunchAgents/com.dddiaz.nightscoutcron.plist