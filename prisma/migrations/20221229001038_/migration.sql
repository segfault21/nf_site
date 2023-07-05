-- DropForeignKey
ALTER TABLE "ModificationPrice" DROP CONSTRAINT "ModificationPrice_modificationId_fkey";

-- DropForeignKey
ALTER TABLE "ModificationPrice" DROP CONSTRAINT "ModificationPrice_priceTypeId_fkey";

-- DropForeignKey
ALTER TABLE "ProductPrice" DROP CONSTRAINT "ProductPrice_priceTypeId_fkey";

-- DropForeignKey
ALTER TABLE "ProductPrice" DROP CONSTRAINT "ProductPrice_productId_fkey";

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_priceTypeId_fkey" FOREIGN KEY ("priceTypeId") REFERENCES "PriceType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_priceTypeId_fkey" FOREIGN KEY ("priceTypeId") REFERENCES "PriceType"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE CASCADE ON UPDATE CASCADE;
