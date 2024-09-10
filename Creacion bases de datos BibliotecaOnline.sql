-- Creación de la base de datos y uso de la misma
CREATE DATABASE IF NOT EXISTS Libreria;
USE Libreria;

-- Creación de la tabla Autores
CREATE TABLE IF NOT EXISTS Autores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50) NOT NULL
);

-- Creación de la tabla Editoriales
CREATE TABLE IF NOT EXISTS Editoriales (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    País VARCHAR(50) NOT NULL
);

-- Creación de la tabla Libros con llaves foráneas
CREATE TABLE IF NOT EXISTS Libros (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Título VARCHAR(150) NOT NULL,
    Autor_ID INT,
    Editorial_ID INT,
    Precio DECIMAL(10, 2) NOT NULL,
    Fecha_Publicación DATE NOT NULL,
    -- Definición de las llaves foráneas
    FOREIGN KEY (Autor_ID) REFERENCES Autores(ID) ON DELETE CASCADE,
    FOREIGN KEY (Editorial_ID) REFERENCES Editoriales(ID) ON DELETE CASCADE
);

-- Creación de la tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Teléfono VARCHAR(20) NOT NULL
);

-- Creación de la tabla Ventas con llaves foráneas
CREATE TABLE IF NOT EXISTS Ventas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Libro_ID INT,
    Cliente_ID INT,
    Fecha_Venta DATE NOT NULL,
    Cantidad INT NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    -- Definición de las llaves foráneas
    FOREIGN KEY (Libro_ID) REFERENCES Libros(ID) ON DELETE CASCADE,
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID) ON DELETE CASCADE
);

-- Descripción de las tablas
DESCRIBE Autores;
DESCRIBE Clientes;
DESCRIBE Editoriales;
DESCRIBE Ventas;

-- Llenado de la tabla Autores
INSERT INTO Autores (Nombre, Nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiano'),
('J.K. Rowling', 'Británica'),
('Stephen King', 'Estadounidense'),
('Isabel Allende', 'Chilena'),
('J.R.R. Tolkien', 'Británica');

-- Llenado de la tabla Editoriales
INSERT INTO Editoriales (Nombre, País) VALUES
('Penguin Random House', 'Estados Unidos'),
('HarperCollins', 'Reino Unido'),
('Planeta', 'España'),
('Norma Editorial', 'Colombia'),
('Alfaguara', 'España');

-- Llenado de la tabla Libros
INSERT INTO Libros (Título, Autor_ID, Editorial_ID, Precio, Fecha_Publicación) VALUES
('Cien Años de Soledad', 1, 5, 19.99, '1967-05-30'),
('Harry Potter y la Piedra Filosofal', 2, 2, 14.99, '1997-06-26'),
('El Resplandor', 3, 1, 17.99, '1977-01-28'),
('La Casa de los Espíritus', 4, 3, 15.99, '1982-10-15'),
('El Señor de los Anillos', 5, 2, 25.99, '1954-07-29');

-- Llenado de la tabla Clientes
INSERT INTO Clientes (Nombre, Email, Teléfono) VALUES
('Juan Pérez', 'juan.perez@example.com', '555-1234'),
('María González', 'maria.gonzalez@example.com', '555-5678'),
('Carlos Ramírez', 'carlos.ramirez@example.com', '555-8765'),
('Laura Méndez', 'laura.mendez@example.com', '555-4321'),
('Ana Torres', 'ana.torres@example.com', '555-6789');

-- Llenado de la tabla Ventas
INSERT INTO Ventas (Libro_ID, Cliente_ID, Fecha_Venta, Cantidad, Total) VALUES
(1, 1, '2024-01-15', 1, 19.99),
(2, 2, '2024-02-20', 2, 29.98),
(3, 3, '2024-03-25', 1, 17.99),
(4, 4, '2024-04-30', 1, 15.99),
(5, 5, '2024-05-05', 3, 77.97);
select * from autores
where nacionalidad = "colombiano"; 

SELECT Título, Precio, Fecha_Publicación
FROM Libros;

SELECT Nombre, Email, Teléfono
FROM Clientes
WHERE Nombre = 'Juan Pérez';


SELECT Fecha_Venta, Cantidad, Total
FROM Ventas;

SELECT DISTINCT Autores.Nombre
FROM Autores
JOIN Libros ON Autores.ID = Libros.Autor_ID;


SELECT Editoriales.Nombre AS Editorial
FROM Editoriales
JOIN Libros ON Editoriales.ID = Libros.Editorial_ID
WHERE Libros.Título = 'Cien Años de Soledad';


SELECT Título, Precio
FROM Libros
ORDER BY Precio ASC;

SELECT Nombre, Email, Teléfono
FROM Clientes
ORDER BY Nombre DESC;

SELECT Título, Fecha_Publicación
FROM Libros
ORDER BY Fecha_Publicación ASC;

SELECT Libro_ID, Cliente_ID, Total
FROM Ventas
ORDER BY Total DESC;

SELECT Nombre, Email
FROM Clientes
WHERE Email LIKE '%gonzalez%';


SELECT Nombre, Email
FROM Clientes
WHERE Email not LIKE '%.com';



SELECT L.Título, C.Nombre AS Cliente, V.Cantidad, V.Fecha_Venta
FROM Ventas V
JOIN Libros L ON V.Libro_ID = L.ID
JOIN Clientes C ON V.Cliente_ID = C.ID;


SELECT C.Nombre, SUM(V.Total) AS Total_Gastado
FROM Ventas V
JOIN Clientes C ON V.Cliente_ID = C.ID
GROUP BY C.Nombre;

USE Libreria;

-- Contar el número total de ventas registradas
SELECT COUNT(*) AS Total_Ventas
FROM Ventas;










