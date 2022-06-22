create database muebleria;

use muebleria; 

create table USUARIOS (
    USU_ID int not null auto_increment,
    USU_NOMBRE varchar(50) not null,
    USU_APELLIDO varchar(50) not null,
    USU_EMAIL varchar(50) not null,
    USU_PASSWORD varchar(50) not null,
    primary key (USU_ID)
);

create table TIPOS_PRODUCTOS (
    TP_ID int not null auto_increment,
    TP_CATEGORIA varchar(50) not null,
    TP_MODELO varchar(50) not null,
    primary key (TP_ID)
);

create table PROVEEDORES (
    PVD_ID int not null auto_increment,
    PVD_NOMBRE varchar(50) not null,
    PVD_ITEMS varchar(100) not null,
    PVD_STOCK int not null,
    primary key (PVD_ID)
);

create table PRODUCTOS (
    PRO_ID int not null auto_increment,
    PRO_NOMBRE varchar(50) not null,
    PRO_PRECIO int not null,
    PRO_TP_ID int not null,
    PRO_PVD_ID int not null,
    primary key (PRO_ID),
    FOREIGN KEY (PRO_TP_ID) REFERENCES TIPOS_PRODUCTOS(TP_ID),
    FOREIGN KEY (PRO_PVD_ID) REFERENCES PROVEEDORES(PVD_ID)
);

create table VENDEDORES (
VND_ID int not null auto_increment,
VND_NOMBRE varchar(50) not null,
VND_APELLIDO varchar(50) not null,
primary key(VND_ID)
);

create table VENTAS (
    VEN_ID int not null auto_increment,
    VEN_DATE date not null,
    VEN_USU_ID int not null,
    VEN_PRO_ID int not null,
    VEN_VND_ID int not null,
    primary key (VEN_ID),
    FOREIGN KEY (VEN_USU_ID) REFERENCES USUARIOS(USU_ID),
    FOREIGN KEY (VEN_PRO_ID) REFERENCES PRODUCTOS(PRO_ID),
    FOREIGN KEY (VEN_VND_ID) REFERENCES VENDEDORES(VND_ID)
);