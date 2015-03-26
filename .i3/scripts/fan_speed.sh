#!/bin/sh

echo $(sensors applesmc-isa-0300 | awk '/Exhaust/ { print $3 }') RPM