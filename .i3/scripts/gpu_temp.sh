#!/bin/bash

echo $(sensors nouveau-pci-0200 | awk '/temp1/ { print $2 }') | awk -F + '{ print $2 }'