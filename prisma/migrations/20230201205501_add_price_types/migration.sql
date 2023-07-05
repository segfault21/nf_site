-- CreateEnum
CREATE TYPE "PriceTypePreset" AS ENUM ('PRIME', 'DROPSHIPPING', 'TECH', 'SEW_BUY');

-- CreateEnum
CREATE TYPE "AssortmentFieldPreset" AS ENUM ('SIZE', 'COLOR', 'CRM_EXPORT', 'BRAND', 'COLLECTION', 'CATEGORY', 'PRODUCTION_METHOD', 'PRESS_COUNT', 'PRODUCT_TYPE', 'NOT_FOR_SEWING', 'DIGITAL_PRINT', 'FIRST_STEP', 'SECOND_STEP', 'THIRD_STEP', 'KULIR_CONSUMPTION', 'DOUBLE_THREAD_CONSUMPTION', 'DTF_CONSUMPTION', 'FOOTER_CONSUMPTION', 'LIMITED');

-- AlterTable
ALTER TABLE "CustomField" ADD COLUMN     "preset" "AssortmentFieldPreset";

-- AlterTable
ALTER TABLE "ModificationCharacteristic" ADD COLUMN     "preset" "AssortmentFieldPreset";

-- AlterTable
ALTER TABLE "PriceType" ADD COLUMN     "preset" "PriceTypePreset";
