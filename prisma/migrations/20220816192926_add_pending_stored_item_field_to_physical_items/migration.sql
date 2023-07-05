-- AlterTable
ALTER TABLE "PhysicalItem" ADD COLUMN     "pendingStoredItemId" UUID;

-- AddForeignKey
ALTER TABLE "PhysicalItem" ADD CONSTRAINT "PhysicalItem_pendingStoredItemId_fkey" FOREIGN KEY ("pendingStoredItemId") REFERENCES "stored_item"("id") ON DELETE SET NULL ON UPDATE CASCADE;
