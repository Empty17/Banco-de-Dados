
DROP DATABASE bibliotech;

CREATE DATABASE  bibliotech;
USE bibliotech;

CREATE TABLE estabelecimento
(
		ID_estabelecimento int unsigned not null auto_increment,
        estado varchar(50) not null,
        bairro varchar(200) not null,
        endereço varchar(400) not null,
        nome varchar(100) not null default 'biblioteca',
        PRIMARY KEY (ID_estabelecimento)
);

CREATE TABLE consumivel
(
		ID_Consumivel int unsigned not null auto_increment,
        preco double not null,
        FK_ID_Estabelecimento int unsigned not null,
        PRIMARY KEY (ID_Consumivel),
		CONSTRAINT FK_Estabelecimento_Consumivel FOREIGN KEY (FK_ID_Estabelecimento) REFERENCES estabelecimento(ID_Estabelecimento) 

);

CREATE TABLE tiposConsumivel
(
		FK_ID_Consumivel int unsigned not null,
		ID_TipoConsumivel int unsigned not null auto_increment,
        bebidas varchar(50) not null default ' ',
        comidas varchar(50) not null default ' ',
        jogos varchar(50) not null default ' ',
        filmes varchar(50) not null default ' ',
        pelucia varchar(50) not null default ' ',
        PRIMARY KEY (ID_TipoConsumivel),
        CONSTRAINT FK_Consumivel_TipoConsumivel FOREIGN KEY (FK_ID_Consumivel) REFERENCES consumivel(ID_Consumivel)
);

CREATE TABLE cliente
(
		ID_Cliente int unsigned auto_increment,
        CPF varchar(15) not null,
        nome varchar(100) not null,
        dataNasc varchar(10) not null,
        PRIMARY KEY (ID_Cliente)
);

CREATE TABLE pessoafisica
(
	ID_pf int unsigned auto_increment,
	CPF varchar(15) not null,
    PRIMARY KEY (ID_pf)
);

CREATE TABLE pessoajuridica
(
	ID_pj int unsigned auto_increment,
	CNPJ varchar(15) not null,
    PRIMARY KEY (ID_pj)
);

CREATE TABLE autor
(
		ID_Autor int unsigned auto_increment,
        nacionalidade varchar(100) not null,
        nome varchar(100) not null,
        dataNasc varchar(10) not null,
        PRIMARY KEY (ID_Autor)
);

CREATE TABLE endereco
(
	ID_Endereco int unsigned not null auto_increment,
    bairro varchar(100) not null default '',
    estado varchar(100) not null default '',
    cidade varchar(100) not null default '',
    CEP varchar(10) not null default '',
    complemento varchar(100) not null default '',
    FK_ID_Cliente int unsigned not null,
    PRIMARY KEY(ID_Endereco),
    CONSTRAINT FK_Cliente_Endereco FOREIGN KEY (FK_ID_Cliente) REFERENCES cliente(ID_Cliente) 
);

CREATE TABLE telefone
(
	ID_Telefone int unsigned not null auto_increment,
    telefone varchar(15) not null default '(00) 00000-0000',
    FK_ID_Cliente int unsigned not null,
    PRIMARY KEY(ID_Telefone),
    CONSTRAINT FK_Cliente_Telefone FOREIGN KEY (FK_ID_Cliente) REFERENCES cliente(ID_Cliente) 
);


CREATE TABLE compra
(
	ID_Compra int unsigned not null auto_increment,
    valor double unsigned not null,
    datas varchar(10) not null default '',
    FK_ID_Estabelecimento int unsigned not null,
    PRIMARY KEY(ID_Compra),
    CONSTRAINT FK_Estabelecimento_Compra FOREIGN KEY (FK_ID_Estabelecimento) REFERENCES estabelecimento(ID_Estabelecimento) 
);


CREATE TABLE clientecompra
(
ID_ClienteCompra int unsigned not null auto_increment,
FK_ID_Cliente int unsigned not null,
FK_ID_Compra int unsigned not null,
PRIMARY KEY(ID_ClienteCompra),
CONSTRAINT FK_ID_Cliente_ClienteCompra FOREIGN KEY ( FK_ID_Cliente ) REFERENCES cliente(ID_Cliente),
CONSTRAINT FK_ID_Compra_ClienteCompra FOREIGN KEY ( FK_ID_Compra ) REFERENCES compra(ID_Compra)
);


