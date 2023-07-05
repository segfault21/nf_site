/*
  Warnings:

  - A unique constraint covering the columns `[moyskladId]` on the table `CustomEntityValue` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "CustomEntityValue_moyskladId_key" ON "CustomEntityValue"("moyskladId");
