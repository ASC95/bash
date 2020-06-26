- https://docs.splunk.com/Documentation/Splunk/8.0.4/Installation/InstallonLinux
- https://community.splunk.com/t5/Security/Splunk-User-is-Created-automatically-when-i-done-a-splunk/td-p/46123
# Why does Splunk create a new "splunk" user?
- Splunk packaged their Debian archive to create a new user, "splunk", when the archive is installed
  - Splunk did this to try to ensure that Splunk won't be run as "root", which would be dangerous
  - However, it's annoying to have a separate "splunk" user on my system
    - But is it really better to chown -R austin:austin and run Splunk that way?


# Installing
- I have to install splunk with apt/dpkg as root. I don't have a choice