CREATE TABLE livros
(
ID_Livro int unsigned not null auto_increment,
FK_ID_Cliente int unsigned not null,
FK_ID_Autor int unsigned not null,
editora varchar(50) not null,
ano_lanc varchar(10) not null,
titulo varchar(50) not null default '',
PRIMARY KEY(ID_Livro),
CONSTRAINT FK_ID_Cliente_Livro FOREIGN KEY ( FK_ID_Cliente ) REFERENCES cliente(ID_Cliente),
CONSTRAINT FK_ID_Autor_Livro FOREIGN KEY ( FK_ID_Autor) REFERENCES autor(ID_Autor)
);

CREATE TABLE tipogenero
(
ID_TipoGenero int unsigned not null auto_increment,
FK_ID_Livro int unsigned not null,
acao bit not null default 0,
gastronomia bit not null default 0,
ficcao_cientifica bit not null default 0,
infantil bit not null default 0,
fantasia bit not null default 0,
religioso bit not null default 0,
romance bit not null default 0,
novela bit not null default 0,
suspense bit not null default 0,
horror bit not null default 0,
aventura bit not null default 0,
PRIMARY KEY(ID_TipoGenero),
CONSTRAINT FK_ID_Livro_TipoGenero FOREIGN KEY ( FK_ID_Livro ) REFERENCES livros(ID_Livro)
);


CREATE TABLE funcionario
(
		ID_Funcionario int unsigned  auto_increment,
        salario int unsigned not null,
        datanasc varchar(10) not null,
        nome varchar(100) not null default 'funcionario',
  		FK_ID_Estabelecimento int unsigned not NULL,
        PRIMARY KEY (ID_Funcionario),
        CONSTRAINT FK_ID_Estabelecimento_Funcionario FOREIGN KEY (FK_ID_Estabelecimento) REFERENCES estabelecimento(ID_Estabelecimento)
);


CREATE TABLE colaborador
(
		ID_Colaborador int unsigned  auto_increment,
        estado varchar(50) not null,
        endereço varchar(200) not null,
  		FK_ID_Estabelecimento int unsigned not NULL,
        PRIMARY KEY (ID_Colaborador),
  		CONSTRAINT FK_ID_Estabelecimento_Colaborador FOREIGN KEY (FK_ID_Estabelecimento) REFERENCES estabelecimento(ID_Estabelecimento) 
);

CREATE TABLE custos
(
		ID_Custos int unsigned  auto_increment,
        custosTotais double not null,
  		FK_ID_Estabelecimento int unsigned not NULL,
  		FK_ID_Consumivel int unsigned not NULL,
        PRIMARY KEY (ID_Custos),
  		CONSTRAINT FK_Estabelecimento_Custos FOREIGN KEY (FK_ID_Estabelecimento) REFERENCES estabelecimento(ID_Estabelecimento)
);

CREATE TABLE tipocustos
(
ID_TipoCusto int unsigned auto_increment,
FK_ID_Custos int unsigned not null,
funcionario double not null,
estoque double not null,
aluguel double not null,
luz double not null,
agua double not null,
PRIMARY KEY(ID_TipoCusto),
CONSTRAINT FK_ID_TC_TipoCustos FOREIGN KEY ( FK_ID_Custos ) REFERENCES custos(ID_Custos)
);

/*
INSERT's 
*/
INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('785.985.335-25', 'Roger Guedes', '25/09/1994');

INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('785.985.000-25', 'Tiquinho Suares', '18/07/1997');

INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('888.987.154-01', 'Richarde Olivera', '25/10/1990');

INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('785.985.745-88', 'Rafael Abrantes', '24/09/1994');

INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('785.922.285-25', 'Gabriel Jesus', '08/02/1998');

INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('584.859.669-08', 'Matheus Campos', '20/12/2005');
INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('785.987.335-25', 'Lima Pereira', '19/11/2006');
INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('432.978.115-77', 'Maria Fernanda', '06/04/2004');
INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('154.850.005-84', 'Roger Guedes de Santos', '25/09/1984');
INSERT INTO cliente
( CPF, nome, dataNasc)
VALUES
('454.235.455-23', 'Gabriel Alves', '05/10/2002');

