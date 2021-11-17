
DROP TABLE IF EXISTS 'ingredienti';
DROP TABLE IF EXISTS 'ricette';
DROP TABLE IF EXISTS 'ingredienti_ricette';
DROP TABLE IF EXISTS 'ingredienti_nel_frigo';


CREATE TABLE ingredienti(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL
);

CREATE TABLE ricette (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descrizione TEXT NOT NULL,
    istruzioni TEXT NOT NULL);

CREATE TABLE ingredienti_ricette (
    id_ricetta INTEGER PRIMARY KEY AUTOINCREMENT,
    id_ingrediente INTEGER NOT NULL,
    FOREIGN KEY (id_ricetta) REFERENCES ricette(id),
    FOREIGN KEY (id_ingrediente) REFERENCES ingredienti(id));
    
CREATE TABLE ingredienti_nel_frigo (
    id_ingrediente_frigo INTEGER PRIMARY KEY AUTOINCREMENT,
    id_ingrediente INTEGER NOT NULL,
    FOREIGN KEY (id_ingrediente) REFERENCES ingredienti(id)
);



INSERT INTO ingredienti (nome) VALUES ('egg'), ('salt'), ('sugar'), ('chocolate'), ('vanilla extract'), ('flour');
INSERT INTO ricette (nome, descrizione, istruzioni) VALUES 
    ('Boiled Egg', 'A single boiled egg', 'Add egg to cold water. Bring water to boil. Cook.'),
    ('Chocolate cake', 'A delicious chocolate cake', 'Mix all ingredients together, put in the oven and bake for 30 minutes');

