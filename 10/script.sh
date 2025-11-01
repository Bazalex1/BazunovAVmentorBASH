#!/bin/bash

# Создадим менеджер бекапов,
if [ $# -ne 1 ]; then
    echo "Ошибка, нужно указать путь к директории"
    echo "Использование: $0 'путь к директории'"
    exit 1
fi

# сначала получим выбранную директорию
select_dir=$1

# получим время для логов
timestamp=$(date +"%d-%m-%Y")

# логи
log="backup.log"

# счетчик для файлов
count=0

# создадим функцию для логирования каждой операции

logging() {
    echo "[$(date '+%H:%M:%S %d-%m-%Y')] $1" >> "$log"
}



logging "Начинаем сортировку в папке $select_dir"
mkdir -p "$select_dir/Images"
mkdir -p "$select_dir/Documents"
mkdir -p "$select_dir/Other"


# проходимся по файлам
for file in "$select_dir"/*; do
    if [ -f "$file" ]; then
        ((count++))
        name=$(basename "$file")
        extention="${name##*.}" 
        lower_ext="${extention,,}" 
        case "$lower_ext" in
            jpg|png|gif)
                way="$select_dir/Images/$name"
                ;;
            txt|pdf|docx)
                way="$select_dir/Documents/$name"
                ;;
            *)
                way="$select_dir/Other/$name"
                ;;
        esac
        mv "$file" "$way"
        logging "Файл $file, отсортирован в $way"
    fi

done


logging "Сортировка завершена"
echo "Сортировка завершена"


chmod +x script.sh