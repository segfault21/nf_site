-- AlterTable
ALTER TABLE "item_actions_log" ADD COLUMN     "batchId" UUID;

-- AlterTable
ALTER TABLE "stored_item" ADD COLUMN     "batchId" UUID;

-- AddForeignKey
ALTER TABLE "item_actions_log" ADD CONSTRAINT "PK_57da3b830b57bec1fd329dcaf43" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stored_item" ADD CONSTRAINT "PK_57da3b830b57bec1fd329dcaf43" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
