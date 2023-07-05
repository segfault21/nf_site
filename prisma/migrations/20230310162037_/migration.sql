-- CreateIndex
CREATE INDEX "MoyskladChange_action_entityId_entityType_executedAt_idx" ON "MoyskladChange"("action", "entityId", "entityType", "executedAt");
