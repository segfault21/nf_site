/*
  Warnings:

  - You are about to drop the column `wasReserved` on the `PhysicalItem` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "PhysicalItem" DROP COLUMN "wasReserved",
ADD COLUMN     "reservedFrom" "Store";
