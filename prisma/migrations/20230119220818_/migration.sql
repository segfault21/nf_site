-- DropForeignKey
ALTER TABLE "Modification" DROP CONSTRAINT "Modification_productId_fkey";

-- DropForeignKey
ALTER TABLE "ModificationCharacteristicValue" DROP CONSTRAINT "ModificationCharacteristicValue_modificationCharacteristic_fkey";

-- DropForeignKey
ALTER TABLE "ModificationCharacteristicValue" DROP CONSTRAINT "ModificationCharacteristicValue_modificationId_fkey";

-- AddForeignKey
ALTER TABLE "Modification" ADD CONSTRAINT "Modification_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationCharacteristicValue" ADD CONSTRAINT "ModificationCharacteristicValue_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationCharacteristicValue" ADD CONSTRAINT "ModificationCharacteristicValue_modificationCharacteristic_fkey" FOREIGN KEY ("modificationCharacteristicId") REFERENCES "ModificationCharacteristic"("id") ON DELETE CASCADE ON UPDATE CASCADE;
