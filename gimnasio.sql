CREATE TABLE categoria_pase_diario
(
 id BIGSERIAL,
 categoria VARCHAR(100),
 precio INTEGER,
 PRIMARY KEY (id)
);

CREATE TABLE producto
(
 id BIGSERIAL,
 nombre VARCHAR(50),
 precio INTEGER,
 PRIMARY KEY (id)
);

CREATE TABLE tipo_suscripcion
(
 id BIGSERIAL,
 categoria VARCHAR(30),
 precio INTEGER,
 PRIMARY KEY (id)
);

CREATE TABLE cliente (id BIGSERIAL, nombre VARCHAR(50), apellido VARCHAR(50), tel?fono VARCHAR(50), email VARCHAR(30), dia_pago_suscripcion DATE, tipo_suscripcion VARCHAR(50), PRIMARY KEY (id),
id_tipo_suscripcion INTEGER
);

ALTER TABLE cliente ADD CONSTRAINT fk_id_tipo_suscripcion FOREIGN KEY (id_tipo_suscripcion) REFERENCES tipo_suscripcion(id);

CREATE TABLE transaccion (id BIGSERIAL, fecha DATE, forma_de_pago INTEGER, id_cliente INT, PRIMARY KEY (id));

ALTER TABLE transaccion ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id);


CREATE TABLE pase_diario
(
 id BIGSERIAL,
 fecha DATE,
 id_cliente INTEGER,
 id_categoria_pase INTEGER
 PRIMARY KEY (id)
);


ALTER TABLE pase_diario ADD CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id);

ALTER TABLE pase_diario ADD CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria_pase) REFERENCES categoria_pase_diario(id);

CREATE TABLE linea_de_transaccion
(
 id BIGSERIAL,
 id_producto INTEGER,
 nombre_producto VARCHAR(50),
 cantidad INTEGER,
 id_transaccion INTEGER,
 total INTEGER,
 PRIMARY KEY (id)
);


ALTER TABLE linea_de_transaccion ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES producto(id);


ALTER TABLE linea_de_transaccion ADD CONSTRAINT fk_id_transaccion FOREIGN KEY (id_transaccion) REFERENCES transaccion(id);


