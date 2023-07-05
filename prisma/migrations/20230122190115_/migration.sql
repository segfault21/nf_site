-- DropForeignKey
ALTER TABLE "ModificationPrice" DROP CONSTRAINT "ModificationPrice_targetId_fkey";

-- DropForeignKey
ALTER TABLE "ProductPrice" DROP CONSTRAINT "ProductPrice_targetId_fkey";

-- AlterTable
ALTER TABLE "ModificationPrice" ADD COLUMN     "targetTypeId" UUID;

-- AlterTable
ALTER TABLE "ProductPrice" ADD COLUMN     "targetTypeId" UUID;

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_targetTypeId_fkey" FOREIGN KEY ("targetTypeId") REFERENCES "PriceType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_targetTypeId_fkey" FOREIGN KEY ("targetTypeId") REFERENCES "PriceType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;
