-- DropForeignKey
ALTER TABLE "MoyskladChange" DROP CONSTRAINT "MoyskladChange_moyskladAccountId_fkey";

-- AlterTable
ALTER TABLE "MoyskladChange" ALTER COLUMN "moyskladAccountId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "MoyskladChange" ADD CONSTRAINT "MoyskladChange_moyskladAccountId_fkey" FOREIGN KEY ("moyskladAccountId") REFERENCES "MoyskladAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;
