#!/bin/bash

echo $(df -h | awk '/sda3/ { print $4 }')B