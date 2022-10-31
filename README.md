> Work in progress (Not complete API yet)

# README

Twitter clone made with Ruby on Rails, GraphQL, RSpec, PostgreSql, and Docker compose.

# Development Steps

How I developed this api with all step by step setup from ground up is mentioned in this **[doc](https://sulmanweb.notion.site/Twitter-Clone-GQL-API-364cdab8b28a4b7e870d019f4cf87761)**.

# Used Technologies

- Ruby 3.1.2
- Rails 7.0.4
- Docker Compose
- PostgreSql 15
- Rspec (Test driven development)

# License
[MIT](https://github.com/sulmanweb/Twitter-Clone-GQL-ROR-API/blob/main/LICENSE)

---

# How to run this project

- Must have docker installed on your machine
- Clone this repo
- Run `docker-compose up --build` in your terminal
- Run `docker-compose run --rm api rails db:create db:migrate` in your terminal
- Go to `localhost:3000` in your browser
- To Run test cases run `docker-compose run --rm api rspec`

---

