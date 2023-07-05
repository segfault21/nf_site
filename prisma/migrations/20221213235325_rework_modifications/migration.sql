/*
  Warnings:

  - You are about to drop the column `baseModificationId` on the `Modification` table. All the data in the column will be lost.
  - You are about to drop the column `baseProductId` on the `Modification` table. All the data in the column will be lost.
  - You are about to drop the column `baseProductId` on the `Product` table. All the data in the column will be lost.
  - Added the required column `productId` to the `Modification` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Modification" DROP CONSTRAINT "Modification_baseModificationId_fkey";

-- DropForeignKey
ALTER TABLE "Modification" DROP CONSTRAINT "Modification_baseProductId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_baseProductId_fkey";

-- AlterTable
ALTER TABLE "Modification" DROP COLUMN "baseModificationId",
DROP COLUMN "baseProductId",
ADD COLUMN     "baseId" UUID,
ADD COLUMN     "productId" UUID NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "baseProductId";

-- AddForeignKey
ALTER TABLE "Modification" ADD CONSTRAINT "Modification_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Modification" ADD CONSTRAINT "Modification_baseId_fkey" FOREIGN KEY ("baseId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;
