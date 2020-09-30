Acessar no Heroku: https://bzumpano-nexaas.herokuapp.com/

# Instalação

## Dependências
- Ruby MRI 2.5.3
- Rails 5.2.4.4
- PostgreSQL 12.4
- Redis 4.0+

## Configuração do projeto
- Faça o clone do projeto para sua máquina
```bash
git clone git@github.com:bzumpano/nexaas.git
cd nexaas/
```

- Instale o `bundler`
```bash
gem install bundler -v 2.1.4
```

- Execute
```bash
bundle install
```

## Banco de dados
Para realizar a configuração inicial execute o comando:
```bash
bundle exec rake db:setup
```


# Acessando a plataforma

- Para iniciar o servidor execute:
```bash
rails server
```

- As operações de adição/remoção de itens do estoque são feitas em segundo plano utilizando o [Sidekiq](https://github.com/mperham/sidekiq). Para iniciá-lo execute:
```bash
bundle exec sidekiq
```


# API

## Produtos

### Criação
```
Method: POST
url: /products
```
Exemplo:
```bash
curl -v --header "Content-Type: application/json" -X POST -d '{"product":{"name":"Copo","price":"1.5"}}' https://bzumpano-nexaas.herokuapp.com/products
< HTTP/1.1 201 Created
< Content-Type: application/json; charset=utf-8
< ETag: W/"d2baaf0d20079f2e5aeb3bf820d44cb4"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 14d51d73-26e3-4b0d-a505-befa34b5e666
< X-Runtime: 0.162723
< Transfer-Encoding: chunked
<
{"id":1,"name":"Copo","price":"1.5"}
```

### Consulta
```
Method: GET
url: /products/:id
```
Exemplo:
```bash
curl -v https://bzumpano-nexaas.herokuapp.com/products/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"d2baaf0d20079f2e5aeb3bf820d44cb4"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: a2a8c4f2-43df-4b99-b9bc-91a8794642de
< X-Runtime: 0.015915
< Transfer-Encoding: chunked
<
{"id":1,"name":"Copo","price":"1.5"}
```

### Atualização
```
Method: PATCH/PUT
url: /products/:id
accepted params: product: [name, price]
```
Exemplo:
```bash
curl -v --header "Content-Type: application/json" -X PATCH -d '{"product":{"name":"Copo pequeno","price":"1.5"}}' https://bzumpano-nexaas.herokuapp.com/products/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"dbace6fc5574d8f36b83b83ac96c1234"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 882584a6-ac06-4d24-bb40-4fef0e5ecd39
< X-Runtime: 0.014507
< Transfer-Encoding: chunked
<
{"id":1,"name":"Copo pequeno","price":"1.5"}
```

### Remoção
```
Method: DELETE
url: /products/:id
accepted params: product: [name, price]
```
Exemplo:
```bash
curl -v -X DELETE https://bzumpano-nexaas.herokuapp.com/products/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"aa0ea39ee928c2512655fa8e2c796529"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 1021d693-79b7-457d-96ba-a43cb31999db
< X-Runtime: 0.023150
< Transfer-Encoding: chunked
<
{"id":1,"name":"Copo pequeno","price":"1.5"}
```

## Lojas

### Criação
```
Method: POST
url: /stores
accepted params: store: [name]
```
Exemplo:
```bash
curl -v --header "Content-Type: application/json" -X POST -d '{"store":{"name":"Loja 1"}}' https://bzumpano-nexaas.herokuapp.com/stores
< HTTP/1.1 201 Created
< Content-Type: application/json; charset=utf-8
< ETag: W/"8e559f1e52074543063646a4dcb41d0e"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 3b2f724f-758c-4d8f-b480-007d3ee7c5e5
< X-Runtime: 0.042360
< Transfer-Encoding: chunked
<
{"id":1,"name":"Loja 1"}
```

### Consulta
```
Method: GET
url: /stores/:id
```
Exemplo:
```bash
curl -v https://bzumpano-nexaas.herokuapp.com/stores/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"8e559f1e52074543063646a4dcb41d0e"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 962f931f-6708-4681-9aa7-d962ca431fac
< X-Runtime: 0.004667
< Transfer-Encoding: chunked
<
{"id":1,"name":"Loja 1"}
```

### Atualização
```
Method: PATCH/PUT
url: /stores/:id
accepted params: store: [name]
```
Exemplo:
```bash
curl -v --header "Content-Type: application/json" -X PATCH -d '{"store":{"name":"Filial 1"}}' https://bzumpano-nexaas.herokuapp.com/stores/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"d295b9512549676de0cda82be5dad72a"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 2c2c3e5e-d3b8-44f2-bc48-2fcedf59afeb
< X-Runtime: 0.011180
< Transfer-Encoding: chunked
<
{"id":1,"name":"Filial 1"}
```

### Remoção
```
Method: DELETE
url: /stores/:id
accepted params: store: [name]
```
Exemplo:
```bash
curl -v -X DELETE https://bzumpano-nexaas.herokuapp.com/stores/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"d295b9512549676de0cda82be5dad72a"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: a48098bb-b7af-4958-86c2-5aa405a805bf
< X-Runtime: 0.013464
< Transfer-Encoding: chunked
<
{"id":1,"name":"Filial 1"}
```


## Estoque

### Criação
```
Method: POST
url: /stock_items
accepted params: stock_item: [store_id, product_id]
```
Exemplo:
```bash
curl -v --header "Content-Type: application/json" -X POST -d '{"stock_item":{"store_id":1, "product_id":1}}' https://bzumpano-nexaas.herokuapp.com/stock_items
< HTTP/1.1 201 Created
< Content-Type: application/json; charset=utf-8
< ETag: W/"6d2b927b8c1333b8d1ea8d3457ed54d3"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 0c6cb964-a8b6-4546-ba3e-b2259a9821f6
< X-Runtime: 0.032057
< Transfer-Encoding: chunked
<
{"id":1,"store_id":1,"product_id":1,"amount":0}
```

### Consulta
```
Method: GET
url: /stock_items/:id
```
Exemplo:
```bash
curl -v https://bzumpano-nexaas.herokuapp.com/stock_items/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"6d2b927b8c1333b8d1ea8d3457ed54d3"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: c9be619e-0019-4e05-ac12-a974424b3290
< X-Runtime: 0.004158
< Transfer-Encoding: chunked
<
{"id":1,"store_id":1,"product_id":1,"amount":0}
```

## Entrada de Estoque

### Criação
Esse processo é executado em segundo plano para garantir integridade em um ambiente concorrente. Para verificar se a requisição foi processada é necessário fazer a consulta com o id.
```
Method: POST
url: /stock_items/:stock_item_id/inputs
accepted params: input: [amount]
```
Exemplo:
```bash
curl -v --header "Content-Type: application/json" -X POST -d '{"input":{"amount":1}}' https://bzumpano-nexaas.herokuapp.com/stock_items/1/inputs
< HTTP/1.1 201 Created
< Content-Type: application/json; charset=utf-8
< ETag: W/"4f9c8bda67faea8c474c3dc4ccf69eaf"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 474cf9a7-62ad-4725-8973-f1dbbe243625
< X-Runtime: 0.113528
< Transfer-Encoding: chunked
<
{"id":1,"amount":1,"status":"Pendente"}
```

### Consulta
```
Method: GET
url: /stock_items/:stock_item_id/inputs/:id
```
Exemplo:
```bash
curl -v https://bzumpano-nexaas.herokuapp.com/stock_items/1/inputs/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"4f9c8bda67faea8c474c3dc4ccf69eaf"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 1499765e-ca2f-413e-b21d-f2ade1caf31a
< X-Runtime: 0.009469
< Transfer-Encoding: chunked
<
{"id":1,"amount":1,"status":"Pendente"}
```


## Saída de Estoque

### Criação
Esse processo é executado em segundo plano para garantir integridade em um ambiente concorrente. Para verificar se a requisição foi processada é necessário fazer a consulta com o id.
```
Method: POST
url: /stock_items/:stock_item_id/outputs
accepted params: output: [amount]
```
Exemplo:
```bash
curl -v --header "Content-Type: application/json" -X POST -d '{"output":{"amount":1}}' https://bzumpano-nexaas.herokuapp.com/stock_items/1/outputs
< HTTP/1.1 201 Created
< Content-Type: application/json; charset=utf-8
< ETag: W/"17d701437723b40ae39f082041e8def5"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: 3948fa87-f06a-4adf-ab03-f5e5fb391fc0
< X-Runtime: 0.037850
< Transfer-Encoding: chunked
<
{"id":2,"amount":1,"status":"Pendente"}
```

### Consulta
```
Method: GET
url: /stock_items/:stock_item_id/outputs/:id
```
Exemplo:
```bash
curl -v https://bzumpano-nexaas.herokuapp.com/stock_items/1/outputs/1
< HTTP/1.1 200 OK
< Content-Type: application/json; charset=utf-8
< ETag: W/"4b0dccc485f47ea698abb17f4e2af7db"
< Cache-Control: max-age=0, private, must-revalidate
< X-Request-Id: f379835c-3990-4cad-ba2f-fb8fedbd3801
< X-Runtime: 0.003543
< Transfer-Encoding: chunked
<
{"id":1,"amount":1,"status":"Sucesso"}
```
