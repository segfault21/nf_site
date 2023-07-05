-- CreateIndex
CREATE INDEX "stored_item_site_active_isProduction_itemStatus_notForSewin_idx" ON "stored_item"("site", "active", "isProduction", "itemStatus", "notForSewing");
