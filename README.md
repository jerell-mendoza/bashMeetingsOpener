# bashMeetingsOpener
Opens your meetings in Icalendar 5 mins before they start!

These are the steps I used to get it working on my mac

1) Download script
2) Create an Automator App, and create a run shell script step
i.e. `sh /Users/jerell.mendoza/Coding/meetingOpener/bashMeetingOpener/main.sh > /dev/null`
3) In your terminal run `crontab -e`
4) Create a cronjob to run every minute during the weekdays `* * * * 1-5 open /Users/jerell.mendoza/Documents/Scripts/meetings_opener.app`
