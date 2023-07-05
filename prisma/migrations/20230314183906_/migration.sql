/*
  Warnings:

  - A unique constraint covering the columns `[externalId]` on the table `ProductGroup` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "ProductGroup_externalId_key" ON "ProductGroup"("externalId");