/*
INSERT estabelecimento
*/
INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(1, 'SP', 'Mooca', 'Rua Japones, 25', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(2, 'SP', 'Santo Amaro', 'Rua Juliano Peixoto, 1155', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(3, 'SP', 'Alphaville', 'Rua Borges Zanneti, 0054', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(4, 'RJ', 'Fluminense', 'Rua Namili , 5422', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(5, 'RJ', 'Flamengo', 'Rua Pereido de Castro, 15', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(6, 'MG', 'Timinhamguá', 'Rua Azevedo Neto, 158', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(7, 'RS', 'Santana', 'Rua Castro Alves, 874', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(8, 'RS', 'Jardim Botânico', 'Rua Castro Alves, 774', 'Bibliotech');


INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(9, 'AM', 'Jardins', 'Rua Alves, 774', 'Bibliotech');

INSERT INTO estabelecimento
(ID_estabelecimento, estado, bairro, endereço, nome)
VALUES
(10, 'BA', 'Meu Rei', 'Rua Alves de Santana, 8474', 'Bibliotech');

/*
INSERT consumivel
*/
INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(15.99, 10);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(1.99, 9);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(20.00, 8);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(2500.00, 7);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(15.99, 6);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(19.99, 5);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(9.99, 4);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(150.59, 3);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(1854.00, 2);

INSERT INTO consumivel
(preco, FK_ID_Estabelecimento)
VALUES
(10.00, 1);

/*
INSERT autor
*/
INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Brasilerio', 'Roberto Guimarães', '17/01/1968');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Americano', 'Gus Williams', '27/09/1928');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Indiana', 'Kali J.J', '04/12/2000');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Italiana', 'Stella Pagano', '19/06/1877');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Português', 'José Saramago', '16/09/1922');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Brasileira', 'Clarice Lispector', '10/12/1920');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Russo', 'Fiódor Dostoiévski', '09/02/1821');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Britânico', 'William Shakespeare', '23/04/1564');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Colômbiano', 'Gabriel García Márquez', '06/03/1927');

INSERT INTO autor
(nacionalidade, nome, dataNasc)
VALUES
('Francês', 'Marcel Proust', '10/07/1871');

/*INSERT livros*/
INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(10, 'Senac', '27/09/1998', 'Rosas de Fogo', 4);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(6, 'Editora Rocco', '18/04/1975', 'Lembranças Profundas', 1);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(9, 'Editora Sextante', '24/11/2002', 'Lembranças Parte 2', 8);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(7, 'Saraiva', '01/12/2000', 'Morro das Águas', 5);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(3, 'Senac', '27/09/2000', 'Rosas de Fogo - O Sangue Azul', 6);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(2, 'Editora Arqueiro', '02/10/1977', 'Milhagre do Amanhã', 2);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(8, 'Senac', '07/09/2020', 'Black Mirror: Por Trás da Tela', 3);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(4, 'Senac', '17/01/2005', 'Virada de Chave', 9);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(5, 'Editora Rocco', '16/07/1998', 'Lembrasnças Profundas: Parte 2', 7);

INSERT INTO livros
(FK_ID_Cliente, editora, ano_lanc, titulo, FK_ID_Autor)
VALUES
(1, 'Editora Vida', '01/01/1800', 'A Biblia dos Chefes', 10);


/*INSERT COMPRA*/

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(1, 19.99, '11/11/2002');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(1, 135.60, '11/05/2022');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(2, 129.99, '08/11/2015');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(3, 19.99, '09/11/2001');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(3, 5.99, '28/01/2001');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(4, 18.88, '09/11/2023');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(8, 50.00, '17/11/2023');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(8, 50.00, '17/12/2023');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(9, 188.00, '01/05/2019');

INSERT INTO compra
(FK_ID_Estabelecimento, valor, datas)
VALUES
(4, 50.00, '17/12/2013');

/*INSERT's funcionario*/

INSERT INTO funcionario
(salario, datanasc, nome, FK_ID_Estabelecimento)
VALUES
(2700, '21/12/2005', 'Matheus Campos', 4);

INSERT INTO funcionario
(salario, datanasc, nome, FK_ID_Estabelecimento)
VALUES
(2700, '21/12/2002', 'Gabriel Alves', 10);

INSERT INTO funcionario
(salario, datanasc, nome, FK_ID_Estabelecimento)
VALUES
(2000, '16/06/2011', 'Roberto Carlos', 3);

INSERT INTO funcionario
(salario, datanasc, nome, FK_ID_Estabelecimento)
VALUES
(3200, '18/07/2004', 'Maria Fernanda', 2);

INSERT INTO funcionario
(salario, datanasc,  nome, FK_ID_Estabelecimento)
VALUES
(1200, '21/12/2005', 'Roberto Carlos', 4);

INSERT INTO funcionario
(salario, datanasc,nome, FK_ID_Estabelecimento)
VALUES
(1500, '21/11/2000', 'Miguel Ohara', 2);

INSERT INTO funcionario
(salario, datanasc,nome, FK_ID_Estabelecimento)
VALUES
(1500, '21/11/2002', 'Dayverson Ohara', 2);

INSERT INTO funcionario
(salario, datanasc,nome, FK_ID_Estabelecimento)
VALUES
(4500, '01/04/1985', 'Daniela Souza', 9);

INSERT INTO funcionario
(salario, datanasc,nome, FK_ID_Estabelecimento)
VALUES
(1700, '21/06/2001', 'Rafael Abrantes', 8);

INSERT INTO funcionario
(salario, datanasc,nome, FK_ID_Estabelecimento)
VALUES
(1800, '21/04/2003', 'Richard', 1);

/*INSERT colaborador*/
INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('Minas Gerais', 'AV. Rodolfo de Nobrega, 144', 1);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('Minas Gerais', 'Avenida do Estado, 1000', 1);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('São Paulo', 'AV. Paulista, 800', 1);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('São Paulo', 'Rua Floriano de Magalhães, 445', 1);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('Pernanbuco', 'Rua Coronel Alberto Lundgren, 339', 1);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('São Paulo', 'AV. Borba Gato, 1059', 1);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('Île-de-France (França)', 'Rua de Saigon, 5', 2);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('Braga (Portugal)', 'Rua da Capela, 13', 2);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('Île-de-France (França)', 'Rua de Saigon, 33', 2);

INSERT INTO colaborador
(estado, endereço,FK_ID_Estabelecimento)
VALUES
('La Rosaleda (Espanha)', 'AV. José Maria II', 2);

/*INSERT tipogenero*/
INSERT INTO tipogenero
(acao, FK_ID_Livro)
VALUES
(1, 5);
INSERT INTO tipogenero
(aventura, FK_ID_Livro)
VALUES
(1, 5);
INSERT INTO tipogenero
(infantil, FK_ID_Livro)
VALUES
(1, 3);
INSERT INTO tipogenero
(religioso, FK_ID_Livro)
VALUES
(1, 1);
INSERT INTO tipogenero
(gastronomia, FK_ID_Livro)
VALUES
(1, 2);
INSERT INTO tipogenero
(romance, fantasia, FK_ID_Livro)
VALUES
(1, 1, 10);
INSERT INTO tipogenero
(fantasia, horror, acao, FK_ID_Livro)
VALUES
(1, 1, 1, 7);
INSERT INTO tipogenero
(romance, novela, FK_ID_Livro)
VALUES
(1, 1, 4);
INSERT INTO tipogenero
(FK_ID_Livro)
VALUES
(6);
INSERT INTO tipogenero
(acao, horror, aventura, suspense, novela, romance, religioso, fantasia, ficcao_cientifica, infantil, gastronomia,FK_ID_Livro)
VALUES
(1,1,1,1,1,1,1,1,1,1,1,9);

/*INSERT's endereço*/

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(1, 'Miguel Yunes', 'SP', 'São Paulo', '04558-006', 'Torre 3, 12° andar, apto 125', 1);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(2, 'Mooca', 'SP', 'São Paulo', '03888-000', 'Rua da Paixão, 123', 2);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(3, 'Zona de Baixo', 'SP', 'Riberão Preto', '44588-015', 'Torre A, 1° andar, apto 18', 3);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(4, 'Fluminense', 'Rj', 'Rio de Janeiro', '78845-225', 'Rua do Aperto, 123', 4);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(5, 'Eldorado', 'MG', 'Belo Horizonte', '32310-405', 'Rua Paineiras, 48', 5);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(6, 'Zona Mista', 'SC', 'Chapecó', '98858-115', 'Av. Limera, 615', 6);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(7, 'Boituvá', 'MT', 'Campo Grande', '41888-845', 'Torre 6, 3° Andar, apto 33', 7);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(8, 'Zona de Baixo', 'SP', 'Riberão Preto', '44588-015', 'Torre B, 8° andar, apto 89', 8);

INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(9, 'Grajaú', 'SP', 'São Paulo', '28996-043', 'RuaEmily Dickinson, 19', 9);


INSERT INTO endereco
(ID_Endereco, bairro, estado, cidade, CEP, complemento, FK_ID_Cliente)
VALUES
(10, 'Lago Azul', 'RS', 'Florianópolis', '49565-015', 'Complexo B, N°15', 10);

/*Insert's telefone*/
INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(11) 90445-0669', 10);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(33) 41485-8393', 7);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(19) 44515-8495', 4);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(11) 27258-6511', 5);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(19) 57795-8217', 9);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(19) 84784-8217', 2);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(21) 03258-8217', 8);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(37) 95854-1552', 3);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(43) 95184-1218', 1);

