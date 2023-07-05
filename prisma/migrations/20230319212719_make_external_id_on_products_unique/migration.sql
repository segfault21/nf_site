/*
  Warnings:

  - A unique constraint covering the columns `[externalId]` on the table `Product` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Product" ALTER COLUMN "externalId" DROP DEFAULT;

-- CreateIndex
CREATE UNIQUE INDEX "Product_externalId_key" ON "Product"("externalId");
