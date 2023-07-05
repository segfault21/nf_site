-- AlterEnum
ALTER TYPE "CustomFieldType" ADD VALUE 'DATE';

-- AlterTable
ALTER TABLE "CustomFieldValue" ADD COLUMN     "dateValue" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