INSERT INTO telefone
(telefone, FK_ID_Cliente)
VALUES
('(11) 98295-8217', 6);

/*Insert custo*/
INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(119.50, 1, 10);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(5800.90, 2, 9);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(952, 3, 8);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(10000.00, 4, 7);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(6529.52, 5, 6);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(10.00, 6, 5);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(1058.00, 7, 4);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(1058.00, 8, 3);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(9854.00, 9, 2);

INSERT INTO custos
(custosTotais, FK_ID_Estabelecimento, FK_ID_Consumivel)
VALUES
(50000.00, 10, 1);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(2, 3, 30, 1360, 70.87, 100.11);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(2, 3, 30, 1360, 70.87, 100.11);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(7, 1, 112, 5800, 340.15, 210);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(7, 9, 70, 2200, 150, 130);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(10, 6, 200, 6000, 300, 350);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(5, 5, 45, 1000, 80.90, 69);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(3, 4, 37, 900, 90.78, 59.65);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(4, 7, 190, 1600, 110, 90);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(6, 8, 70, 4200, 220, 110);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(8, 2, 100, 3000, 140, 110);

INSERT INTO tipocustos 
(FK_ID_Custos, funcionario, estoque, aluguel, luz, agua) 
VALUES 
(3, 10, 50, 5000, 500, 115);

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(3, 'Coca-Cola', 'Torta Salgada', 'Left4Dead', 'American Pie 4', 'Unicórnio');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(7, 'Pepsi', 'Fandangos', 'GTA V', 'Velozes e Furiosos 3', 'Teddy Bear');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(5, 'Fanta Laranja', 'Bala Fini Banana', 'Smite', 'Star Wars', 'Coelho');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(9, 'Fanta Guaraná', 'Amendoim Doce', 'League of Legends', 'Hobbit', 'Veado');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(1, 'Água', 'Cheetos', 'GTA III', 'Percy Jackson', 'Tigrão');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(4, 'Crystal de Abacaxi', 'Bala Fini Beijinho', 'FIFA 19', 'Se Beber Não Case', 'Burro');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(6, 'Suco de Acerola', 'Pão Com Ovo', 'FIFA 21', 'O Livro de Eli', 'Anjo');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(8, 'Nescafé', 'Barra de Cereal', 'Toy Story 2', 'Jurassic Park', 'Dinossauro');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(2, 'Achocolatado', 'Bolacha Recheada', 'Blue VI', 'Vida De Inseto', 'Formiga');

