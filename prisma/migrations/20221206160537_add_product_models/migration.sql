-- CreateEnum
CREATE TYPE "CustomFieldType" AS ENUM ('STRING', 'NUMBER', 'BOOLEAN', 'DICT');

-- CreateTable
CREATE TABLE "ProductGroup" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,

    CONSTRAINT "ProductGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PriceType" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,

    CONSTRAINT "PriceType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductPrice" (
    "value" DOUBLE PRECISION NOT NULL,
    "priceTypeId" UUID NOT NULL,
    "productId" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "CustomField" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" "CustomFieldType" NOT NULL,
    "requiredForProduct" BOOLEAN NOT NULL DEFAULT false,
    "requiredForModification" BOOLEAN NOT NULL DEFAULT false,
    "dictVariants" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "dictValue" TEXT NOT NULL DEFAULT '',
    "stringValue" TEXT NOT NULL DEFAULT '',
    "numericValue" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "boolValue" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "CustomField_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "images" TEXT[],
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "weight" DOUBLE PRECISION,
    "volume" DOUBLE PRECISION,
    "article" TEXT NOT NULL,
    "baseProductId" UUID,
    "productGroupId" UUID,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Modification" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "images" TEXT[],
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "article" TEXT NOT NULL,
    "baseProductId" UUID,
    "baseModificationId" UUID,

    CONSTRAINT "Modification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CustomFieldToProduct" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_CustomFieldToModification" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "ProductPrice_priceTypeId_productId_key" ON "ProductPrice"("priceTypeId", "productId");

-- CreateIndex
CREATE UNIQUE INDEX "CustomField_code_key" ON "CustomField"("code");

-- CreateIndex
CREATE UNIQUE INDEX "_CustomFieldToProduct_AB_unique" ON "_CustomFieldToProduct"("A", "B");

-- CreateIndex
CREATE INDEX "_CustomFieldToProduct_B_index" ON "_CustomFieldToProduct"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_CustomFieldToModification_AB_unique" ON "_CustomFieldToModification"("A", "B");

-- CreateIndex
CREATE INDEX "_CustomFieldToModification_B_index" ON "_CustomFieldToModification"("B");

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_priceTypeId_fkey" FOREIGN KEY ("priceTypeId") REFERENCES "PriceType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_baseProductId_fkey" FOREIGN KEY ("baseProductId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_productGroupId_fkey" FOREIGN KEY ("productGroupId") REFERENCES "ProductGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Modification" ADD CONSTRAINT "Modification_baseProductId_fkey" FOREIGN KEY ("baseProductId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Modification" ADD CONSTRAINT "Modification_baseModificationId_fkey" FOREIGN KEY ("baseModificationId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CustomFieldToProduct" ADD CONSTRAINT "_CustomFieldToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES "CustomField"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CustomFieldToProduct" ADD CONSTRAINT "_CustomFieldToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CustomFieldToModification" ADD CONSTRAINT "_CustomFieldToModification_A_fkey" FOREIGN KEY ("A") REFERENCES "CustomField"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CustomFieldToModification" ADD CONSTRAINT "_CustomFieldToModification_B_fkey" FOREIGN KEY ("B") REFERENCES "Modification"("id") ON DELETE CASCADE ON UPDATE CASCADE;
