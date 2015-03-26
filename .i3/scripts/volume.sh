#!/bin/bash

echo $(amixer get Master | egrep -o "[0-9]+%")