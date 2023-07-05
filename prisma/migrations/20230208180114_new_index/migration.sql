-- CreateIndex
CREATE INDEX "stored_item_offerExternalId_itemSku_itemStatus_id_isProduct_idx" ON "stored_item"("offerExternalId", "itemSku", "itemStatus", "id", "isProduction", "active", "site");
