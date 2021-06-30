- https://opensource.com/article/17/11/how-use-cron-linux - excellent general introduction to cron jobs and crontab
- https://www.computerhope.com/unix/ucrontab.htm - more detailed introduction to crontab, including non-exhuastive list of Linux OS differences
- https://stackoverflow.com/questions/22203120/cronjob-entry-in-crontab-e-vs-etc-crontab-which-one-is-better - `crontab` behavior (relevant in macOS)
  and different crontab files (relevant in Linux)
- https://askubuntu.com/questions/23009/why-crontab-scripts-are-not-working - crontab troubleshooting
- https://apple.stackexchange.com/questions/266835/how-do-i-restart-the-cron-service-on-osx - manually restart cron in macOS
- https://stackoverflow.com/questions/32781884/is-crontab-broken-on-osx-el-capitan - macOS cron job quirks
# Introduction
- All of these notes are for macOS __only__
- cron is actually implemented as a launchd daemon in macOS. Thus, "cron" doesn't really exist in macOS. launchd is doing everything (I think)
  - My investigation seems to confirm this
    - When I examine `/usr/sbin/cron` on macOS, some of the output looks like the XML format of a launchd agent
    - When I examine `/<whatever>/crond` on Linux, the output looks like that of a regular binary
- The specifics of cron jobs vary _significantly_ depending on the OS
# User crontab example
## Files
### /private/var/at/tabs/austinchang
```
# DO NOT EDIT THIS FILE - edit the master and reinstall.
# (/tmp/crontab.RQrgbyUnwz installed on Thu May  7 22:02:13 2020)
# (Cron version -- $FreeBSD: src/usr.sbin/cron/crontab/crontab.c,v 1.24 2006/09/03 17:52:19 ru Exp $)

* * * * * date >> ~/cronlog.log 2>&1 && echo "Hi there $(whoami) from /private/var/at/tabs/austinchang" >> ~/cronlog.log 2>&1
* * * * * date >> ~/cronlog.log 2>&1 && echo "Goodbye there $(whoami) from /private/var/at/tabs/austinchang" >> ~/cronlog.log 2>&1
* * * * * env > ~/inspect-env.log
<THIS NEWLINE IS ESSENTIAL>
```
- I never should directly edit this file, and macOS won't even let me directly edit it unless I change some permissions
- These cron jobs are always run as "austinchang"
- macOS user crontab files don't recognize the username argument that the Linux system-wide `/etc/crontab/` file is supposed to recognize
  - If I want to run a cron job as root, I really should be using launchd directly. cron on macOS looks like a nerfed convenience script
    - I can also just perform `$ crontab -e` as the super user
      - Even after editing `/private/var/at/tabs/root`, the cron jobs defined inside don't run!!!
### /Users/austinchang/inspect.env.log
```
SHELL=/bin/sh
USER=austinchang
PATH=/usr/bin:/bin
PWD=/Users/austinchang
SHLVL=1
HOME=/Users/austinchang
LOGNAME=austinchang
_=/usr/bin/env
```
- In macOS, cron automatically has access to the following above environment variables
- Thus, they don't need to be explicitly set in the crontab file
# Syntax
- If any of the following syntax rules are violated, the cron jobs defined in the crontab file won't run:
  - The crontab doesn't end with a newline (yes, insane)
  - Environment variables are incorrectly set so that expected binaries are not visible to the cron jobs
    - Inspect the environment variables by writing a cron job like `* * * * * env > ~/inspect-env.log`
- Fortunately, the `$ crontab -e` command validates the syntax of the crontab file before saving
# Files
- macOS appears to ignore `/etc/crontab` entirely
  - This is the "system" crontab file in Linux apparently
- macOS only appears to read cron jobs from user crontab files located at `/private/var/at/tabs/<username>`
  - Fortunately, macOS does reload changes from these files as soon as they are saved. There is no need to manually restart cron
## Editing crontab files
- In macOS, the only way I should ever edit my user crontab file is with `$ crontab -e`
  - This command opens an editor that allows me to edit `/private/var/at/tabs/<username>` and supposedly restarts the crond daemon when the editor
    saves and exits
    - I'm not sure if I'm directly editing this file or not because macOS is weird, but it's effectively what I'm doing
- I could edit my user crontab file manually after changing some permissions, and "crond daemon" will automatically detect any changes and apply them,
  but just use the command instead
### Manually edit a crontab file
- If I manually edit a crontab file, cron is _supposed_ to automatically restart because it automatically checks the modification times of all crontab
  files
- After editing the crontab file, I can _manually_ restart the crond daemon with `$ sudo pkill -f cron`
  - The LaunchDaemon has a keepalive section that will immediately restart the daemon after it is killed
- I should never need to do this