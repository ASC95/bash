- https://askubuntu.com/questions/34666/what-happened-to-etc-apt-apt-conf - proof that `/etc/apt/apt.conf` was indeed replaced with
  `/etc/apt/apt.conf.d/`
- https://askubuntu.com/questions/196059/how-to-modify-settings-in-apt-conf-file-that-no-longer-exists-in-12-04 - how to make local changes to
  default configuration specified by `/etc/apt/apt.conf.d/`
- http://manpages.ubuntu.com/manpages/focal/en/man5/apt.conf.5.html - `/etc/apt/apt.conf` syntax description for Ubuntu. Sadly, this is the most
  straightforward description of what all of these archaic APT configuration directives mean
- https://kali.training/topic/advanced-apt-configuration-and-usage/ - nice explanation of how files in `/etc/apt/apt.*.d/` are parsed and combined
# Examples
## Understand an apt.conf.d configuration file
### File
#### /etc/apt/apt.conf.d/00aptitude
```
Aptitude::Get-Root-Command "sudo:/usr/bin/sudo";
```
- APT configuration directive syntax is archaic because it is modeled after "what the ISC tools such as bind and dhcp use"
- Sadly, there is _no_ easily accessible documentation about this directive in particular
  - All I can say is that all of the files in `/etc/apt/apt.conf.d/` specify little bits of configuration that determine the behavior of the APT suite
    of tools
# Purpose
## Why use directories in /etc/apt/?
- Historically, the configuration of APT in Debian systems was handled by dedicated configuration files
- In more recent Debian-based distributions, configuration directories that end with ".d" (e.g. `/etc/apt/apt.conf.d/`) are used instead
  - All the files within `/etc/apt/apt.conf.d/` are parsed to logically combine to form the single configuration file `/etc/apt/apt.conf`
  - This directory contains a bunch of different files, the contents of which are logically combined to form the `/etc/apt/app.conf` file, which no
    longer actually exists
  - The man page only says that `/etc/apt/apt.conf` is the main configuration file for the APT suite of tools
# Syntax
## APT configuration directive syntax
```
<Group>[::<Option>...][::] "<value>";
```
- The syntax is actually very permissive (not a good thing)
- E.g. `Acquire::Changelogs::AlwaysOnline "true";`
  - I'm confident this description of  syntax is correct because the man page says that "Acquire" is a group and "Changelogs" is an option
# Parsing
## What is the configuration file parsing precedence?
- APT processes files in `/etc/apt/apt.conf.d/` in alphabetical order, so settings in files with lexicographically-higher filenames take precdence
  over conflicting settings in lexicographically-lower configuration files