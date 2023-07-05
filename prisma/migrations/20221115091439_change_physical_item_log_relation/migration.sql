-- AlterEnum
ALTER TYPE "ProductInfoStatus" ADD VALUE 'OUTDATED';

-- DropForeignKey
ALTER TABLE "PhysicalItemLog" DROP CONSTRAINT "PhysicalItemLog_physicalItemId_fkey";

-- AddForeignKey
ALTER TABLE "PhysicalItemLog" ADD CONSTRAINT "PhysicalItemLog_physicalItemId_fkey" FOREIGN KEY ("physicalItemId") REFERENCES "PhysicalItem"("id") ON DELETE SET NULL ON UPDATE CASCADE;
