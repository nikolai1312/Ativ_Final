import psycopg2

connection = psycopg2.connect("dbname=dbprog user=usuario password=senha123 port=5432")

cursor = connection.cursor()

cursor.execute("""
SELECT * FROM "Papel";
""")
resultado = cursor.fetchall()

print(resultado)

def menu():
    print("-----------------------------------------------------------------------")
    print("MENU DE LOGIN")
    print("-----------------------------------------------------------------------")
    opcao = input("SELECIONE UMA OPÇÃO\n1 - LOGIN\n2 - FAZER CADASTRO\n3 - SAIR")
    match opcao:
        case "1":
            print("OI") 

        case "2":
            print("OI") 

        case "3":
            print("OI") 

        case _:
            print("OI") 
    