#!/bin/bash

echo $[100-$(vmstat|tail -1|awk '{print $15}')]%