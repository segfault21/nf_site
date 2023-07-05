/*
  Warnings:

  - A unique constraint covering the columns `[externalId]` on the table `Modification` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Modification" ALTER COLUMN "externalId" DROP DEFAULT;

-- CreateIndex
CREATE UNIQUE INDEX "Modification_externalId_key" ON "Modification"("externalId");
