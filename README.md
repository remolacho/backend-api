# README

   Repo semilla o fork para tener las configuraciones basicas en la creacion de una API, este viene con Auth, Test, Redis, Email, Manejo de erroreres, Politicas de permisos y roles

## Ruby versión
   - 2.6.5

## Dependencias del sistema
   - devise
   - devise jwt
   - rspec
   - swagger
    
## Configuración
   - copiar contenido del application.yml.example a application.yml
   - bundle install
   
## Creación de la DB
   - rake db:create
   - rake db:migrate
   - rake db:seed

## Como correr los test?
   - rails g rswag:install 
   - definir en el application yml USER_SWAG, PASS_SWAG y asignar el valor deseado 
   - rails rswag:specs:swaggerize (correra los test y a su ves creara la documentacion)
   - rails g rspec:swagger namespace::controller_name 
   - rspec