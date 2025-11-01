#!/bin/bash

read -p "Введите путь к папке для архивации: " path_to_dir

if [ ! -d "$path_to_dir" ]; then
    echo "Файл не найден"
    exit 1  
fi
name=$(basename"$path_to_dir")

timestamp=$(date +"%d-%m-%Y")

archive="${name}_${timestamp}.tar.gz"

tar -czf "$archive" -C "$(name "$path_to_dir")" "$name"