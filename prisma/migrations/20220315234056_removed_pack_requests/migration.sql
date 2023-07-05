/*
  Warnings:

  - You are about to drop the `pack_request` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `productName` to the `TransferRequest` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "pack_request" DROP CONSTRAINT "FK_d8b5ae5c32bc0d2a635103fe253";

-- DropForeignKey
ALTER TABLE "pack_request" DROP CONSTRAINT "FK_ab7a304889a6eb705c9e34c1d01";

-- AlterTable
ALTER TABLE "TransferRequest" ADD COLUMN     "productName" TEXT NOT NULL,
ALTER COLUMN "id" SET DEFAULT uuid_generate_v4();

-- DropTable
DROP TABLE "pack_request";
