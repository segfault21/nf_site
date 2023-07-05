-- CreateIndex
CREATE INDEX "stored_item_orderId_orderNumber_active_idx" ON "stored_item"("orderId", "orderNumber", "active");
