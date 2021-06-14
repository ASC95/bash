#!/usr/bin/env bash

# - yum is not apt!
#   - Running $ yum update $ actually updates the packages themselves! This is different from $ apt update $ which merely updates the cache
#   - Running $ yum upgrade $ is just like running $ yum update $, except that "upgrade" will also remove obsolete packages