/*
  Warnings:

  - Added the required column `context` to the `PhysicalItemLog` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "PhysicalItemLog" ADD COLUMN     "context" JSONB;
