#!/bin/bash
tr -dc '[:alnum:]' </dev/urandom | fold -w "${1:-16}" | head -n 1
