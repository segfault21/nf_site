ALTER TABLE "stored_item" DROP COLUMN IF EXISTS "group";
ALTER TABLE "stored_item" DROP COLUMN IF EXISTS "productType";

-- AlterTable
ALTER TABLE "stored_item" ADD COLUMN     "group" VARCHAR NOT NULL DEFAULT E'Нет группы',
ADD COLUMN     "productType" VARCHAR NOT NULL DEFAULT E'Нет типа';

-- CreateIndex
CREATE INDEX IF NOT EXISTS "task_createdat_index" ON "task"("createdAt");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "task_id_idx" ON "task"("id");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "task_run_taskId_idx" ON "task_run"("taskId");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "task_run_taskid_index" ON "task_run"("taskId");
