/*
  Warnings:

  - The `doubleThreadConsumption` column on the `stored_item` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `footerConsumption` column on the `stored_item` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `kulirConsumption` column on the `stored_item` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "stored_item" DROP COLUMN "doubleThreadConsumption",
ADD COLUMN     "doubleThreadConsumption" DOUBLE PRECISION,
DROP COLUMN "footerConsumption",
ADD COLUMN     "footerConsumption" DOUBLE PRECISION,
DROP COLUMN "kulirConsumption",
ADD COLUMN     "kulirConsumption" DOUBLE PRECISION;
