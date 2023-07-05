/*
  Warnings:

  - You are about to drop the column `buyPrice` on the `Modification` table. All the data in the column will be lost.
  - You are about to drop the column `buyPrice` on the `Product` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Modification" DROP COLUMN "buyPrice";

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "buyPrice";
