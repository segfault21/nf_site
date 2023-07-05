/*
  Warnings:

  - You are about to drop the column `color` on the `Modification` table. All the data in the column will be lost.
  - You are about to drop the column `size` on the `Modification` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Modification" DROP COLUMN "color",
DROP COLUMN "size";

-- CreateTable
CREATE TABLE "ModificationCharacteristic" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "moyskladId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "required" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModificationCharacteristic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModificationCharacteristicValue" (
    "value" TEXT NOT NULL,
    "modificationId" UUID NOT NULL,
    "modificationCharacteristicId" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "ModificationCharacteristicValue_modificationId_modification_key" ON "ModificationCharacteristicValue"("modificationId", "modificationCharacteristicId");

-- AddForeignKey
ALTER TABLE "ModificationCharacteristicValue" ADD CONSTRAINT "ModificationCharacteristicValue_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationCharacteristicValue" ADD CONSTRAINT "ModificationCharacteristicValue_modificationCharacteristic_fkey" FOREIGN KEY ("modificationCharacteristicId") REFERENCES "ModificationCharacteristic"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
