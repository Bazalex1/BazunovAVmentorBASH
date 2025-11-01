#!/bin/bash

# Создадим менеджер бекапов,
if [ $# -ne 1 ]; then
    echo "Ошибка, нужно указать путь к директории"
    echo "Использование: $0 'путь к директории'"
    exit 1
fi

# сначала получим выбранную директорию
select_dir=$1

# создадим папку с бекапами
backups_dir="backups"
mkdir -p "$backups_dir"

# получим время для логов
timestamp=$(date +"%d-%m-%Y")

# сами логи
backup_log="backup.log"

# счетчик для файлов
count=0

# создадим функцию для логирования каждой операции

logging() {
    echo "[$(date '+%H:%M:%S %d-%m-%Y')] $1" >> "$backup_log"
}



logging "Начинаем копирование из папки $1"
mkdir -p "$backups_dir/$1"


# проходимся по файлам
for file in "$1"/*; do
    if [ -f "$file" ]; then
        ((count++))
        name=($basename "$file")
        only_name="${name%.*}"
        extention="${name##*.}" 
        name_with_date="${only_name}_${timestamp}.${extention}"

    cp "$file" "$backups_dir/$name_with_date"
    logging "Скопирован файл $file в $name_with_date"
    fi

done
logging "Копирование завершено, файлов скопировано $count"
echo "Копирование завершено, файлов скопировано $count"