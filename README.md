# Projeto Final bootcamp MeLi

## Documentação (Swagger)

A documentação da API pode ser visualizada através do Swagger em:
```
http://prod_joao-projetofinal-bootcamp.furyapps.io/swagger-ui.html
```

## Link da applicação
```
https://prod_joao-projetofinal-bootcamp.furyapps.io/
```

## Postman
Para importar a *collection* deste projeto em seu *Postman* ou *Insomnia*, importe o arquivo `local-postman-collection.json` para
testes locais ou `prod-postman-collection.json` para testar diretamente no fury! Estes arquivo encontram-se na pasta *resources*.
Para **prod-postman-collection**, os pre-scripts de autenticação no postman devem estar corretos 
(username e password do fury devem estar setados no pre-script na raiz da coleção e para cada request, o pre-script da 
autenticação da aplicação deve possuir o usuario correto, com permissao para aquele endpoint).

## Dump SQL (para testes locais)

Para importar o banco deste projeto em seu ambiente local, importe o arquivo `sql-dump.sql`.
Este arquivo encontra-se na pasta *resources*.

## Run (para testes locais)
Para iniciar, abra o projeto no *IntelliJ*, aguarde ele instalar todas as dependências e defina as variáveis de ambiente para:

Nome | Valor
--- | ---
SCOPE | local
LOCAL_DB_USER | Usuário do banco local
LOCAL_DB_PASS | Senha do banco local
LOCAL_DB_HOST | Host do banco local
LOCAL_DB_SCHEMA | project_team_5_dh*
LOCAL_DB_PORT | Porta do banco local
SECRET_JWT | iy8921y7uihkjasb

* Caso não esteja usando o *dump* do banco, trocar para o *schema* apropriado.

## Requisitos implementados

* **US0001/POST (api/v1/fresh-products/inboundorder):** cadastrar um lote com produtos que o compõe;
* **US0001/PUT (api/v1/fresh-products/inboundorder):** atualizar um lote ja cadastrado;
* **US0002/GET (api/v1/fresh-products):** listar produtos cadastrados;
* **US0002/GET (api/v1/fresh-products/list?category):** listar produtos cadastrados por categoria;
* **US0002/POST (api/v1/fresh-products/orders):** registrar uma ordem de compra;
* **US0002/GET (fresh-products/orders?orderId):** visualizar produtos de uma ordem de compra;
* **US0002/PUT (fresh-products/orders?orderId):**  editar uma ordem de compra;
* **US0003/GET (api/v1/fresh-products/representative/list?productId):** listar os lotes pertencentes a um produto;
* **US0003/GET (api/v1/fresh-products/representative/list?productId&orderBy):** listar os lotes pertencentes a um produto por categoria;
* **US0004/GET (api/v1/fresh-products/warehouse?productId):** retornar quantidade total de um produto em um armazem;
* **US0005/GET (api/v1/fresh-products/due-date?days):** retornar lotes de um setor;
* **US0005/GET (api/v1/fresh-products/due-date?days&category):** retornar lotes de um setor por categoria, quantidade de dias e ordem alfabetica;

## Requisito adicional

