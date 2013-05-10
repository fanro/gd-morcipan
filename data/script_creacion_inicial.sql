CREATE TABLE roles (
	rol_id INT IDENTITY(1, 1),
	rol_nombre NVARCHAR(255) NOT NULL,
	habilitado TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY (rol_id)
);

CREATE TABLE funciones (
	funcion_id INT IDENTITY(1, 1),
	funcion_nombre NVARCHAR(255) NOT NULL,
	habilitado TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY (funcion_id)
);

CREATE TABLE usuarios (
	usuario_id INT IDENTITY(1, 1),
	usuario NVARCHAR(255) UNIQUE NOT NULL,
	usuario_password NVARCHAR(255) NOT NULL,
	habilitado TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY(usuario_id)
);

CREATE TABLE ciudades (
	ciudad_id INT IDENTITY(1, 1),
	ciudad_nombre NVARCHAR(255) UNIQUE NOT NULL,
	PRIMARY KEY (ciudad_id)
);

CREATE TABLE tipos_servicio (
	tipo_servicio_id INT IDENTITY(1, 1),
	tipo_servicio NVARCHAR(255) UNIQUE NOT NULL,
	PRIMARY KEY (tipo_servicio_id)
);

CREATE TABLE recorridos (
	recorrido_id INT IDENTITY(1, 1),
	recorrido_codigo NVARCHAR(15) UNIQUE NOT NULL,
	tipo_servicio_id INT NOT NULL,
	ciudad_origen_id INT NOT NULL,
	ciudad_destino_id INT NOT NULL,
	precio_base_pasaje DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
	precio_base_kg DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
	PRIMARY KEY (recorrido_id),
	FOREIGN KEY (tipo_servicio_id) REFERENCES tipos_servicios (tipo_servicio_id),
	FOREIGN KEY (ciudad_origen_id) REFERENCES ciudades (ciudad_id),
	FOREIGN KEY (ciudad_destino_id) REFERENCES ciudades (ciudad_id)
);

CREATE TABLE roles_funciones (
	rol_id INT NOT NULL,
	funcion_id INT NOT NULL,
	habilitado TINYINT NOT NULL DEFAULT 1,
	PRIMARY KEY (rol_id, funcion_id),
	FOREIGN KEY (rol_id) REFERENCES roles (rol_id),
	FOREIGN KEY (funcion_id) REFERENCES funciones(funcion_id)
);

