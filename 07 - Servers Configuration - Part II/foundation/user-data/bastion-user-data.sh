#!/bin/bash
set -xv
echo 'export PS1="(${platform}-bastion) $PS1"' >> /etc/bashrc
