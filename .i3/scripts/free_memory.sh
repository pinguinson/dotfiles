#!/bin/bash

echo $(free -m | awk '/Mem/ {print $3 }')MB