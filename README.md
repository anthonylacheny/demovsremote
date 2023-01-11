# Symfony VSCODE REMOTE

Demo project Symfony and Visual Studio Code Remote Development.

The project will use Docker images : 
- PHP8.1-apache-bullseye
- Postgres14.2-bullseye
- Adminer

Symfony Framework (version 6.2)

For more details you can take a look on the **docker-compose.yml** file, **.devcontainer** folder and **.vscode** folder. 

## Install

1. Install VSCode **Remote Development** extension
2. Clone git repo and open it with Visual Studio Dev Container.
3. Modify **env** files (.env, docker-postgres.env)
4. Open **vscode terminal** and run `composer db:migrate && db:fixtures`

## Start server

- Execute "launch" from VS Code (you can execure the debugger too)

## Test

Navigate on [http://localhost:port/product/5](http://localhost:port/product/5)