#!/bin/bash

# dump the brew list and cask list to files
brew list --installed-on-request > brewlist.txt
brew list --casks -1 > brewcasks.txt
