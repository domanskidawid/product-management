# Product management application
It's a simple application for product management to demonstrate a nice project organization.

## Author's note
- The tasks I got were pretty easy, so I figured you meant more about organizations, good practices, tests, and clean code.
- I know that generated code can be problematic but if you stick to some limitation you can get a lot of benefits
- I know that for a small application you can have only 2 layers, but here I want to show you a solution for the bigger one.
- Consumed time: 8h

## I didn't do it because of time
- I shouldn't use entity field names in the frontend
- In tests, I didn't check all values because I just want to demo the general concept, and the ability to use various tools.

## Technologies: 
- Java 11 
- Spring
- Liquibase
- Mapstruct
- Lombok
- PostgreSql
- Docker
- Typescript
- React
- Bootstrap 4
- OpenApi 3
- Swagger Codegen   

## Quick start

- Run `docker-compose up`
- Build the backend `mvn clean install`
- Run the backend, starter class: `ProductManagementApplication`
- Check API `http://localhost:8080/swagger-ui.html`
- Build the frontend `npm install` in `./src/main/webapp/front-product-management` 
- Run the frontend `npm start`
- Go to `http://localhost:3000`

## Required features

- Pull a set of products from a persistence layer
- List the above products in a UI
- Sort the products by Name, Size, and Category in the UI
- Keep the products persisted even after the application has shutdown
