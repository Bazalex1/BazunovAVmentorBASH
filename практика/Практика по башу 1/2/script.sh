#!/bin/bash

read -p "Введите путь файла: " path_to_file

if [ -f "$path_to_file" ]; then
    echo "Файл найден"

else
    echo "Файл не найден"
fi