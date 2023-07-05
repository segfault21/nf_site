/*
  Warnings:

  - Added the required column `type` to the `AssortmentUpdateLog` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "AssortmentUpdateLogType" AS ENUM ('CREATE', 'UPDATE');

-- AlterTable
ALTER TABLE "AssortmentUpdateLog" ADD COLUMN     "type" "AssortmentUpdateLogType" NOT NULL;
