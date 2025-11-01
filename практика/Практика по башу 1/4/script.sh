#!/bin/bash

file=$1

if [ -f "$file" ]; then
    echo "Строк в файле: $(ws -l < "$name")."