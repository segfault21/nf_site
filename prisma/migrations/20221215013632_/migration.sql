/*
  Warnings:

  - You are about to drop the column `boolValue` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the column `numericValue` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the column `stringValue` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the `_CustomFieldToProduct` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_CustomFieldToProduct" DROP CONSTRAINT "_CustomFieldToProduct_A_fkey";

-- DropForeignKey
ALTER TABLE "_CustomFieldToProduct" DROP CONSTRAINT "_CustomFieldToProduct_B_fkey";

-- AlterTable
ALTER TABLE "CustomField" DROP COLUMN "boolValue",
DROP COLUMN "numericValue",
DROP COLUMN "stringValue";

-- DropTable
DROP TABLE "_CustomFieldToProduct";

-- CreateTable
CREATE TABLE "CustomFieldValue" (
    "stringValue" TEXT NOT NULL DEFAULT '',
    "numericValue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "boolValue" BOOLEAN NOT NULL DEFAULT false,
    "customEntityValueId" UUID,
    "customFieldId" UUID NOT NULL,
    "productId" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "CustomFieldValue_customFieldId_productId_key" ON "CustomFieldValue"("customFieldId", "productId");

-- AddForeignKey
ALTER TABLE "CustomFieldValue" ADD CONSTRAINT "CustomFieldValue_customFieldId_fkey" FOREIGN KEY ("customFieldId") REFERENCES "CustomField"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomFieldValue" ADD CONSTRAINT "CustomFieldValue_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomFieldValue" ADD CONSTRAINT "CustomFieldValue_customEntityValueId_fkey" FOREIGN KEY ("customEntityValueId") REFERENCES "CustomEntityValue"("id") ON DELETE SET NULL ON UPDATE CASCADE;
