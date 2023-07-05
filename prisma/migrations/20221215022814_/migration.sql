/*
  Warnings:

  - You are about to drop the column `customEntityValueId` on the `CustomField` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "CustomField" DROP CONSTRAINT "CustomField_customEntityValueId_fkey";

-- AlterTable
ALTER TABLE "CustomField" DROP COLUMN "customEntityValueId";
