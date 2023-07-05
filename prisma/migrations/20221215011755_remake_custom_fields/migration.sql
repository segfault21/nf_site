/*
  Warnings:

  - The values [DICT] on the enum `CustomFieldType` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `dictValue` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the column `dictVariants` on the `CustomField` table. All the data in the column will be lost.
  - You are about to drop the `_CustomFieldToModification` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "CustomFieldType_new" AS ENUM ('STRING', 'NUMBER', 'BOOLEAN', 'CUSTOM');
ALTER TABLE "CustomField" ALTER COLUMN "type" TYPE "CustomFieldType_new" USING ("type"::text::"CustomFieldType_new");
ALTER TYPE "CustomFieldType" RENAME TO "CustomFieldType_old";
ALTER TYPE "CustomFieldType_new" RENAME TO "CustomFieldType";
DROP TYPE "CustomFieldType_old";
COMMIT;

-- DropForeignKey
ALTER TABLE "_CustomFieldToModification" DROP CONSTRAINT "_CustomFieldToModification_A_fkey";

-- DropForeignKey
ALTER TABLE "_CustomFieldToModification" DROP CONSTRAINT "_CustomFieldToModification_B_fkey";

-- AlterTable
ALTER TABLE "CustomField" DROP COLUMN "dictValue",
DROP COLUMN "dictVariants",
ADD COLUMN     "customEntityId" UUID,
ADD COLUMN     "customEntityValueId" UUID;

-- AlterTable
ALTER TABLE "Modification" ADD COLUMN     "color" TEXT,
ADD COLUMN     "size" TEXT;

-- DropTable
DROP TABLE "_CustomFieldToModification";

-- CreateTable
CREATE TABLE "CustomEntity" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "moyskladId" TEXT,
    "name" TEXT NOT NULL,

    CONSTRAINT "CustomEntity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomEntityValue" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "value" TEXT NOT NULL,
    "moyskladId" TEXT,
    "customEntityId" UUID NOT NULL,

    CONSTRAINT "CustomEntityValue_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CustomEntity_moyskladId_key" ON "CustomEntity"("moyskladId");

-- AddForeignKey
ALTER TABLE "CustomEntityValue" ADD CONSTRAINT "CustomEntityValue_customEntityId_fkey" FOREIGN KEY ("customEntityId") REFERENCES "CustomEntity"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomField" ADD CONSTRAINT "CustomField_customEntityId_fkey" FOREIGN KEY ("customEntityId") REFERENCES "CustomEntity"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomField" ADD CONSTRAINT "CustomField_customEntityValueId_fkey" FOREIGN KEY ("customEntityValueId") REFERENCES "CustomEntityValue"("id") ON DELETE SET NULL ON UPDATE CASCADE;
