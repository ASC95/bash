- https://askubuntu.com/questions/131397/what-is-a-repository-key-under-ubuntu-and-how-do-they-work - shorter summary of secure apt (not very helpful
  tbh)
- https://wiki.debian.org/SecureApt - describes secure apt in detail
- https://wiki.debian.org/DebianRepository/Format - gory details of Debian archive formatting, including formatting shown in `/etc/apt/sources.list`
# Examples
## Client-side
### Show stored gpg keys
#### Command
```
$ apt-key list
```
- This command is required because `trusted.gpg` and files in `/etc/apt/trusted.gpg.d/` are not readable text files
## Server-side
### Examine Ubuntu archive contents
#### Files (FTP server http://ftp.archive.ubuntu.com)
##### `/ubuntu/dists/focal/`
```
InRelease
Release
Release.gpg
```
- InRelease: same as the "Release" file, but it's signed inline
- Release: contains header metadata and one MD5 hash per package-related file in subdirectories of the FTP server
  - Most of the files in the archive are "Packages" or "Packages.gz" or "Package.xz" files. There are others, but they aren't as important in this
    context
- Release.gpg: signs the "Release" file
##### `/ubuntu/dists/focal/main/binary-amd64/Packages.gz`
```
Package: accountsservice
Architecture: amd64
Version: 0.6.55-0ubuntu11
Priority: standard
Section: gnome
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian freedesktop.org maintainers <pkg-freedesktop-maintainers@lists.alioth.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 452
Depends: dbus, libaccountsservice0 (= 0.6.55-0ubuntu11), libc6 (>= 2.4), libglib2.0-0 (>= 2.44), libpolkit-gobject-1-0 (>= 0.99)
Suggests: gnome-control-center
Filename: pool/main/a/accountsservice/accountsservice_0.6.55-0ubuntu11_amd64.deb
Size: 60940
MD5sum: 87a0e27c83950d864d901ceca0f2b49c
SHA1: ce92ea3783ca4ca6cdb5115381379f9c1317566b
SHA256: e34884d71bb98002bf0c775479aa31ee5011ded1abf969ffe6496874de499f42
Homepage: https://www.freedesktop.org/wiki/Software/AccountsService/
Description: query and manipulate user account information
Task: standard
Description-md5: 8aeed0a03c7cd494f0c4b8d977483d7e
```
- This package is one of hundreds that are defined in _this_ "Packages" file
- This package has several hashes that represent its contents
# Debian vs. Ubuntu
- I use Debian and Ubuntu interchangably here because as far as I can tell they are the same when it comes to secure apt
# How does public key cryptography work?
- Public key cryptography can do two things:
  - A public key can encrypt a message so that only the possessor of the private key can decrypt and understand it
  - A private key can sign a message so that anyone with the public key can verify that it was sent by the possessor of the private key
# Secure apt
- Debian implements public key cryptography through a workflow called "secure apt"
- "Secure apt" is merely a term that encompasses 1) using the `apt-key` command on the client to manage a keyring of gpg keys 2) securely storing and
  distributing packages from Debian archives by following Debian archive file formatting and content rules
  - Within `apt-key`, GNU privacy guard (gpg) is tool that is used to sign files _and_ check their signatures
## How is secure apt implemented?
### Server-side
#### Verifying a "Packages" file and individual packages
- At the top level of every distribution directory in the Ubuntu FTP server (e.g. `/ubuntu/dists/focal/`), there is a "Release" file
  - This file contains some header metadata and a long list of MD5 hashes, where each hash is associated with a file that exists in a subdirectory of
    the distribution directory
    - In particular, I care about the "Packages", "Packages.gz", and "Packages.xz" files and their associated hashes, although there are other files
- Each "Packages" file (there are many!) contains metadata for each individual package that is available for the associated distribution +
  microarchitecture 
- apt verifies the "Packages" file by ensuring that its calculated has matches the hash declared in the "Release" file
- Once apt verifies the "Packages" file, it then verifies each individual downloaded package by ensuring its calculated hash matches the hash declared
  in the "Packages" file 
#### Verifying the "Release" file
- The above system works great if the Release file is known to be valid, but how can I know for sure?
- apt ensures the "Release" file is valid by checking the signature of the "Release" file by checking "Release.gpg", which signs the "Release" file
  itself
  - In order to check "Release.gpg", apt must know the public key connected to private key that signed "Release.gpg"
    - apt checks for a matching public key in `/etc/apt/trusted.gpg` and `/etc/apt/trusted.gpg.d/`
      - Ubuntu comes with a few verified keys when it is installed, but keys associated with other repositories must be added with `apt-key`
#### Getting gpg keys
- The "debian-archive-keyring" package is used to distribute keys to apt
  - Changes to this package can add/remove gpg keys for the main Debian archive
- There is no other standard way of getting the correct public key for other archives
  - Some archives list their public key in an HTML page
- gpg has its own way of distributing public keys using a keyserver from which keys can be downloaded and stored (see source)
  - Such a downloaded key must be imported into `apt-key` (see source)
### Client-side
- The keyring of `apt-key` is stored at `/etc/apt/trusted.gpg`
  - In more recent releases, the keys are stored in separate files in the `/etc/apt/trusted.gpg.d/` directory
- `apt-key` can add, remove, and show the gpg keys stored in the keyring