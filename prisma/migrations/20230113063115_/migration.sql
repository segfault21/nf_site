/*
  Warnings:

  - A unique constraint covering the columns `[moyskladId]` on the table `ModificationCharacteristic` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "ModificationCharacteristic_moyskladId_key" ON "ModificationCharacteristic"("moyskladId");
