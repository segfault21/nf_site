/*
  Warnings:

  - You are about to drop the `Shipment` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `productExternalCode` to the `PhysicalItemLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productName` to the `PhysicalItemLog` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "PhysicalItemMovementDocumentType" AS ENUM ('ENTER', 'LOSS');

-- AlterEnum
ALTER TYPE "PhysicalItemLogAction" ADD VALUE 'DELETE';

-- DropForeignKey
ALTER TABLE "PhysicalItem" DROP CONSTRAINT "PhysicalItem_shipmentId_fkey";

-- DropForeignKey
ALTER TABLE "Shipment" DROP CONSTRAINT "Shipment_userId_fkey";

-- AlterTable
ALTER TABLE "PhysicalItemLog" ADD COLUMN     "physicalItemMovementDocumentId" UUID,
ADD COLUMN     "productArticle" TEXT DEFAULT '',
ADD COLUMN     "productExternalCode" TEXT NOT NULL DEFAULT '',
ADD COLUMN     "productName" TEXT NOT NULL DEFAULT '',
ALTER COLUMN "physicalItemId" DROP NOT NULL;

ALTER TABLE "PhysicalItemLog"
ALTER COLUMN     "productArticle" DROP DEFAULT,
ALTER COLUMN     "productExternalCode" DROP DEFAULT,
ALTER COLUMN     "productName" DROP DEFAULT;

-- DropTable
DROP TABLE "Shipment";

-- CreateTable
CREATE TABLE "PhysicalItemMovementDocument" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "number" SERIAL NOT NULL,
    "type" "PhysicalItemMovementDocumentType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" UUID NOT NULL,

    CONSTRAINT "PhysicalItemMovementDocument_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "PhysicalItemLog" ADD CONSTRAINT "PhysicalItemLog_physicalItemMovementDocumentId_fkey" FOREIGN KEY ("physicalItemMovementDocumentId") REFERENCES "PhysicalItemMovementDocument"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItemMovementDocument" ADD CONSTRAINT "PhysicalItemMovementDocument_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
