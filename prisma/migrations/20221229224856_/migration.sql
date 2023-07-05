-- DropForeignKey
ALTER TABLE "CustomEntityValue" DROP CONSTRAINT "CustomEntityValue_customEntityId_fkey";

-- DropForeignKey
ALTER TABLE "CustomField" DROP CONSTRAINT "CustomField_customEntityId_fkey";

-- AddForeignKey
ALTER TABLE "CustomEntityValue" ADD CONSTRAINT "CustomEntityValue_customEntityId_fkey" FOREIGN KEY ("customEntityId") REFERENCES "CustomEntity"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomField" ADD CONSTRAINT "CustomField_customEntityId_fkey" FOREIGN KEY ("customEntityId") REFERENCES "CustomEntity"("id") ON DELETE CASCADE ON UPDATE CASCADE;
