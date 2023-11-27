--- Configuração do vs code
1: Prisma
2: Prisma - Insider
3: DotENV
4: SQLite Viewer
5: ThunderCliente
6: vscode-icons

--------------------

--- Passos no terminal:
//(QUICKSTART PRISMA)
    1 passo:
    npm init -y 
    2 passo: 
    npm install typescript ts-node @types/node --save-dev 
    3 passo:
    npx tsc --init 
    4 passo:
    npm install prisma --save-dev 
    5 passo: 
    npx prisma init --datasource-provider sqlite 
//(FIM DO QUICKSTART PRISMA)´
Baixar o microframework express
    6 passo:
    npm install express @types/express
Baixar o EJS: // EJS é uma forma de criar um html
    7 passo:
    npm install ejs

--------------------
-- Manual de alterações em base do microframework express

--------------------
-- Manual de alterações em base do ejs

--------------------
--- Manual de uso thunder cliente
O thunder cliente fornce os comandos padrões
Get, Put, Post, Delete
(outros, nao usado nesse projeto: PATCH, HEAD, OPTIONS)

não ira funcionar se o servidor não estiver funcioando
/////
COMANDO PARA ATIIVAR O SERVIDOR
npx ts-node src\app.ts
 para ativar o servidor
////
 Oque defini qual url será utilizado no thunder cliente é o o url do servidor, neste caso localhost:3000/ [COMANDO QUE SERA EXECUTADO]
 ...Sobre [COMANDO QUYE SERA EXECUTADO]
    ele é definido na rota(routes)
    router.get('/[COMANDO QUE SERA EXECUTADO]', async (req: Request, res: Response) => {...};
    obs: router.[TIPO DE COMANDO]
    exemplo de comando: 
    router.get('/leiloes', async (req: Request, res: Response) => {...};
    usando ele no thunder 

--------------------
--- configuração de arquivos: 
"src" - Mantera os arquivo em ordem
{tsconfig.json
// alterações realizadas
LINHA [29] "rootDir": "./src",                                  /* Specify the root folder within your source files. */
LINHA [58] "outDir": "./dist",                                   /* Specify an output folder for all emitted files. */
}

--------------------

/////
COMANDO PARA ATIIVAR O SERVIDOR
npx ts-node app.ts 
 para ativar o servidor
////
--------
