
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
    id_ricetta INTEGER NOT NULL,
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


INSERT INTO ingredienti_ricette (id_ricetta, id_ingrediente  ) VALUES (1, 1);

INSERT INTO ingredienti_ricette (id_ricetta, id_ingrediente  )  VALUES (2, 1);

INSERT INTO ingredienti_ricette (id_ricetta, id_ingrediente  )  VALUES (2, 2);

INSERT INTO ingredienti_ricette (id_ricetta, id_ingrediente  )  VALUES (2, 3);

INSERT INTO ingredienti_ricette (id_ricetta, id_ingrediente  )  VALUES (2, 4);

-- listare tutti gli ingredienti per ogni ricetta
SELECT r.nome as Ricetta,i.nome as ingrediente FROM ingredienti_ricette ir, ingredienti i, ricette r
WHERE ir.id_ingrediente = i.id AND ir.id_ricetta = r.id
ORDER BY r.nome

/*OUTPUT:
Ricetta	        ingrediente
Boiled Egg	    egg
Chocolate cake	egg
Chocolate cake  salt
Chocolate cake	sugar
Chocolate cake	chocolate
*/

-- listare tutti gli ingredienti di una ricetta
SELECT i.nome as ingredienti FROM ingredienti_ricette ir, ingredienti i, ricette r
WHERE ir.id_ingrediente = i.id AND ir.id_ricetta = r.id AND r.nome = 'Chocolate cake'
ORDER BY r.nome
/*OUTPUT:
ingredienti
egg
salt
sugar
chocolate
*/