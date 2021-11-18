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