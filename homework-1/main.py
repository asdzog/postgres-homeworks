"""Скрипт для заполнения данными таблиц в БД Postgres."""
from csv import DictReader
import os
import psycopg2


DB_PSW = os.getenv('DB_USR_PSW')

# подключение к бд
conn = psycopg2.connect(
    host='localhost',
    database='north',
    user='postgres',
    password=DB_PSW)

# открытие курсора для выполнения sql-запросов
cur = conn.cursor()

folder = 'north_data'

# список файлов с таблицами и полями
csv_files = [
    {'file': f'{folder}\customers_data.csv', 'table': 'customers',
     'fields': ['customer_id', 'company_name', 'contact_name']},
    {'file': f'{folder}\employees_data.csv', 'table': 'employees',
     'fields': ['employee_id', 'first_name', 'last_name', 'title', 'birth_date', 'notes']},
    {'file': f'{folder}\orders_data.csv', 'table': 'orders',
     'fields': ['order_id', 'customer_id', 'employee_id', 'order_date', 'ship_city']}
]

for file_info in csv_files:
    csv_file = file_info['file']
    table = file_info['table']
    fields = file_info['fields']

    with open(csv_file, 'r', encoding='utf-8') as file:

        reader = DictReader(file)
        for row in reader:
            # кортеж значений, который соответствует полям таблицы
            values = tuple(row[field] for field in fields)

            # sql-запрос с параметрами для вставки данных в таблицу
            insert_query = f'INSERT INTO {table} ({", ".join(fields)}) VALUES ({", ".join(["%s"] * len(fields))})'
            cur.execute(insert_query, values)

# закрытие курсора и сохранение изменений
cur.close()
conn.commit()

# закрытие соединения с базой данных
conn.close()
