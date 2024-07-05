-- Crear las tablas
CREATE TABLE Categorias (
    id_categoria INTEGER PRIMARY KEY,
    nombre TEXT
);

CREATE TABLE Autores (
    id_autor INTEGER PRIMARY KEY,
    nombre TEXT,
    nacionalidad TEXT
);

CREATE TABLE Libros (
    id_libro INTEGER PRIMARY KEY,
    titulo TEXT,
    autor_id INTEGER,
    categoria_id INTEGER,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES Autores(id_autor),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id_categoria)
);

-- Insertar datos de ejemplo
INSERT INTO Categorias (nombre) VALUES ('Ficción'), ('No ficción'), ('Ciencia');

INSERT INTO Autores (nombre, nacionalidad) VALUES 
    ('Gabriel García Márquez', 'Colombiana'),
    ('Stephen King', 'Estadounidense'),
    ('Isaac Asimov', 'Rusa-Estadounidense'),
    ('Jane Austen', 'Británica'),
    ('Haruki Murakami', 'Japonesa');

INSERT INTO Libros (titulo, autor_id, categoria_id, precio) VALUES
    ('Cien años de soledad', 1, 1, 15.99),
    ('It', 2, 1, 18.50),
    ('Yo, robot', 3, 1, 12.99),
    ('Orgullo y prejuicio', 4, 1, 10.50),
    ('1Q84', 5, 1, 20.00),
    ('El amor en los tiempos del cólera', 1, 1, 14.99),
    ('La torre oscura', 2, 1, 22.50),
    ('El fin de la eternidad', 3, 1, 13.99),
    ('Emma', 4, 1, 11.50),
    ('Tokio blues', 5, 1, 16.00);