* Foi adicionado encriptação de senha a partir do BCrypt e role de ADMIN.
* Listar usuários por país/GET (https://prod_joao-projetofinal-bootcamp.furyapps.io/api/v1/admin/user?country).
* Cadastro de usuário/POST (https://prod_joao-projetofinal-bootcamp.furyapps.io/api/v1/admin/user):

```json
{
  "role": "BUYER",
  "country": "BRAZIL",
  "warehouseId": "fecaec1a-8da0-4c04-8a58-c31529ed5980",
  "username": "userTeste",
  "password": "3d!@asdaSsdaSDs"
}
```

Restrições:
- O country, role e o warehouse informados devem existir;
- O country do usuario deve ser o mesmo da warehouse;
- Username não pode estar em uso; 
- O password tem que ter letras maiusculas, minusculas, caracter especial e deve estar entre 8 e 20 caracteres;

## Informações adicionais:
* O login estava sendo realizado a partir de dois parâmetros enviados no endpoint. Por questões de segurança, modifiquei para que estes
  parâmetros fossem enviados através de uma request body.
* **Configuração dos pre-scripts do postman precisam estar corretos**
* **Ficar atento ao country (deve ser o mesmo para usuario e para warehouse)**
* **Ficar atento à data de vencimento de cada produto (eles podem não ser retornados)**
* **Para o requisito 1:** *currentTemperature* de um produto não pode ser menor que a temperatura mínima ou maior que a 
  temperatura maxima do seu setor; *duedate* tem que ser maior que *manufacturingtime* se não o produto está estragado 
  e não deve ser cadastrado; duedate também tem que ser maior que a data atual.
* **Para o requisito 2 / rota 3:** o id da compra também esta sendo retornado na response apenas para facilitar os testes
  nos endpoints que necessitam do id da compra (para evitar ter que consultá-lo no banco).
  
**ROLES DE USUARIO:**

Nome | Valor
--- | --- | 
REPRESENTATIVE | 0 |
BUYER | 1 |
ADMIN | 2 |


**COUNTRIES CADASTRADOS:**

Nome | Valor
--- | --- | 
ARGENTINA | 0 |
BOLIVIA | 1 |
BRAZIL | 2 |
CHILE | 3 |
COLOMBIA | 4 |
COSTA_RICA | 5 |
ECUADOR | 6 |
EL_SALVADOR | 7 |
GUATEMALA | 8 |
HONDURAS | 9 |
MEXICO | 10 |
NICARAGUA | 11 |
PANAMA | 12 |
PARAGUAY | 13 |
PERU | 14 |
DOMINICAN_REPUBLIC | 15 |
URUGUAY | 16 |
VENEZUELA | 17 |


## FURY DOCUMENTATION

# Spring Boot App model for Java 11

We provide a basic model for JDK 11 / Spring based web applications.

Please address any questions and comments to [Fury Issue Tracker](https://github.com/mercadolibre/fury/issues).

## Usage

### SCOPE

The suffix of each Fury **SCOPE** is used to know which properties file to use, it is identified from the last '-' of the name of the scope.

If you want to run the application from your development IDE, you need to configure the environment variable **SCOPE=local** in the app luncher.

The properties of **application.yml** are always loaded and at the same time they are complemented with **application-<SCOPE_SUFFIX>.yml** properties. If a property is in both files, the one that is configured in **application-<SCOPE_SUFFIX>.yml** has preference over the property of **application.yml**.

For example, for the **SCOPE** 'items-loader-test' the **SCOPE_SUFFIX** would be 'test' and the loaded property files will be **application.yml** and **application-test.yml**

### Web Server

Each Spring Boot web application includes an embedded web server. For servlet stack applications, Its supports three web Servers:
  * Tomcat (maven dependency: `spring-boot-starter-tomcat`)
  * Jetty (maven dependency: `spring-boot-starter-jetty`)
  * Undertow (maven dependency: `spring-boot-starter-undertow`)

This project is configured with Jetty, but to exchange WebServer, it is enough to configure the dependencies mentioned above in the pom.xml file.

### Main

The main class for this app is Application, where Spring context is initialized and SCOPE_SUFFIX is generated.

### Error Handling

We also provide basic handling for exceptions in ControllerExceptionHandler class.

## Api Documentation

This project uses Springfox to automate the generation of machine and human readable specifications for JSON APIs written using Spring. Springfox works by examining an application, once, at runtime to infer API semantics based on spring configurations, class structure and various compile time java Annotations.

You can change this configuration in SpringfoxConfig class.

## [Release Process](https://release-process.furycloud.io/#/)

### Usage

1. Specify the correct tag for your app in your `Dockerfile` and `Dockerfile.runtime`, according to the desired Java runtime version.

```
# Dockerfile
FROM hub.furycloud.io/mercadolibre/java:1.11-mini
```

You can find all available tags for your `Dockerfile` [here](https://github.com/mercadolibre/fury_java-mini#supported-tags)

```
# Dockerfile.runtime
FROM hub.furycloud.io/mercadolibre/java:1.11-runtime-mini
```

You can find all available tags for your `Dockerfile.runtime` [here](https://github.com/mercadolibre/fury_java-mini-runtime#supported-tags).

2. Start coding!

### Questions

[Release Process Issue Tracker](https://github.com/mercadolibre/fury_release-process/issues)

Req 1.
