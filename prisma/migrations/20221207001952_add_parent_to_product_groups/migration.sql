-- AlterTable
ALTER TABLE "ProductGroup" ADD COLUMN     "parentId" UUID;

-- AddForeignKey
ALTER TABLE "ProductGroup" ADD CONSTRAINT "ProductGroup_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "ProductGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;
