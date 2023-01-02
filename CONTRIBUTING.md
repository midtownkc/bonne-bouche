# Contribution Guide

- [Creating a Pull Request](#creating-a-pull-request)
- [Local Development Setup With Docker Compose](#local-development-setup-with-docker-compose)
- [Local Development Setup Without Docker Compose](#local-development-setup-with-docker-compose)
- [Running Tests](#running-tests)
- [Linting with Rubocop](#linting-with-rubocop)
- [Setup Required ENVs](#setup-required-envs)

## Creating a Pull Request

## Local Development Setup with Docker Compose

1. [Install Docker Desktop](https://www.docker.com/products/docker-desktop/)
1. Build Docker Images Locally: `docker compose build`
1. Create the database: `docker compose run web rails db:setup`
1. Create `.env` file and update its contents with valid secrets.  `cp .env.example .env`
1. Start containers `docker compose up`

## Local Development Setup Without Docker Compose

WIP

## Running Tests

Tests are run via [RSpec](https://rspec.info/).

  ```zsh
  # Docker
  docker compose run web bundle exec rspec

  # Local
  bundle exec rspec
  ```

## Linting with Rubocop

In order for the build to pass, the code must meet the standards from the Ruby Style Guide as enforced by rubocop.

  ```zsh
  # Docker
  docker compose run web rubocop

  # Local
  rubocop
  ```

## Setup Required ENVs

Copy default values from `.env.example` file:
```zsh
cp .env.example .env
```