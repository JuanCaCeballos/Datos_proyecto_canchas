import mysql.connector
import datetime

conexion = mysql.connector.connect(user='root', password='1234', 
                                   host= 'localhost',
                                   database= 'canchas_deportivas',
                                   port = '3306',
                                   auth_plugin='mysql_native_password')


def mostrar_menu():
    print("\n Menú de Administracion de Canchas \n")
    print("1. Consultar disponibilidad de canchas")
    print("2. Consultar Usuario")
    print("3. Realizar Reserva de canchas")
    print("4. Registrar Usuario")
    print("5. Salir \n")



def iniciar():
    print("Bienvenido al sistema de gestión de canchas deportivas")
    while True:
        mostrar_menu()
        opcion = input("Seleccione una opción (1-5): ")

        if opcion == "1":
            Consultar_disponibilidad()
            
        elif opcion == "2":
            Consultar_usuario()
            
        elif opcion == "3":
            Realizar_reserva()
            
        elif opcion == "4":
            Registrar_usuario()
            
        elif opcion == "5":
            print("¡Hasta luego!")
            break
        else:
            print("\n Opción inválida. Por favor, seleccione una opción válida. \n")

def print_deportes():
    cursor = conexion.cursor()
    sql = 'select distinct TipoDeporte  from canchas c'
    cursor.execute(sql)
    data = cursor.fetchall()
    print("Deportes disponibles")
    for x in data:
        print(x[0])

def Consultar_disponibilidad():
    print_deportes()
    deporte = input("escriba el deporte ")  
    fecha = input("ingrese la fecha a reservar ejemplo año-mes-día ")
    cursor = conexion.cursor()
    sql = f"select ta.ID_Horario_Cancha, ta.NombreCancha, ta.Horario from(select c.ID_Cancha, c.NombreCancha, concat(h.HoraInicio,'-', h.HoraFin) as Horario,hc.ID_Horario_Cancha, r.Estado_Reserva, c.TipoDeporte from canchas c inner join horarios_canchas hc on c.ID_Cancha = hc.ID_Cancha inner join horarios h on hc.ID_Horario  = h.ID_Horario left join reservas r on hc.ID_Horario_Cancha = r.ID_Horario_Cancha where isnull(r.Estado_Reserva) or r.Estado_Reserva = 2 or isnull(r.Fecha) or r.Fecha <> '{fecha}') as ta where ta.TipoDeporte = '{deporte}'"
    cursor.execute(sql)
    data = cursor.fetchall()
    print("Horarios Disponibles")
    for x in data:
        print(f"Id: {x[0]}, Cancha: {x[1]}, Horario: {x[2]}")
    print("\n Para realizar la reserva tener presente el identificador del horario \n")

def Consultar_usuario():
    entrada = input ("\n ingrese el numero de idUsuario de usuario: ")
    cedula = int(entrada)
    cursor = conexion.cursor()
    sql = f'select ID_Usuario , Cedula, Nombre , Apellido  from usuarios u where Cedula = {cedula}'
    cursor.execute(sql)
    data = cursor.fetchall()
    for x in data:
        print(f"Id: {x[0]}, Cedula: {x[1]}, Nombre: {x[2]}, Apellido: {x[3]},")
    print("\n Para realizar la reserva tener presente el identificador del Usuario. \n")

def Realizar_reserva():
    idUsuario = int(input ("ingrese el ID del usuario: "))
    idHorario = int(input ("ingrese el ID del horario: "))
    fecha = input ("ingrese la fecha a reservar ejemplo año-mes-día ")
    cursor = conexion.cursor()
    result_args = cursor.callproc('SP_Alquiler', (idUsuario, idHorario, fecha, ""))
    print(f"\n {result_args[3]} \n")

def Registrar_usuario():
    cedula = int(input ("ingrese la cedula del usuario: "))
    nombre = input ("ingrese el nombre del usuario: ")
    apellido = input ("ingrese el apellido del usuario: ")
    correo = input ("ingrese el correo del usuario: ")
    rolCliente = "CLIENTE"
    cursor = conexion.cursor()
    sql = f'INSERT INTO canchas_deportivas.usuarios (Cedula, Nombre, Apellido, Email, RolUsuario) VALUES (%s, %s, %s, %s, %s)'
    values = (cedula, nombre, apellido, correo, rolCliente)
    cursor.execute(sql, values)
    conexion.commit()
    print("\n Registro realizado con exito. \n")
 

iniciar()