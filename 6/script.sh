#!/bin/bash


cat input.txt

wc -l < input.txt > output.txt

echo "Проверим, произошел ли вывод команды ws:"

cat output.txt

ls none.txt 2> error.log

echo "Проверим, произошела ли запись ошибки:"

cat error.log
