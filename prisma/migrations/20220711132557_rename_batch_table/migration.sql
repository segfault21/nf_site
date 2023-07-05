/*
  Warnings:

  - You are about to drop the `batch` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Acceptance" DROP CONSTRAINT "Acceptance_batchId_fkey";

-- DropForeignKey
ALTER TABLE "BatchLog" DROP CONSTRAINT "BatchLog_batchId_fkey";

-- DropForeignKey
ALTER TABLE "BatchLog" DROP CONSTRAINT "BatchLog_newBatchId_fkey";

-- DropForeignKey
ALTER TABLE "SewingItem" DROP CONSTRAINT "SewingItem_batchId_fkey";

-- DropForeignKey
ALTER TABLE "batch" DROP CONSTRAINT "FK_cd203de35ad146448672593faae";

-- DropForeignKey
ALTER TABLE "item_actions_log" DROP CONSTRAINT "PK_57da3b830b57bec1fd329dcaf43";

-- DropForeignKey
ALTER TABLE "stored_item" DROP CONSTRAINT "PK_57da3b830b57bec1fd329dcaf43";

UPDATE item_actions_log SET "batchId" = NULL;
UPDATE stored_item SET "batchId" = NULL;

-- DropTable
DROP TABLE "batch";

-- CreateTable
CREATE TABLE "Batch" (
    "number" SERIAL NOT NULL,
    "comment" VARCHAR,
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" UUID,
    "status" "BatchStatus" NOT NULL DEFAULT 'CREATED',
    "type" "batch_type_enum" NOT NULL DEFAULT 'default',

    CONSTRAINT "Batch_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Acceptance" ADD CONSTRAINT "Acceptance_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "Batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Batch" ADD CONSTRAINT "Batch_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatchLog" ADD CONSTRAINT "BatchLog_newBatchId_fkey" FOREIGN KEY ("newBatchId") REFERENCES "Batch"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatchLog" ADD CONSTRAINT "BatchLog_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "Batch"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "item_actions_log" ADD CONSTRAINT "item_actions_log_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "Batch"("id") ON DELETE SET NULL ON UPDATE SET NULL;

-- AddForeignKey
ALTER TABLE "stored_item" ADD CONSTRAINT "PK_57da3b830b57bec1fd329dcaf43" FOREIGN KEY ("batchId") REFERENCES "Batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "SewingItem" ADD CONSTRAINT "SewingItem_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "Batch"("id") ON DELETE CASCADE ON UPDATE CASCADE;
