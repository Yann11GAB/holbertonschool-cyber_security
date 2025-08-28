#!/bin/bash
last -n 5 | grep -v '^wtmp'
