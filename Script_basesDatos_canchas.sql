/*************************Creación de la base de datos*********************/
create database canchas_deportivas;

/*************************Creacion de las tablas***************************/

/*Tabla Usuarios*/
use canchas_deportivas;
create table Usuarios (
ID_Usuario INT  NOT NULL PRIMARY KEY, 
Cedula INT , 
Nombre VARCHAR (50), 
Apellido VARCHAR (50), 
Email VARCHAR (50), 
Contraseña INT (10),
RolUsuario VARCHAR (10) 
);

/*Tabla Canchas*/
use canchas_deportivas;
create table canchas (
ID_Cancha INT NOT NULL PRIMARY KEY, 
ID_Usuario INT, 
NombreCancha VARCHAR (50),
Ubicacion VARCHAR (50),
TipoDeporte VARCHAR (50),
Caracteristicas VARCHAR (50),
Disponibilidad DATETIME, 
FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario)
); 

/*Tabla reservas*/ 

use canchas_deportivas;
create table Reservas (
ID_reserva INT NOT NULL PRIMARY KEY, 
ID_usuario INT, 
ID_cancha INT, 
FechaHoraInicio DATETIME, 
FechaHoraFin DATETIME, 
Estado_Reserva boolean,  
Precio decimal,
FOREIGN KEY (ID_usuario) REFERENCES Usuarios(ID_Usuario),
FOREIGN KEY (ID_cancha) REFERENCES canchas(ID_cancha)
);

/*Tabla Horarios*/
use canchas_deportivas;
create table Horarios (
ID_Horario INT  NOT NULL PRIMARY KEY, 
ID_Cancha INT, 
Fecha DATE, 
HoraInicio TIME,
HoraFin TIME, 
Estado BOOLEAN,
FOREIGN KEY (ID_Cancha) REFERENCES CANCHAS(ID_Cancha)); 

 /*Tabla Alquiler canchas*/
use canchas_deportivas;
create table AlquilerCanchas (
Codigo_reserva INT NOT NULL PRIMARY KEY, 
ID_Usuario INT, 
ID_cancha INT, 
FOREIGN KEY (ID_Usuario)REFERENCES usuarios(ID_Usuarios));

/*****************Inserción de datos**************************/
use canchas_deportivas; 
insert into Usuarios (ID_Usuario,Cedula,Nombre,Apellido,Email,Contraseña,RolUsuario)
VALUES 
(11,101378922,'JUAN','CEBALLOS','juancamiloceballos20@gmail.com',1234,'CLIENTE') ,
(22,234567890,'CARLOS','CANTOR','carloscantor40@gmail.com',5678,'CLIENTE') ,
(33,1013789224,'SEBASTIAN','AREVALO','sebastianarevalo@gmail.com',9012,'CLIENTE'); 

use canchas_deportivas; 
insert into Canchas (ID_Cancha,ID_Usuario ,NombreCancha, Ubicacion , TipoDeporte, Caracteristicas , Disponibilidad )
VALUES 
(1,11,'CANCHA1','ZONA1','FUTBOL','PEQUEÑA','2024-05-15 15:30:00') ,
(2,22,'CANCHA2','ZONA2','BALONCESTO','MEDIANA','2024-05-15 15:30:00') ,
(3,33,'CANCHA3','ZONA3','VOLEIBOL','GRANDE','2024-05-15 15:30:00'); 

use canchas_deportivas; 
insert into Reservas (ID_reserva,ID_Usuario ,ID_cancha, FechaHoraInicio , FechaHoraFin, Estado_Reserva, Precio)
VALUES 
(111,11,1,'2024-05-15 12:30:00','2024-05-15 13:30:00',1,200000.0) ,
(222,22,2,'2024-05-15 12:30:00','2024-05-15 13:30:00',1,100000.0) ,
(333,33,3,'2024-05-15 12:30:00','2024-05-15 13:30:00',1,300000.0); 

use canchas_deportivas; 
insert into Horarios (ID_horario,ID_Cancha ,Fecha , HoraInicio , HoraFin , Estado)
VALUES 
(10,1,'2024-05-15','12:30:00','13:30:00',1) ,
(20,2,'2024-05-15', '12:30:00','13:30:00',1) ,
(30,3,'2024-05-15', '12:30:00','13:30:00',1); 

use canchas_deportivas; 
insert into alquilercanchas (Codigo_reserva,ID_Usuario,ID_cancha )
VALUES 
(444,11,1) ,
(555,22,2) ,
(666,33,3); 



















 














 
