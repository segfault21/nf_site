/*
  Warnings:

  - A unique constraint covering the columns `[moyskladId]` on the table `CustomField` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "CustomField_moyskladId_key" ON "CustomField"("moyskladId");
