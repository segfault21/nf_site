-- CreateIndex
CREATE INDEX "PhysicalItem_id_pendingStoredItemId_store_idx" ON "PhysicalItem"("id", "pendingStoredItemId", "store");

-- CreateIndex
CREATE INDEX "PhysicalItem_pendingStoredItemId_store_idx" ON "PhysicalItem"("pendingStoredItemId", "store");