INSERT INTO tiposconsumivel 
(FK_ID_Consumivel, bebidas, comidas, jogos, filmes, pelucia) 
VALUES 
(10, 'Chá Mate Leão', 'Biscoito De Polvilho', 'God Of War Ragnarok', 'Espartano', 'Guerreiro');


/*UPDATE's*/
UPDATE estabelecimento SET estado = 'RJ' WHERE ID_estabelecimento = 1;
UPDATE estabelecimento SET bairro = 'Ipanema' WHERE ID_estabelecimento = 2;
UPDATE estabelecimento SET nome = 'Boteco Belmonte' WHERE ID_estabelecimento = 3;
UPDATE estabelecimento SET endereço = 'Av. Vieira Souto, 236' WHERE ID_estabelecimento = 4;
UPDATE estabelecimento SET estado = 'SP', bairro = 'Santo Amaro', nome = 'Mc Donalds', endereço = 'SP-015' WHERE ID_estabelecimento = 5;

UPDATE consumivel SET preco = 18.99 WHERE ID_Consumivel = 1;
UPDATE consumivel SET preco = 2.49 WHERE ID_Consumivel = 2;
UPDATE consumivel SET preco = 25.50 WHERE ID_Consumivel = 3;
UPDATE consumivel SET preco = 2600.00 WHERE ID_Consumivel = 4;
UPDATE consumivel SET preco = 16.99 WHERE ID_Consumivel = 5;

