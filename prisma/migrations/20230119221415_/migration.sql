-- DropForeignKey
ALTER TABLE "CustomFieldValue" DROP CONSTRAINT "CustomFieldValue_customEntityValueId_fkey";

-- DropForeignKey
ALTER TABLE "CustomFieldValue" DROP CONSTRAINT "CustomFieldValue_productId_fkey";

-- AddForeignKey
ALTER TABLE "CustomFieldValue" ADD CONSTRAINT "CustomFieldValue_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomFieldValue" ADD CONSTRAINT "CustomFieldValue_customEntityValueId_fkey" FOREIGN KEY ("customEntityValueId") REFERENCES "CustomEntityValue"("id") ON DELETE CASCADE ON UPDATE CASCADE;
