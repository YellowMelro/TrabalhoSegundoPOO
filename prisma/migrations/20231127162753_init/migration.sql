-- CreateTable
CREATE TABLE "Aluno" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "groupoId" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "grupo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "matriculaLider" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "professor" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "projetoInova" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nota" REAL NOT NULL,
    "estante" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "projetoInova_estante_key" ON "projetoInova"("estante");
