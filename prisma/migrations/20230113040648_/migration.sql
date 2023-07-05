/*
  Warnings:

  - You are about to drop the `AssortmentUpdateLog` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "AssortmentLogType" AS ENUM ('CREATE', 'UPDATE');

-- DropForeignKey
ALTER TABLE "AssortmentUpdateLog" DROP CONSTRAINT "AssortmentUpdateLog_modificationId_fkey";

-- DropForeignKey
ALTER TABLE "AssortmentUpdateLog" DROP CONSTRAINT "AssortmentUpdateLog_productId_fkey";

-- DropForeignKey
ALTER TABLE "AssortmentUpdateLog" DROP CONSTRAINT "AssortmentUpdateLog_userId_fkey";

-- DropTable
DROP TABLE "AssortmentUpdateLog";

-- DropEnum
DROP TYPE "AssortmentUpdateLogType";

-- CreateTable
CREATE TABLE "AssortmentLog" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "changedFields" JSONB[],
    "type" "AssortmentLogType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" UUID NOT NULL,
    "productId" UUID,
    "modificationId" UUID,

    CONSTRAINT "AssortmentLog_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AssortmentLog" ADD CONSTRAINT "AssortmentLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AssortmentLog" ADD CONSTRAINT "AssortmentLog_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AssortmentLog" ADD CONSTRAINT "AssortmentLog_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;
