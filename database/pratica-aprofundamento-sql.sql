-- Active: 1680125063650@@127.0.0.1@3306
-- Conecte o arquivo pratica-aprofundamento-sql.db com a extensão MySQL e ative a conexão aqui

-- Deletar tabela
DROP TABLE pokemons;

-- Criar tabela
CREATE TABLE pokemons (
    id INTEGER PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL,
    type TEXT NOT NULL,
    hp INTEGER NOT NULL,
    attack INTEGER NOT NULL,
    defense INTEGER NOT NULL,
    special_attack INTEGER NOT NULL,
    special_defense INTEGER NOT NULL,
    speed INTEGER NOT NULL
);

-- Popular tabela
INSERT INTO pokemons (
    id,
    name,
    type,
    hp,
    attack,
    defense,
    special_attack,
    special_defense,
    speed
)
VALUES 
    (1, "bulbasaur", "grass", 45, 49, 49, 65, 65, 45),
    (2, "ivysaur", "grass", 60, 62, 63, 80, 80, 60),
    (3, "venusaur", "grass", 80, 82, 83, 100, 100, 80),
    (4, "charmander", "fire", 39, 52, 43, 60, 50, 65),
    (5, "charmeleon", "fire", 58, 64, 58, 80, 65, 80),
    (6, "charizard", "fire", 78, 84, 78, 109, 85, 100),
    (7, "squirtle", "water", 44, 48, 65, 50, 64, 43),
    (8, "wartortle", "water", 59, 63, 80, 65, 80, 58),
    (9, "blastoise", "water", 79, 83, 100, 85, 105, 78);

-- Buscar todos os pokemons
SELECT * FROM pokemons;

-- Práticas

-- 1A. Buscar (SELECT) pokemons que tenham speed maior (>) que 60
SELECT * FROM pokemons
WHERE speed > 60;

-- 1B. Buscar (SELECT) pokemons que tenham attack e (AND) special_attack maiores ou iguais (>=) 60
SELECT * FROM pokemons
WHERE attack >= 60 
AND special_attack >= 60; 

-- 1C. Buscar (SELECT) o pokemons que tenham na coluna name o termo "saur" no final do texto
SELECT * FROM pokemons
WHERE name LIKE "%saur";

-- Pegar (SELECT) pokemons que tenha "to" (%to%) no meio
SELECT * FROM pokemons
WHERE name LIKE "%to%";

-- Pegar (SELECT) pokemons que tenha "char" (char%) no inicio
SELECT * FROM pokemons
WHERE name LIKE "char%";

-- 2A. Busque (SELECT) na tabela pokemons a média simples (AVG) da coluna hp
-- 2C. Refatore para dar apelidos
SELECT AVG(hp) as MediaSimpleHp FROM pokemons;

-- 2B. Busque (SELECT) o número de linha (COUNT) da tabela pokemons
-- 2C. Refatore para dar apelidos
SELECT COUNT(*) as TotalDePokemons FROM pokemons;

-- 3A. Busque todos (SELECT *) os pokemons e ordene-os (ORDER BY) baseado na coluna defense em ordem decrescente(DESC)
SELECT * FROM pokemons
ORDER BY "defense" DESC;

-- 3B. Busque (SELECT) o numero de pokemons cadastrados, agrupe (GROUP BY) o rEsultado baseado na coluna type
SELECT COUNT(*) as QuantidadeDePokemonsTipo, "type" 
FROM pokemons
GROUP BY "type";

-- 3C. Busque (SELECT) por todos (*) os pokemons, limite(LIMIT) o resultado a 3 linhas iniciando a partir (OFFSET) da quinta linha
-- OBS. OFFSET precisa usar com um número antes da linha desejada
SELECT * FROM pokemons
LIMIT 3 OFFSET 4;

-- FIXAÇÃO
-- Filtrar resultado, que na coluna type tenha apenas fire ou grass
-- Ordem crescente na coluna attack
-- Resultado limitando a 3 iniciando da linha 3 
SELECT * FROM pokemons
WHERE type = "fire" OR type = "grass"
ORDER BY attack ASC
LIMIT 3 OFFSET 2;