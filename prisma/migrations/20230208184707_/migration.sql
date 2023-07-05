-- CreateIndex
CREATE INDEX "Batch_number_idx" ON "Batch"("number");

-- CreateIndex
CREATE INDEX "Batch_number_type_idx" ON "Batch"("number", "type");

-- CreateIndex
CREATE INDEX "Batch_type_idx" ON "Batch"("type");
