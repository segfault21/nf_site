/*
  Warnings:

  - The values [SEWN] on the enum `SewingItemStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
ALTER TYPE "SewingItemStatus" RENAME VALUE 'SEWING' TO 'CUT';
ALTER TYPE "SewingItemStatus" RENAME VALUE 'SEWN' TO 'SEWING';
ALTER TYPE "SewingItemStatus" ADD VALUE 'READY_FOR_ACCEPTANCE';
COMMIT;
