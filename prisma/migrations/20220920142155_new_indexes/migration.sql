-- CreateIndex
CREATE INDEX "item_actions_log_itemId_itemIndex_orderId_idx" ON "item_actions_log"("itemId", "itemIndex", "orderId");

-- CreateIndex
CREATE INDEX "item_actions_log_itemId_itemIndex_orderId_date_idx" ON "item_actions_log"("itemId", "itemIndex", "orderId", "date");

-- CreateIndex
CREATE INDEX "stored_item_itemId_itemIndex_orderId_idx" ON "stored_item"("itemId", "itemIndex", "orderId");
