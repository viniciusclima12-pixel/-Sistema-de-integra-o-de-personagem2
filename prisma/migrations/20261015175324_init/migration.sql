-- CreateTable
CREATE TABLE "Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Personagem" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "idade" INTEGER,
    "poder" TEXT,
    "descricao" TEXT,
    "usuarioId" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_PersonagemToUsuario" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_PersonagemToUsuario_A_fkey" FOREIGN KEY ("A") REFERENCES "Personagem" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_PersonagemToUsuario_B_fkey" FOREIGN KEY ("B") REFERENCES "Usuario" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_PersonagemToUsuario_AB_unique" ON "_PersonagemToUsuario"("A", "B");

-- CreateIndex
CREATE INDEX "_PersonagemToUsuario_B_index" ON "_PersonagemToUsuario"("B");
