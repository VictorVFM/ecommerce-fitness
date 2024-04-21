# API REST Ecommerce Fitness

Bem-vindo à API REST Ecommerce Fitness! Esta API é responsável por gerenciar os recursos relacionados a um ecommerce fitness, como produtos, pedidos, clientes, etc.

## Instruções para Execução

Para executar a aplicação, siga os passos abaixo:

### 1. Docker Compose

Certifique-se de ter o Docker e o Docker Compose instalados em sua máquina. Em seguida, execute o comando abaixo para iniciar os serviços necessários:
```bash
docker-compose up -d
```
Este comando irá iniciar os serviços necessários, como o banco de dados MySQL, e deixá-los rodando em segundo plano (`-d`).

### 2. Maven Spring Boot

Para executar a aplicação Spring Boot, você pode usar o comando Maven apropriado.Execute o seguinte comando:
```bash
mvn spring-boot:run
```
Este comando irá compilar e executar a aplicação Spring Boot, que estará disponível para acesso através da URL `http://localhost:8080`.
