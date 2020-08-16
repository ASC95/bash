- https://help.ubuntu.com/community/Repositories/Ubuntu - Ubuntu repositories descriptions
- https://wiki.debian.org/SourcesList - official description of `/etc/apt/sources.list`
- https://wiki.debian.org/Packaging/SourcePackage?action=show&redirect=SourcePackage - what is a source package, as opposed to a binary package?
- https://kali.training/topic/introduction-to-apt/ - additional explanation of `/etc/apt/sources.list` syntax
# Examples
## Examine `/etc/apt/sources.list`
### Files
#### `/etc/apt/sources.list`
```
deb http://us.archive.ubuntu.com/ubuntu/ focal main restricted
deb http://us.archive.ubuntu.com/ubuntu/ focal-updates main restricted
deb http://us.archive.ubuntu.com/ubuntu/ focal universe
deb http://us.archive.ubuntu.com/ubuntu/ focal-updates universe
deb http://us.archive.ubuntu.com/ubuntu/ focal multiverse
deb http://us.archive.ubuntu.com/ubuntu/ focal-updates multiverse
deb http://us.archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu focal-security main restricted
deb http://security.ubuntu.com/ubuntu focal-security universe
deb http://security.ubuntu.com/ubuntu focal-security multiverse
```
- I don't understand why focal-updates and other distributions have multiple lines with different sections when all of the sections could be written
  on the same line
# Background
## deb vs deb-src lines
- Binary (Debian) packages are contained in *.deb files. A *.deb file is a compressed archive _of_ a software application. It contains binary
  application files, metadata files describing the application, and scripts that enable commands involving the installation, removal, and upgrade of
  the application
  - Thus, a software application is a subset of a binary package and therefore a software application is always bound to a binary package
    - If I were to manually install a software application, I suppose it wouldn't necessarily have to be associated with a binary package, but
      hopefully I never do that because binary package metadata is incredibly useful
- Source (Debian) packages are composed of several files: *.tar.gz, *.dsc, *.debian.tar.gz. Source packages allow me to download the components that
  enable me to compile a package on my system (see source for why this is useful)
  - I will almost never need to bother with source packages unless I'm writing my own Debian packages!
## Ubuntu repository sections
- Main: canonical-supported free and open-source software
- Universe: community-maintained free and open-source software
- Restricted: proprietary drivers for devices
- Multiverse: software that is restricted by copyright or legal issues
### FTP servers
- Ubuntu repositories are hosted with FTP servers but that's not dangerous/insecure because ... ???
# Purpose
- `/etc/apt/sources.list` lists the official repositories that publish Ubuntu packages
- When `apt` looks for a package to download and install, it checks these repositories _and_ considers the priorities specified in
  `/etc/apt/preferences.d/` to determine exactly which package to download and install
  - It will also check the repositories defined in `/etc/apt/sources.list.d/`, which is where I should specify additional repositories that I want apt
    to query when searching for packages
    - See "apt-vendor-deb-use-case.png"
# Syntax
- `<source type> <URL> <distribution> [' '<section>...]`
  - E.g. for `deb http://us.archive.ubuntu.com/ubuntu/ focal main restricted`:
    - \<source type> == deb
    - \<URL> == http://us.archive.ubuntu.com/ubuntu/
    - \<distribution> == focal
    - \<section 1> == main
    - \<section 2> == restricted
- I believe that this BNF is correct because when I go the the URL, I can navigate through an FTP server and the filesystem hierarchy matches the
  entries in `/etc/apt/sources.list`
- See multiarch notes for microarchitecture directives