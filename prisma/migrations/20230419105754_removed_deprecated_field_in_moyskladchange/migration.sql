/*
  Warnings:

  - You are about to drop the column `moyskladAccountId` on the `MoyskladChange` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "MoyskladChange" DROP CONSTRAINT "MoyskladChange_moyskladAccountId_fkey";

-- AlterTable
ALTER TABLE "MoyskladChange" DROP COLUMN "moyskladAccountId";