UPDATE tiposConsumivel SET bebidas = 'Refrigerante' WHERE FK_ID_Consumivel = 1;
UPDATE tiposConsumivel SET filmes = 'Terror' WHERE FK_ID_Consumivel = 4;
UPDATE tiposConsumivel SET pelucia = 'Jogos de Tabuleiro' WHERE FK_ID_Consumivel = 5;
UPDATE tiposConsumivel SET bebidas = 'Energético' WHERE FK_ID_Consumivel = 7;
UPDATE tiposConsumivel SET comidas = 'Vegano' WHERE FK_ID_Consumivel = 9;

UPDATE cliente SET nome = 'Rogério Tergolina' WHERE ID_Cliente = 1;
UPDATE cliente SET dataNasc = '09/01/1983' WHERE ID_Cliente = 3;
UPDATE cliente SET CPF = '427.819.356-23' WHERE ID_Cliente = 5;
UPDATE cliente SET nome = 'Leandro da Silva' WHERE ID_Cliente = 7;
UPDATE cliente SET dataNasc = '15/05/2002' WHERE ID_Cliente = 9;

UPDATE livros set titulo = 'Aurora Boreal' WHERE ID_Livro = 1;
UPDATE livros set ano_lanc = '18/12/1557' WHERE ID_Livro = 8;
UPDATE livros set FK_ID_Autor = 10 WHERE ID_Livro = 5;
UPDATE livros set titulo = 'Lucas Neto' WHERE ID_Livro = 6;
UPDATE livros set titulo = 'Aurora Boreal 2' WHERE ID_Livro = 9;

UPDATE tipogenero SET acao =1 ,infantil = 1 WHERE ID_TIpoGenero = 4 ;
UPDATE tipogenero SET acao = 0, fantasia = 1, gastronomia = 1 WHERE ID_TIpoGenero = 8 ;
UPDATE tipogenero SET acao = 0, fantasia = 1, gastronomia = 1 WHERE ID_TIpoGenero = 10 ;
UPDATE tipogenero SET acao = 1, novela = 1, horror= 0 WHERE ID_TIpoGenero = 1 ;
UPDATE tipogenero SET religioso = 1 WHERE ID_TIpoGenero = 2;

UPDATE autor SET nacionalidade = 'Angolano' WHERE ID_Autor = 6;
UPDATE autor SET nacionalidade = 'Russa' WHERE ID_Autor = 1;
UPDATE autor SET nome = 'Jorge Mineirão' WHERE ID_Autor = 2;
UPDATE autor SET dataNasc = '11/01/2001' WHERE ID_Autor = 4;
UPDATE autor SET nacionalidade = 'Chilena' WHERE ID_Autor = 10;

UPDATE endereco SET bairro = 'Flamengo' WHERE ID_Endereco = 4;
UPDATE endereco SET estado = 'SC' WHERE ID_Endereco = 10;
UPDATE endereco SET complemento = 'Torre 5, 10º andar, apto 200' WHERE ID_Endereco = 1;
UPDATE endereco SET bairro = 'Ipês' WHERE ID_Endereco = 8;
UPDATE endereco SET cidade = 'Carmo do Rio Claro' WHERE ID_Endereco = 5;

