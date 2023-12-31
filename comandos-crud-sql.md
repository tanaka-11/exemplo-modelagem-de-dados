# Comandos CRUD SQL - Referências

## Resumo

- C -> CREATE (Inserir dados usando comando `INSERT`)
- R -> READ (Ler dados usando comando `SELECT`)
- U -> UPDATE (Atualizar dados usando comando `UPDATE`)
- D -> DELETE (Excluir dados usando comando `DELETE`)

## INSERT 

### Adicionando dados

#### Fabricantes

```sql
INSERT INTO fabricantes(nomeFabricante) VALUES ('Asus');

INSERT INTO fabricantes(nomeFabricante) VALUES ('Dell');
INSERT INTO fabricantes(nomeFabricante) VALUES ('Apple');

INSERT INTO fabricantes(nomeFabricante) VALUES ('LG'),('Samsung'),('Brastemp');

INSERT INTO fabricantes(nomeFabricante) VALUES ('Positivo'),('Microsoft');
```

#### Produtos

```sql
INSERT INTO produtos (
    nomeProduto, descricao, preco, estoque, fabricante_id
) VALUES (
    'Ultrabook',
    'Equipamento de última de geração cheio derecursos, com processador Intel Core I9.',
    3500,
    7,
    2 -- ID do fabricante "Dell"
);

INSERT INTO produtos (
    nomeProduto, descricao, preco, estoque, fabricante_id
) VALUES (
    'Tablet',
    'Tablet com a versão 14 do sistema operacional Android, 128gb de memória, tela de 10 polegadas, 8gb de RAM',
    1500.99,
    5,
    5 -- ID do fabricante "Samsung"
);

INSERT INTO produtos (
    nomeProduto, descricao, preco, estoque, fabricante_id
) VALUES (
    'Geladeira',
    'Refrigerador frost-free com acesso à internet',
    5000,
    12,
    6
), 
(
    'Iphone 14 Pro Max',
    'Smartphone Apple',
    12666.70,
    3,
    3
), 
(
    'Ipad Mini',
    'Tablet Apple',
    4999.99,
    5,
    3
);

```

---

## SELECT

### Consultas/Querys de dados

```sql
SELECT * FROM produtos;

SELECT nomeProduto, preco FROM produtos;

SELECT preco, nomeProduto FROM produtos;

SELECT nomeProduto, preco, estoque FROM produtos WHERE preco < 5000;

SELECT nomeProduto, descricao FROM produtos WHERE fabricante_id = 3;
```

---

## Outras formas de utilizar o SELECT

### Classificando (ORDER BY)

```sql
SELECT nomeProduto, preco FROM produtos ORDER BY nomeProduto;

-- Ordem Crescente (ASC - Padrão)
SELECT nomeProduto, preco FROM produtos ORDER BY preco;

-- Ordem Decrescente (DESC)
SELECT nomeProduto, preco FROM produtos ORDER BY preco DESC;

-- Passar o ORDER BY após o WHERE.
SELECT nomeProduto, preco FROM produtos WHERE estoque = 20 ORDER BY nomeProduto;

```

---

### Busca de dados (LIKE)

```sql
--  o símbolo "%" é usado como um caractere curinga para a busca de um texto no banco de dados.

SELECT nomeProduto, descricao FROM produtos WHERE descricao LIKE '%sistema%';

SELECT nomeProduto, descricao FROM produtos WHERE descricao LIKE '%tela%' OR nomeProduto like '%apple%';
```

---

### Operações e funções de agregação
 
```sql
-- Exemplo de soma (SUM):
SELECT SUM(preco) FROM produtos;

-- Exemplo de apelidos (as):
SELECT nomeProduto as Produto, preco as "Preço" FROM produtos;

-- Exemplo de média (AVG):
SELECT AVG(preco) as "Média dos Preços" FROM produtos;

-- Exemplo de média com arredondamento (ROUND) passando a "," e a quantidade de casas decimais dentro da função:
SELECT ROUND(AVG(preco), 2) as "Média dos Preços" FROM produtos;

-- Exemplo de contagem (COUNT):
SELECT COUNT(id) as "Qtd. de Produtos" FROM produtos;

-- Exemplo de contagem com a flag (DISTINCT) 
-- em resumo a flag (DISTINCT) é utilizada para evitar -- duplicidade na contagem de registros:
SELECT COUNT(DISTINCT fabricante_id) as "Qtd. de Fabricantes com produtos" FROM produtos;

```

---

### Operadores Lógicos: E, OU, NÃO

#### E (AND)

```sql
SELECT nomeProduto, preco FROM produtos WHERE preco >= 2000 AND preco <= 6000;

SELECT nomeProduto, preco FROM produtos WHERE preco > 5000 AND preco <= 6000;

```

---

#### OU (OR)

Exemplo 1 - Usando operador lógico

```sql
SELECT nomeProduto, preco FROM produtos WHERE preco > 5000 OR preco <= 3000;

SELECT nomeProduto, descricao FROM produtos WHERE fabricante_id = 3 OR fabricante_id = 5;
```

