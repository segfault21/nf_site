/*
  Warnings:

  - Added the required column `externalId` to the `ProductGroup` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
DELETE FROM "ProductGroup";
ALTER TABLE "ProductGroup" ADD COLUMN     "externalId" TEXT NOT NULL;
