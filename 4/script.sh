#!/bin/bash

hello_greeting() {
    message="$1"
    echo "Hello, $message"
}
sum_nums() {
    num1="$1"
    num2="$2"
    sum=$((num1+num2))
    echo "$sum"
}


# Проверяем работу функций

echo "Проверяем работу функций"

hello_greeting "world"

sum_nums "2" "5"