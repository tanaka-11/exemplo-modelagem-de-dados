# Comandos CRUD SQL - Referências

## Resumo

- C -> CREATE (Inserir dados usando comando `INSERT`)
- R -> READ (Ler dados usando comando `SELECT`)
- U -> UPDATE (Atualizar dados usando comando `UPDATE`)
- D -> DELETE (Excluir dados usando comando `DELETE`)

## INSERT 

### Fabricantes

```sql
INSERT INTO fabricantes(nomeFabricante) VALUES ('Asus');

INSERT INTO fabricantes(nomeFabricante) VALUES ('Dell');
INSERT INTO fabricantes(nomeFabricante) VALUES ('Apple');

INSERT INTO fabricantes(nomeFabricante) VALUES ('LG'),('Samsung'),('Brastemp');

INSERT INTO fabricantes(nomeFabricante) VALUES ('Positivo'),('Microsoft');
```

### Produtos

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
    10,
    5 -- ID do fabricante "Samsung"
);
```