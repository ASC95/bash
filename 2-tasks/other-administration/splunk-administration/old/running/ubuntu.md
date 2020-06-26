- https://docs.splunk.com/Documentation/Splunk/8.0.4/Installation/InstallonLinux 
# Running
- If I start Splunk with sudo, I have to stop it with sudo
  - If I start Splunk one time with sudo, root will own a bunch of files and that makes it impossible to run Splunk in the future without being sudo!
  - It's the same situation with running `$ sudo su - splunk` and then starting Splunk for the first time
- 

- Just chown everything so that it belongs to me instead of splunk or root. Then everything just works