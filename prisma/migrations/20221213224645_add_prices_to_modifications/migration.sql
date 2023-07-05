-- CreateTable
CREATE TABLE "ModificationPrice" (
    "value" DOUBLE PRECISION NOT NULL,
    "priceTypeId" UUID NOT NULL,
    "modificationId" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "ModificationPrice_priceTypeId_modificationId_key" ON "ModificationPrice"("priceTypeId", "modificationId");

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_priceTypeId_fkey" FOREIGN KEY ("priceTypeId") REFERENCES "PriceType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
