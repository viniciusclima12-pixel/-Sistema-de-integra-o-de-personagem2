/*
  Warnings:

  - You are about to drop the `_PersonagemToUsuario` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `usuarioId` on the `Personagem` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "_PersonagemToUsuario_B_index";

-- DropIndex
DROP INDEX "_PersonagemToUsuario_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_PersonagemToUsuario";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Personagem" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "idade" INTEGER,
    "poder" TEXT,
    "descricao" TEXT
);
INSERT INTO "new_Personagem" ("descricao", "id", "idade", "nome", "poder") SELECT "descricao", "id", "idade", "nome", "poder" FROM "Personagem";
DROP TABLE "Personagem";
ALTER TABLE "new_Personagem" RENAME TO "Personagem";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
