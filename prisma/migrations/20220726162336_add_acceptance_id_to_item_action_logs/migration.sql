-- AlterTable
ALTER TABLE "item_actions_log" ADD COLUMN     "acceptanceId" UUID;

-- AddForeignKey
ALTER TABLE "item_actions_log" ADD CONSTRAINT "item_actions_log_acceptanceId_fkey" FOREIGN KEY ("acceptanceId") REFERENCES "Acceptance"("id") ON DELETE SET NULL ON UPDATE SET NULL;
