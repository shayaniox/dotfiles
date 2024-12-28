#! /bin/env bash

set -e

sudo apt update
sudo apt upgrade

# Installing the programs
sudo apt install vim \
    vlc \
    virtualbox \
    gimp
