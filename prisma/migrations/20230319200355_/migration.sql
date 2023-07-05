/*
  Warnings:

  - You are about to drop the column `code` on the `CustomField` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "CustomField_code_key";

-- AlterTable
ALTER TABLE "CustomField" DROP COLUMN "code";
