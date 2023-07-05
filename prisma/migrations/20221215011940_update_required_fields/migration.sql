/*
  Warnings:

  - You are about to drop the column `requiredForModification` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the column `requiredForProduct` on the `CustomField` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "CustomField" DROP COLUMN "requiredForModification",
DROP COLUMN "requiredForProduct",
ADD COLUMN     "required" BOOLEAN NOT NULL DEFAULT false;
