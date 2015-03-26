#!/bin/bash

echo $(sensors coretemp-isa-0000 | awk '/Core 0/ { print $3 }') | awk -F + '{ print $2 }'