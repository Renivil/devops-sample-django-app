#!/bin/bash

# Ждем, пока база данных будет доступна
./wait-for-it.sh db:5432 --timeout=30 --strict -- echo "Postgres is up"

# Выполнение миграций
python3 manage.py migrate

# Запуск приложения
exec "$@"
