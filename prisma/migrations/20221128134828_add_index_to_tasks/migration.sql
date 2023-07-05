-- CreateIndex
CREATE INDEX "task_status_retries_isBig_createdAt_idx" ON "task"("status", "retries", "isBig", "createdAt");
