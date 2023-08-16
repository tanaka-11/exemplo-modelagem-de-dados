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
INSERT INTO produtos(
    nomeProduto, descricao, preco, estoque, fabricante_id) 
    VALUES(
        'Ultrabook',
        'Equipamento de última de geração cheio de recursos, com processador Intel Core I9.',
        3500,
        7,
        2 -- ID do fabricante "Dell"
    );
```