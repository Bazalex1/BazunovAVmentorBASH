#!/bin/bash

read -p "Введите число: " num

echo "$num"

i=1

if [ $num -gt 0 ]; then
    echo "$num - положительное"
    echo "Начинаем отсчет от 1"
    echo

    while [ $i -le $num ]; do
    echo $i
    ((i++))
    done

elif [ $num -eq 0 ]; then
    echo "$num - это ноль"

else
    echo "$num - это отрицательное"
fi