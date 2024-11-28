CREATE DATABASE dynamis;
USE dynamis;
CREATE TABLE clientes(
id INT NOT NULL primary key auoto_increment,
nombre VARCHAR(50),
a_paterno VARCHAR(50),
a_materno VARCHAR(50),
documento VARCHAR(50),
razon_social varchar(50),
nit char(12),
email VARCHAR(255),
telefono char(15),
direccion VARCHAR(255) NOT NULL,
fecha_nacimiento date,
fecha_reg timestamp default current_timestamp not null,
fecha_edit timestamp default current_timestamp on update current_timestamp not null,
estado tinyint NOT NULL DEFAULT 1
)
CREATE TABLE proveedores(
idProveedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
a_paterno VARCHAR(50),
a_materno VARCHAR(50),
documento VARCHAR(50),
razon_social varchar(50),
nit char(12),
email VARCHAR(255),
telefono char(15),
direccion VARCHAR(255) NOT NULL,
fecha_reg timestamp default current_timestamp not null,
fecha_edit timestamp default current_timestamp on update current_timestamp not null,
estado tinyint NOT NULL DEFAULT 1
)
CREATE TABLE usuarios(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
a_paterno VARCHAR(50),
a_materno VARCHAR(50),
ci VARCHAR(20) NOT NULL,
usuario VARCHAR(50) NOT NULL,
password VARCHAR(200) NOT NULL,
perfil VARCHAR(20) NOT NULL,
foto varchar(255),
estado INT NOT NULL DEFAULT 1,
ultimo_login datetime NOT NULL,
fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)
CREATE TABLE categorias(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  categoria varchar(20) not null,
  fecha_reg timestamp default current_timestamp not null,
  fecha_edit timestamp default current_timestamp on update current_timestamp not null,
  estado INT NOT NULL DEFAULT 1
)
CREATE TABLE productos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_categoria int not null,
  codigo int not null,
  descripcion varchar(255) not null,
  marca varchar(50) not null,   
  stock INT NOT NULL,
  precio_compra FLOAT NOT NULL,
  precio_venta FLOAT NOT NULL,
  imagen varchar(255), 
  fecha_reg timestamp default current_timestamp not null,
  fecha_edit timestamp default current_timestamp on update current_timestamp not null,
  estado INT NOT NULL DEFAULT 1,
  FOREIGN KEY(id_categoria) REFERENCES categorias(id)
)

CREATE TABLE ventas(
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo INT NOT NULL,
  id_cliente INT NOT NULL,
  id_vendedor INT NOT NULL, 
  total float not null,
  metodo_pago varchar(50),
  fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  estado tinyint NOT NULL DEFAULT 1,
  FOREIGN KEY(id_cliente) REFERENCES clientes(id),
  FOREIGN KEY(id_vendedor) REFERENCES usuarios(id)
)

CREATE TABLE detalleventa(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad_venta int not null,
  precio_venta float not null,
  FOREIGN KEY(id_venta) REFERENCES ventas(id),
  FOREIGN KEY(id_producto) REFERENCES productos(id)
)
CREATE TABLE compras(
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo INT NOT NULL,
  id_proveedor INT NOT NULL,
  id_vendedor INT NOT NULL, 
  total float not null,
  metodo_pago varchar(50),
  fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  estado tinyint NOT NULL DEFAULT 1,
  FOREIGN KEY(id_proveedor) REFERENCES proveedores(idProveedores),
  FOREIGN KEY(id_vendedor) REFERENCES usuarios(id)
)
CREATE TABLE detallecompra(
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_compra INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad_venta int not null,
  precio_compra float not null,
  FOREIGN KEY(id_compra) REFERENCES compras(id),
  FOREIGN KEY(id_producto) REFERENCES productos(id)
)