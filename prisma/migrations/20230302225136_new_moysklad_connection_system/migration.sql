/*
  Warnings:

  - You are about to drop the column `moyskladId` on the `CustomEntity` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `CustomEntityValue` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `Modification` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `ModificationCharacteristic` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `PriceType` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `ProductGroup` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `item_actions_log` table. All the data in the column will be lost.
  - You are about to drop the column `moyskladId` on the `stored_item` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "CustomEntity_moyskladId_key";

-- DropIndex
DROP INDEX "CustomEntityValue_moyskladId_key";

-- DropIndex
DROP INDEX "CustomField_moyskladId_key";

-- DropIndex
DROP INDEX "Modification_moyskladId_key";

-- DropIndex
DROP INDEX "ModificationCharacteristic_moyskladId_key";

-- DropIndex
DROP INDEX "PriceType_moyskladId_key";

-- DropIndex
DROP INDEX "Product_moyskladId_key";

-- DropIndex
DROP INDEX "ProductGroup_moyskladId_key";

-- AlterTable
ALTER TABLE "CustomEntity" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "CustomEntityValue" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "CustomField" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "Modification" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "ModificationCharacteristic" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "PriceType" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "ProductGroup" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "item_actions_log" DROP COLUMN "moyskladId";

-- AlterTable
ALTER TABLE "stored_item" DROP COLUMN "moyskladId";

-- CreateTable
CREATE TABLE "MoyskladAccount" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MoyskladAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MoyskladLink" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "moyskladAccountId" UUID NOT NULL,
    "entityMoyskladId" TEXT NOT NULL,
    "productId" UUID,
    "modificationId" UUID,
    "productGroupId" UUID,
    "priceTypeId" UUID,
    "customFieldId" UUID,
    "customEntityId" UUID,
    "customEntityValueId" UUID,
    "modificationCharacteristicId" UUID,

    CONSTRAINT "MoyskladLink_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_moyskladAccountId_fkey" FOREIGN KEY ("moyskladAccountId") REFERENCES "MoyskladAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_productGroupId_fkey" FOREIGN KEY ("productGroupId") REFERENCES "ProductGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_priceTypeId_fkey" FOREIGN KEY ("priceTypeId") REFERENCES "PriceType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_customFieldId_fkey" FOREIGN KEY ("customFieldId") REFERENCES "CustomField"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_customEntityId_fkey" FOREIGN KEY ("customEntityId") REFERENCES "CustomEntity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_customEntityValueId_fkey" FOREIGN KEY ("customEntityValueId") REFERENCES "CustomEntityValue"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_modificationCharacteristicId_fkey" FOREIGN KEY ("modificationCharacteristicId") REFERENCES "ModificationCharacteristic"("id") ON DELETE SET NULL ON UPDATE CASCADE;
