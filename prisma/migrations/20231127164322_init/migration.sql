/*
  Warnings:

  - You are about to drop the `grupo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `professor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projetoInova` table. If the table is not empty, all the data it contains will be lost.
  - The primary key for the `Aluno` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `groupoId` on the `Aluno` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `Aluno` table. All the data in the column will be lost.
  - Added the required column `grupoId` to the `Aluno` table without a default value. This is not possible if the table is not empty.
  - The required column `idAluno` was added to the `Aluno` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.

*/
-- DropIndex
DROP INDEX "projetoInova_estante_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "grupo";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "professor";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "projetoInova";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Grupo" (
    "idGrupo" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "matriculaLider" INTEGER NOT NULL,
    "projetoInovaId" TEXT NOT NULL,
    CONSTRAINT "Grupo_projetoInovaId_fkey" FOREIGN KEY ("projetoInovaId") REFERENCES "ProjetoInova" ("idProjeto") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Professor" (
    "idProfessor" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "ProjetoInova" (
    "idProjeto" TEXT NOT NULL PRIMARY KEY,
    "nota" REAL NOT NULL,
    "estante" INTEGER NOT NULL,
    "grupoId" TEXT NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Aluno" (
    "idAluno" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,
    CONSTRAINT "Aluno_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo" ("idGrupo") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Aluno" ("matricula", "nome") SELECT "matricula", "nome" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_grupoId_key" ON "Aluno"("grupoId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "Grupo_projetoInovaId_key" ON "Grupo"("projetoInovaId");

-- CreateIndex
CREATE UNIQUE INDEX "ProjetoInova_estante_key" ON "ProjetoInova"("estante");
