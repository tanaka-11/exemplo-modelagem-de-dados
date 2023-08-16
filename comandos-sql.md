# Comandos SQL - Referências

## Modelagem Física com comandos ***DDL***

### Criar banco de dados

```sql
CREATE DATABASE vendas CHARACTER SET utf8mb4;
```

### Criar tabela de fabricantes

```sql
CREATE TABLE fabricantes(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeFabricante VARCHAR(45) NOT NULL
);
```

### Visualizar detalhes estruturais da tabela

```sql
DESC fabricantes;
```

### Criar tabela de produtos

```sql
CREATE TABLE produtos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeProduto VARCHAR(45) NOT NULL,
    descricao TEXT(500) NULL,
    preco DECIMAL(6,2) NOT NULL, 
    fabricante_id INT NOT NULL
);
```

### Criação do relacionamento entre as tabelas (Chave Estrangeira)

```sql
ALTER TABLE produtos
    ADD CONSTRAINT fk_produtos_fabricantes
    FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id);
    -- Constraint(Restrição): Indicando o nome do relacionamento .
    -- Foreign Key: Chave-estrangeira (fabricante_id) que aponta para a chave-primária (id) de outra tabela
```

### Exemplos de alterações estruturais na tabela

### Renomear tabela

```sql
ALTER TABLE fabricantes RENAME TO fornecedores;
```

### Modificar colunas

```sql
ALTER TABLE produtos 
    MODIFY COLUMN preco INT NOT NULL
```

### Modificar nome das colunas

```sql
ALTER TABLE fabricantes
CHANGE nomeFabricante nome VARCHAR(45);
```

### Adicionar colunas na tabela

```sql
ALTER TABLE produtos
    ADD estoque INT NULL AFTER preco;
```

### Apagar um banco de dados

```sql
DROP DATABASE nomedobanco;
```


