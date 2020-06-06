# - https://github.com/blink1073/oct2py/issues/144 - reader.mat issue
# - https://octave.org/doc/v4.2.1/Errors.html - octave error messages
# - https://octave.org/doc/v4.0.1/Manipulating-the-Load-Path.html - octave load path

# - https://octave.org/doc/v4.2.1/Current-Working-Directory.html - octave shell navigation commands
# - https://hackernoon.com/managing-ubuntu-snaps-the-stuff-no-one-tells-you-625dfbe4b26c - linux snaps are f'ing complicated

# Within the Octave interpreter:
# - Execute a .m file: $ <filename without extension>
#   - E.g. $ ieee9bus
#   - The desired .m file must be in octave's path (view it within the interpreter with $ path())
# - Add a path to octave's search path: $ addpath('<absolute path>') 
#   - E.g. $ addpath('/Users/austinchang/repositories/aifbdp-splunk-apps/untopchan/bin')
#   - If octave complains that there is no such file or directory, it doesn't have permission to access whatever path I specified
#       - Fix this by ...
# - Print the current working directory: $ pwd

# snapd
# - A Canonical "snap" is a single compressed file containing the entire file system needed for running a package
#   - These files are never decompressed and installed, but instead are mounted dynamically at run time and exposed to the user as a virtual
#     environment
#       - This is why octave can't appear to find any files in Splunk apps! It's an entirely different file system! AGGHASGHAGDAHSGDASDGHASDG
#       - The only reason $ octave $ works in the terminal is because "/var/lib/snapd/snap/bin" is added to  $PATH
# - Solution:
#   - Octave snaps have access to everything in /home, so that's where files have to go
#       - Home has to be a REAL home, not a symlink or mounted directory or whatever
#   - Once I add files within /home, I have to add the respective directories to octave's path
#   - Octave still tries to write to /tmp, which of course doesn't exist to the Octave virtual file system! What do I do?
#       - Is it doing this because oct2py is within the actual file system?
#   - I give up. This is not worth any more effort. I'm not going to install Python inside of a snapd environment
#       - Where does Octave store reader.mat on its file system? I give up once again

# Octave snapd virtual file system
# - Octave recognized adding this path: "/var/lib/snapd/desktop/applications", therefore everything in those directories is valid  
# - https://askubuntu.com/questions/1177599/how-to-install-python-packages-to-a-running-snap-package - running Python inside of snap?
# - https://askubuntu.com/questions/919091/why-can-snap-files-not-be-modified-in-any-way - it's impossible to change the contents of a snap without
#   rebuilding it. GG GAME OVER