UPDATE telefone SET telefone = '(35) 99834-1015' WHERE ID_Telefone = 5;
UPDATE telefone SET telefone = '(12) 98977-2934' WHERE ID_Telefone = 4;
UPDATE telefone SET telefone = '(34) 98810-9080' WHERE ID_Telefone = 8;
UPDATE telefone SET telefone = '(93) 99942-7028' WHERE ID_Telefone = 9;
UPDATE telefone SET telefone = '(11) 99972-6969' WHERE ID_Telefone = 7;

UPDATE compra SET valor = 179.90 WHERE ID_Compra = 5;
UPDATE compra SET valor = 67.30 WHERE ID_Compra IN (8,9);
UPDATE compra SET valor = 100.50 WHERE ID_Compra = 2;
UPDATE compra SET valor = 27.80 WHERE ID_Compra = 6;
UPDATE compra SET datas = '21/12/2001' WHERE ID_Compra = 1;

UPDATE funcionario SET datanasc = '21/12/2001' WHERE nome = 'Gabriel Alves';
UPDATE funcionario SET salario = 10500 WHERE ID_Funcionario IN (1, 2, 4, 9, 10);
UPDATE funcionario SET nome = 'Richarde' WHERE nome = 'Richard';
UPDATE funcionario SET datanasc = '19/10/2005' WHERE nome = 'Rafael Abrantes';
UPDATE funcionario SET nome = 'Paulo Vargas' WHERE ID_Funcionario = 5;

UPDATE colaborador SET endereço = 'JD. América, 200' WHERE ID_Colaborador = 2;
UPDATE colaborador SET estado = 'Mato Grosso' WHERE ID_Colaborador = 4;
UPDATE colaborador SET endereço = 'Rua Jatobá, 19' WHERE ID_Colaborador = 5;
UPDATE colaborador SET endereço = 'Honduras, 144' WHERE ID_Colaborador = 1;
UPDATE colaborador SET endereço = 'Rua Dom Bourbon, 1000' WHERE ID_Colaborador = 10;

UPDATE custos SET custosTotais = 2087.99 WHERE ID_Custos = 7;
UPDATE custos SET custosTotais = 47.90 WHERE ID_Custos = 6;
UPDATE custos SET custosTotais = 1000 WHERE ID_Custos = 7;
UPDATE custos SET custosTotais = 11560.30 WHERE ID_Custos = 5;
UPDATE custos SET custosTotais = 999.99 WHERE custosTotais - 100 < 55;

UPDATE tipocustos SET FK_ID_Custos = 1 WHERE ID_TipoCusto = 3;
UPDATE tipocustos SET estoque = 180 WHERE ID_TipoCusto = 7;
UPDATE tipocustos SET aluguel = 1900 WHERE aluguel = 900;
UPDATE tipocustos SET aluguel = 5002.75 WHERE estoque = 50;
UPDATE tipocustos SET luz = 200 WHERE ID_TipoCusto = 10;

UPDATE tiposconsumivel SET bebidas = 'Fanta Uva' WHERE bebidas = 'Fanta Guaraná';
UPDATE tiposconsumivel SET filmes = 'Jogos Vorazes' WHERE FK_ID_Consumivel = 6;
UPDATE tiposconsumivel SET comidas = 'Torta de Sorvete' WHERE ID_TipoConsumivel = 7;
UPDATE tiposconsumivel SET comidas = 'Bala Fini Ácida' WHERE comidas = 'Bala Fini Banana';
UPDATE tiposconsumivel SET jogos = 'Rio' WHERE FK_ID_Consumivel = 4;






DELETE FROM tiposConsumivel WHERE FK_ID_Consumivel = 6;
DELETE FROM tiposConsumivel WHERE FK_ID_Consumivel = 7;
DELETE FROM tiposConsumivel WHERE FK_ID_Consumivel = 8;
DELETE FROM tiposConsumivel WHERE FK_ID_Consumivel = 9;
DELETE FROM tiposConsumivel WHERE FK_ID_Consumivel = 10;


