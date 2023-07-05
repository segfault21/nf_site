/*
  Warnings:

  - You are about to drop the column `preset` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the column `buyPrice` on the `Modification` table. All the data in the column will be lost.
  - You are about to drop the column `preset` on the `ModificationCharacteristic` table. All the data in the column will be lost.
  - You are about to drop the column `preset` on the `PriceType` table. All the data in the column will be lost.
  - You are about to drop the column `buyPrice` on the `Product` table. All the data in the column will be lost.
  - Made the column `moyskladId` on table `ModificationCharacteristic` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX IF EXISTS "CustomEntity_name_key";

-- DropIndex
DROP INDEX IF EXISTS "CustomEntityValue_customEntityId_value_key";

-- DropIndex
DROP INDEX IF EXISTS "CustomField_name_key";

-- DropIndex
DROP INDEX IF EXISTS "ModificationCharacteristic_name_key";

-- DropIndex
DROP INDEX IF EXISTS "PriceType_name_key";

-- DropIndex
DROP INDEX IF EXISTS "ProductGroup_pathName_key";

-- AlterTable
ALTER TABLE "CustomEntity" ALTER COLUMN "name" SET DEFAULT '';

-- AlterTable
ALTER TABLE "CustomField" DROP COLUMN IF EXISTS "preset";

-- AlterTable
ALTER TABLE "Modification" DROP COLUMN IF EXISTS "buyPrice";

-- AlterTable
ALTER TABLE "ModificationCharacteristic" DROP COLUMN IF EXISTS "preset",
ALTER COLUMN "moyskladId" SET NOT NULL;

-- AlterTable
ALTER TABLE "PriceType" DROP COLUMN IF EXISTS "preset";

-- AlterTable
ALTER TABLE "Product" DROP COLUMN IF EXISTS "buyPrice";

-- DropEnum
DROP TYPE IF EXISTS "AssortmentFieldPreset";

-- DropEnum
DROP TYPE IF EXISTS "PriceTypePreset";
