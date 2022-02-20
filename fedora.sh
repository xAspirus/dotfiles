#!/bin/bash

set -e

cp dnf.conf /etc/dnf/dnf.conf
dnf upgrade
