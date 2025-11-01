#!/bin/bash

# разрешаем создание алиасов в скрипте
shopt -s expand_aliases
# создаем временный alias

alias ll='ls -la'

# проверяем

ll

# проверяем в списке alias

alias