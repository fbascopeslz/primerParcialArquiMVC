CREATE TABLE Persona(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(150) NOT NULL,
	ci VARCHAR(30) NOT NULL,
	telefono INT,
	email VARCHAR(150)
);

INSERT INTO Persona(nombre, ci, telefono, email) VALUES('Marcelo Tinelli', '5429173', 618351970, 'marcelito@gmail.com');
INSERT INTO Persona(nombre, ci, telefono, email) VALUES('Pepe Mamani', '21740284', 73619275, 'pepe@gmail.com');

CREATE TABLE Personal(
	id INT PRIMARY KEY AUTO_INCREMENT,
	cargo VARCHAR(50) NOT NULL,
	profesion VARCHAR(50) NOT NULL,	
	idPersona INT NOT NULL,
	FOREIGN KEY (idPersona) REFERENCES Persona(id)
);
INSERT INTO Personal(cargo, profesion, idPersona) VALUES('Veterinario', 'Medico Veterinario', 2);

CREATE TABLE Propietario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	fechaUnion DATE NOT NULL,
	idPersona INT NOT NULL,
	FOREIGN KEY (idPersona) REFERENCES Persona(id)
);
INSERT INTO Propietario(fechaUnion, idPersona) VALUES('2021-01-06', 1);


CREATE TABLE Grupo(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	descripcion VARCHAR(100) NOT NULL	
);

CREATE TABLE Usuario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	login VARCHAR(50) NOT NULL,
	password VARCHAR(255) NOT NULL,
	idGrupo INT NOT NULL,
	FOREIGN KEY (idGrupo) REFERENCES Grupo(id)
);

CREATE TABLE Consulta(
	id INT PRIMARY KEY AUTO_INCREMENT,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	estado VARCHAR(30) NOT NULL,
	motivo VARCHAR(80) NOT NULL,
	idPersonal INT NOT NULL,
	FOREIGN KEY (idPersonal) REFERENCES Personal(id)
);

CREATE TABLE Diagnostico(
	id INT PRIMARY KEY AUTO_INCREMENT,
	diagnostico VARCHAR(50),
	peso VARCHAR(10),
	temperatura VARCHAR(10),
	idConsulta INT NOT NULL,
	FOREIGN KEY (idConsulta) REFERENCES Consulta(id)
);


