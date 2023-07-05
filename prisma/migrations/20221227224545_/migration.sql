-- DropForeignKey
ALTER TABLE "CustomFieldValue" DROP CONSTRAINT "CustomFieldValue_customFieldId_fkey";

-- AddForeignKey
ALTER TABLE "CustomFieldValue" ADD CONSTRAINT "CustomFieldValue_customFieldId_fkey" FOREIGN KEY ("customFieldId") REFERENCES "CustomField"("id") ON DELETE CASCADE ON UPDATE CASCADE;
