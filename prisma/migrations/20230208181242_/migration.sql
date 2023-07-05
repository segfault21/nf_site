-- CreateIndex
CREATE INDEX "stored_item_active_itemStatus_isProduction_offerExternalId__idx" ON "stored_item"("active", "itemStatus", "isProduction", "offerExternalId", "id", "site");