Exemplo 2 - Usando função IN

```sql
SELECT nomeProduto, descricao FROM produtos WHERE fabricante_id  IN (3,5);
```

#### NÃO (NOT)

Exemplo 1 - Usando o operador lógico

```sql
SELECT nomeProduto, preco, descricao FROM produtos WHERE NOT fabricante_id = 8;
```

Exemplo 2 - Usando operador relacional

```sql
SELECT nomeProduto, preco, descricao FROM produtos WHERE fabricante_id != 8;
```

Exemplo 3 - Usando função IN

```sql
SELECT nomeProduto, descricao FROM produtos WHERE fabricante_id NOT IN (3,5);
```

---

## UPDATE

```sql
UPDATE fabricantes SET nomeFabricante = 'Asus do Brasil' WHERE id = 1; 
-- JAMAIS FAZER UM UPDATE SEM O WHERE!

UPDATE produtos SET preco = '6549,75' WHERE id = 4;
-- Utilizar o ID por ser único e não ter mais produtos iguais.

UPDATE produtos SET estoque = 20 WHERE fabricante_id = 3 OR fabricante_id = 5;

UPDATE produtos SET estoque = 20 WHERE fabricante_id IN (3,5)
```

---

## DELETE

```sql
DELETE FROM fabricantes WHERE id = 1;

-- A query abaixo NÃO FUNCIONA devido à restrição de chave estrangeira/relacionamento,
-- ou seja, existem produtos associados ao fabricante 3.
-- DELETE FROM fabricantes WHERE id = 3;
```

---

### Operações matemáticas:
```sql
SELECT nomeProduto, preco, estoque, (preco * estoque) as Total FROM produtos;
```

### Segmentação/Agrupamento de resultados(GROUP BY):

```sql
SELECT fabricante_id, SUM(preco) FROM produtos GROUP BY fabricante_id;

```

---

## Consultas (Queries) em duas ou mais tabelas relacionadas chamada de JUNÇÃO(INNER JOIN)

### Exibindo nome do produto e do fabricante:
```sql
-- SELECT tabela.coluna, tabela.coluna
SELECT produtos.nomeProduto as Produto, fabricantes.nomeFabricante as Fabricante

-- INNER JOIN = Comando para juntar as tabelas SQL
FROM produtos INNER JOIN fabricantes 

-- ON = Comando para o critério da junção (INNER JOIN)
ON produtos.fabricante_id = fabricantes.id;
```

### Exibindo o nome do produto, preço, fabricante e ordena-los pelo nome do produto:

```sql
SELECT 
    produtos.nomeProduto as Produtos, 
    produtos.preco as "Preço", 
    fabricantes.nomeFabricante as Fabricantes 
FROM produtos INNER JOIN fabricantes 
ON produtos.fabricante_id = fabricantes.id 
ORDER BY Produtos, "Preço", Fabricantes;
-- No comando ORDER BY foi utilizado o apelido (as)
```

### Exibindo fabricante, soma dos preços e o estoque dos produtos:

```sql
SELECT fabricantes.nomeFabricante as Fabricante, 
SUM(produtos.preco) as Total, 
COUNT(produtos.fabricante_id) as "Qtd de Produtos" FROM produtos INNER JOIN fabricantes ON produtos.fabricante_id = fabricantes.id GROUP BY Fabricante ORDER BY Total; 
```

### Trazer a quantidade de produtos de cada fabricante e a soma do estoque, SOMENTE DOS FABRICANTES QUE POSSUEM PRODUTOS

```sql
SELECT 
fabricantes.nomeFabricante as Fabricantes, 
COUNT(produtos.fabricante_id) as Produtos,
SUM(produtos.estoque) as Estoque 
FROM produtos INNER JOIN fabricantes 
ON produtos.fabricante_id = fabricantes.id
GROUP BY Fabricantes;
-- Utilizar o GROUP BY para agrupar os resultados
```

### Trazer a quantidade de produtos de cada fabricante e a soma do estoque, MESMO DOS FABRICANTES QUE NÃO POSSUEM PRODUTOS.

```sql
-- Tabela "Fabricantes" à esquerda apos o FROM
SELECT 
fabricantes.nomeFabricante as Fabricantes, 
COUNT(produtos.fabricante_id) as Produtos,
SUM(produtos.estoque) as Estoque 
FROM fabricantes LEFT JOIN produtos
ON produtos.fabricante_id = fabricantes.id
GROUP BY Fabricantes;

-- Tabela "Fabricantes"" à direita apos o FROM
SELECT 
fabricantes.nomeFabricante as Fabricantes, 
COUNT(produtos.fabricante_id) as Produtos,
SUM(produtos.estoque) as Estoque 
FROM produtos RIGHT JOIN fabricantes
ON produtos.fabricante_id = fabricantes.id
GROUP BY Fabricantes;
```