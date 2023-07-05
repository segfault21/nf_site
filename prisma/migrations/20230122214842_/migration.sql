/*
  Warnings:

  - You are about to drop the column `targetId` on the `ModificationPrice` table. All the data in the column will be lost.
  - You are about to drop the column `targetId` on the `ProductPrice` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "ModificationPrice" DROP CONSTRAINT "ModificationPrice_targetId_fkey";

-- DropForeignKey
ALTER TABLE "ProductPrice" DROP CONSTRAINT "ProductPrice_targetId_fkey";

-- AlterTable
ALTER TABLE "ModificationPrice" DROP COLUMN "targetId",
ADD COLUMN     "productId" UUID,
ADD COLUMN     "targetModificationId" UUID,
ADD COLUMN     "targetProductId" UUID;

-- AlterTable
ALTER TABLE "ProductPrice" DROP COLUMN "targetId",
ADD COLUMN     "targetModificationId" UUID,
ADD COLUMN     "targetProductId" UUID;

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_targetProductId_fkey" FOREIGN KEY ("targetProductId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_targetModificationId_fkey" FOREIGN KEY ("targetModificationId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_targetModificationId_fkey" FOREIGN KEY ("targetModificationId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_targetProductId_fkey" FOREIGN KEY ("targetProductId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;
