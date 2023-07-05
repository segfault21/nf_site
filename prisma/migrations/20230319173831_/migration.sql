/*
  Warnings:

  - A unique constraint covering the columns `[externalId]` on the table `CustomEntityValue` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "CustomEntityValue_externalId_key" ON "CustomEntityValue"("externalId");
