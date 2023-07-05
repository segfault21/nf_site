/*
  Warnings:

  - Added the required column `code` to the `CustomEntityValue` table without a default value. This is not possible if the table is not empty.
  - Added the required column `externalId` to the `CustomEntityValue` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
DELETE FROM "CustomEntityValue";
ALTER TABLE "CustomEntityValue" ADD COLUMN     "code" TEXT NOT NULL,
ADD COLUMN     "externalId" TEXT NOT NULL;
