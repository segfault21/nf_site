/*
  Warnings:

  - A unique constraint covering the columns `[externalId]` on the table `PriceType` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `externalId` to the `PriceType` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
DELETE FROM "PriceType";
ALTER TABLE "PriceType" ADD COLUMN     "externalId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "PriceType_externalId_key" ON "PriceType"("externalId");
