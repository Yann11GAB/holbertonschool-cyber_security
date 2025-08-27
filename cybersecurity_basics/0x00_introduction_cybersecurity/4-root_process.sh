#!/bin/bash
ps -U "$1" -u "$1" u --no-headers | grep -vE '\s0\s+0\s'