DELETE FROM colaborador WHERE ID_Colaborador = 1;
DELETE FROM colaborador WHERE ID_Colaborador = 3;
DELETE FROM colaborador WHERE ID_Colaborador = 6;
DELETE FROM colaborador WHERE endereço = 'Honduras, 144';
DELETE FROM colaborador WHERE estado = 'La Rosaleda (Espanha)';


DELETE FROM tipocustos WHERE ID_TipoCusto = 3;
DELETE FROM tipocustos WHERE ID_TipoCusto = 2;
DELETE FROM tipocustos WHERE ID_TipoCusto = 1;
DELETE FROM tipocustos WHERE funcionario = 3;
DELETE FROM tipocustos WHERE funcionario = 1;


DELETE FROM tipogenero WHERE ID_TipoGenero = 3;
DELETE FROM tipogenero WHERE ID_TipoGenero = 2;
DELETE FROM tipogenero WHERE ID_TipoGenero = 1;
DELETE FROM tipogenero WHERE ID_TipoGenero = 7;
DELETE FROM tipogenero WHERE ID_TipoGenero = 4;


DELETE FROM livros WHERE ID_Livro = 1;
DELETE FROM livros WHERE ID_Livro = 5;
DELETE FROM livros WHERE ID_Livro = 3;
DELETE FROM livros WHERE ID_Livro = 8;
DELETE FROM livros WHERE ID_Livro = 7;


DELETE FROM autor WHERE ID_Autor = 4;
DELETE FROM autor WHERE ID_Autor = 3;
DELETE FROM autor WHERE ID_Autor = 8;
DELETE FROM autor WHERE nome = 'Kali J.J';
DELETE FROM autor WHERE ID_Autor = 6;


DELETE FROM funcionario WHERE ID_Funcionario = 4;
DELETE FROM funcionario WHERE ID_Funcionario = 5;
DELETE FROM funcionario WHERE ID_Funcionario = 6;
DELETE FROM funcionario WHERE nome = 'Gabriel Alves';
DELETE FROM funcionario WHERE salario = 2000;


DELETE FROM endereco WHERE ID_Endereco = 1;
DELETE FROM endereco WHERE ID_Endereco = 4;
DELETE FROM endereco WHERE ID_Endereco = 3;
DELETE FROM endereco WHERE estado = 'Rj';
DELETE FROM endereco WHERE ID_Endereco = 2;


DELETE FROM telefone WHERE ID_Telefone = 2;
DELETE FROM telefone WHERE ID_Telefone = 9;
DELETE FROM telefone WHERE ID_Telefone = 10;
DELETE FROM telefone WHERE ID_Telefone = 7;
DELETE FROM telefone WHERE telefone = '(12) 98977-2934';


DELETE FROM compra WHERE ID_Compra = 10;
DELETE FROM compra WHERE ID_Compra = 1;
DELETE FROM compra WHERE ID_Compra = 2;
DELETE FROM compra WHERE ID_Compra = 6;
DELETE FROM compra WHERE datas = '21/12/2001';


DELETE FROM consumivel WHERE ID_Consumivel = 6;
DELETE FROM consumivel WHERE ID_Consumivel = 7;
DELETE FROM consumivel WHERE ID_Consumivel = 8;
DELETE FROM consumivel WHERE ID_Consumivel = 9;
DELETE FROM consumivel WHERE ID_Consumivel = 10;


DELETE FROM custos WHERE ID_Custos = 2;
DELETE FROM custos WHERE custosTotais = 340.1;
DELETE FROM custos WHERE custosTotais = 952;
DELETE FROM custos WHERE funcionario = 3;
DELETE FROM custos WHERE custosTotais = 999.99;


DELETE FROM cliente WHERE nome = 'Leandro da Silva';
DELETE FROM cliente WHERE ID_Cliente = 2;
DELETE FROM cliente WHERE ID_Cliente = 6;
DELETE FROM cliente WHERE ID_Cliente = 1;
DELETE FROM cliente WHERE CPF = '154.850.005-84';


DELETE FROM estabelecimento WHERE ID_estabelecimento = 6;
DELETE FROM estabelecimento WHERE ID_estabelecimento = 8;
DELETE FROM estabelecimento WHERE ID_estabelecimento = 9;
DELETE FROM estabelecimento WHERE ID_estabelecimento = 10;