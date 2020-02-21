# nighscout-cronjob

## Goal 
Display blood glucose in terminal (specifically iterm2) without impeding performance.

#### Background
You can set up iterm to display custom commands in your status bar, so in effect you can have it curl your nightscout endpoint for your current bg. 
But this round trip on every call slows downs your terminal expierence.
SO the idea here is to have a cron job, or in this case, systemd job that runs every minute, and writes your current glucose to a file.
Now, all you need to do is cat that file, which is waaaaay faster than a curl.

## Prereqs
Nightscout Website

## How To Install
#### Deploy Cron Job
Open up a shell
Export two variables:
```bash
export base_url='https://<your-url>.herokuapp.com'
export script_dest='<your-path>/nightscoutcron.sh'
```
Run the deploy script
```bash
sh ./deploy.sh
```
Verify its working as expected
```bash
cat ~/glucose.txt
```

# Useful Links
https://alvinalexander.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs