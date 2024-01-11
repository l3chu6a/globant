from flaskext.mysql import MySQL

mysql = MySQL()

def init_mysql(app):
    mysql.init_app(app)
    return

def generate_insert(table: str, columns: tuple) -> str:
    values_tuple = tuple(('%s' for _ in columns))

    values_str = '(' + ','.join(values_tuple) + ')'
    columns_str = '(' + ','.join(columns) + ')'

    query = f'INSERT INTO {table} {columns_str} VALUES {values_str}'

    return query

def save_to_database(data: dict, metadata: dict) -> None:
    # Establish connection to database
    conn = mysql.connect()
    cursor = conn.cursor()

    table = metadata['table']
    columns = tuple(column for column in data.keys())
    values = tuple(value for value in data.values())

    if columns != metadata['columns']:
        raise Exception('File has different columns than expected.')

    query = generate_insert(table, columns)
    cursor.execute(query, values)

    # Commit transaction and close connection.
    conn.commit()
    cursor.close()
    return