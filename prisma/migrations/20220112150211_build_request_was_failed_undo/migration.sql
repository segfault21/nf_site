/*
  Warnings:

  - You are about to drop the column `wasFailed` on the `build_request` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "build_request" DROP COLUMN "wasFailed";
