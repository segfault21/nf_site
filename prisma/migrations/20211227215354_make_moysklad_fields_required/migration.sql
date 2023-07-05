/*
  Warnings:

  - Made the column `moyskladPositionId` on table `stored_item` required. This step will fail if there are existing NULL values in that column.
  - Made the column `moyskladType` on table `stored_item` required. This step will fail if there are existing NULL values in that column.
  - Made the column `moyskladId` on table `stored_item` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "stored_item" ALTER COLUMN "moyskladPositionId" SET NOT NULL,
ALTER COLUMN "moyskladType" SET NOT NULL,
ALTER COLUMN "moyskladId" SET NOT NULL;
