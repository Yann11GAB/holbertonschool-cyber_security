#!/bin/bash

grep -o 'sshd' $1 | sort | uniq -c | sort -nr
