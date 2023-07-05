/*
  Warnings:

  - A unique constraint covering the columns `[moyskladId]` on the table `Modification` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[moyskladId]` on the table `PriceType` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[moyskladId]` on the table `Product` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[moyskladId]` on the table `ProductGroup` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Modification_moyskladId_key" ON "Modification"("moyskladId");

-- CreateIndex
CREATE UNIQUE INDEX "PriceType_moyskladId_key" ON "PriceType"("moyskladId");

-- CreateIndex
CREATE UNIQUE INDEX "Product_moyskladId_key" ON "Product"("moyskladId");

-- CreateIndex
CREATE UNIQUE INDEX "ProductGroup_moyskladId_key" ON "ProductGroup"("moyskladId");
