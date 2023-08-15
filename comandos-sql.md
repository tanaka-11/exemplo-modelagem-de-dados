# Comandos SQL - Referências

## Modelagem Física com comandos **DDL**

### Criar banco de dados
CREATE DATABASE vendas CHARACTER SET utf8mb4;

### Criar tabela de fabricantes
CREATE TABLE fabricantes(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nomeFabricante VARCHAR(45) NOT NULL
);