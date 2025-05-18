import psycopg2

connection = psycopg2.connect("dbname=dbprog user=usuario password=senha123 port=5432")

cursor = connection.cursor()

cursor.execute("""
SELECT * FROM "Papel";
""")
resultado = cursor.fetchall()

print(resultado)