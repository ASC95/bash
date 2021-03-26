- https://github.com/pyenv/pyenv#installation
- https://github.com/pyenv/pyenv-virtualenv
# Introduction
- pyenv doesn't depend on Python, so it belong here.
- pyenv-virtualenv is simply a plugin for pyenv
# Installation
- See source
  - I can clone pyenv wherever I want and pyenv-virtualenv goes inside the plugins/ directory of the pyenv repo
# Workflows
## Install Python version
- `$ pyenv install <python version>`
  - E.g. `$ pyenv install 2.7.8`
## Create virtualenv with particular Python version
- `$ pyenv virtualenv <version> <virtualenv name>`
  - `$ pyenv virtualenv 3.8.3 aifbdp-3.8.3`
## Activate a virtualenv
- There are two ways to do this:
  - `$ pyenv activate <virtualenv name>`
    - E.g. `$ pyenv activate aifbdp-3.8.3`
    - This only works if the two `eval` commands are run
  - ` $ . <virtualenv path>/bin/activate`
    - E.g. `$ . /home/austin/programming/git-managed-tools/pyenv/versions/aifbdp-3.8.3/bin/activate`
    - This is the basic but verbose way
## Deactivate a virtualenv
- `$ . deactivate`
  - If pyenv was used to activate the virtualenv, this approach required
## List virtualenvs
- `$ pyenv virtualenvs`