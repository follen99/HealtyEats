DROP TABLE IF EXISTS pasti;
DROP TABLE IF EXISTS tipo_pasto;

CREATE TABLE 'pasti'(
    id_pasto INTEGER PRIMARY KEY AUTOINCREMENT,
    data_pasto DATE NOT NULL,
    tipo_pasto INTEGER NOT NULL,

    FOREIGN KEY (tipo_pasto) REFERENCES tipo_pasto(id_tipo_pasto)
);

CREATE TABLE 'tipo_pasto'(
    id_tipo_pasto INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo_pasto TEXT NOT NULL
);

CREATE TABLE 'piatti_mangiati'(
    id_piatto_mangiato INTEGER PRIMARY KEY AUTOINCREMENT,
    id_ricetta INTEGER NOT NULL,
    id_pasto INTEGER NOT NULL,

    FOREIGN KEY (id_ricetta) REFERENCES ricette(id),
    FOREIGN KEY (id_pasto) REFERENCES pasti(id)
);

INSERT INTO tipo_pasto(tipo_pasto) VALUES ('COLAZIONE'), ('PRANZO'), ('CENA');
SELECT* FROM tipo_pasto;

INSERT INTO pasti(data_pasto, tipo_pasto) VALUES ('2021-10-23' , 1);
SELECT* FROM pasti;

SELECT t.tipo_pasto as Pasto, p.data_pasto AS Data
FROM pasti p, tipo_pasto t
WHERE p.tipo_pasto = t.id_tipo_pasto;


SELECT* FROM ricette;
INSERT INTO piatti_mangiati(id_ricetta, id_pasto) VALUES (2 , 1);

SELECT r.nome as RICETTA, t.tipo_pasto
FROM ricette r, tipo_pasto t, pasti p, piatti_mangiati pm
where pm.id_ricetta = r.id AND pm.id_pasto = p.id_pasto and p.tipo_pasto = t.id_tipo_pasto;