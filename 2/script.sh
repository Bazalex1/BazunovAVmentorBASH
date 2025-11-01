#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Ошибка, нужен 1 аргумент"
    echo "Использование: $0 'имя новой директории'"
    exit 1
fi

new_dir="$1"

echo "$PATH - это текущий PATH"

export PATH="$PATH:$new_dir"

echo "$PATH - это новый PATH"
