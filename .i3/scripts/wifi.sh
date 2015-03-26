#!/bin/bash

echo $([[ $(iwgetid -r) == "" ]] && echo "Disconnected" || iwgetid -r)