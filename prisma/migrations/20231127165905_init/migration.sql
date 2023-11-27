-- CreateTable
CREATE TABLE "ProfessorOnProjetoInova" (
    "professorId" TEXT NOT NULL,
    "projetoInovaId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("professorId", "projetoInovaId"),
    CONSTRAINT "ProfessorOnProjetoInova_professorId_fkey" FOREIGN KEY ("professorId") REFERENCES "Professor" ("idProfessor") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ProfessorOnProjetoInova_projetoInovaId_fkey" FOREIGN KEY ("projetoInovaId") REFERENCES "ProjetoInova" ("idProjeto") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "AlunoOnProjetoInova" (
    "alunoId" TEXT NOT NULL,
    "projetoInovaId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY ("alunoId", "projetoInovaId"),
    CONSTRAINT "AlunoOnProjetoInova_alunoId_fkey" FOREIGN KEY ("alunoId") REFERENCES "Aluno" ("idAluno") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AlunoOnProjetoInova_projetoInovaId_fkey" FOREIGN KEY ("projetoInovaId") REFERENCES "ProjetoInova" ("idProjeto") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Professor" (
    "idProfessor" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Professor" ("idProfessor", "matricula") SELECT "idProfessor", "matricula" FROM "Professor";
DROP TABLE "Professor";
ALTER TABLE "new_Professor" RENAME TO "Professor";
CREATE TABLE "new_Aluno" (
    "idAluno" TEXT NOT NULL PRIMARY KEY,
    "matricula" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "grupoId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Aluno_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES "Grupo" ("idGrupo") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Aluno" ("grupoId", "idAluno", "matricula", "nome") SELECT "grupoId", "idAluno", "matricula", "nome" FROM "Aluno";
DROP TABLE "Aluno";
ALTER TABLE "new_Aluno" RENAME TO "Aluno";
CREATE UNIQUE INDEX "Aluno_grupoId_key" ON "Aluno"("grupoId");
CREATE TABLE "new_ProjetoInova" (
    "idProjeto" TEXT NOT NULL PRIMARY KEY,
    "nota" REAL NOT NULL,
    "estante" INTEGER NOT NULL,
    "grupoId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_ProjetoInova" ("estante", "grupoId", "idProjeto", "nota") SELECT "estante", "grupoId", "idProjeto", "nota" FROM "ProjetoInova";
DROP TABLE "ProjetoInova";
ALTER TABLE "new_ProjetoInova" RENAME TO "ProjetoInova";
CREATE UNIQUE INDEX "ProjetoInova_estante_key" ON "ProjetoInova"("estante");
CREATE TABLE "new_Grupo" (
    "idGrupo" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "matriculaLider" INTEGER NOT NULL,
    "projetoInovaId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Grupo_projetoInovaId_fkey" FOREIGN KEY ("projetoInovaId") REFERENCES "ProjetoInova" ("idProjeto") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Grupo" ("idGrupo", "matriculaLider", "nome", "projetoInovaId") SELECT "idGrupo", "matriculaLider", "nome", "projetoInovaId" FROM "Grupo";
DROP TABLE "Grupo";
ALTER TABLE "new_Grupo" RENAME TO "Grupo";
CREATE UNIQUE INDEX "Grupo_projetoInovaId_key" ON "Grupo"("projetoInovaId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
