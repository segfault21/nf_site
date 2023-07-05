-- AlterTable
ALTER TABLE "Modification" ADD COLUMN     "moyskladId" TEXT;

-- AlterTable
ALTER TABLE "PriceType" ADD COLUMN     "moyskladId" TEXT;

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "moyskladId" TEXT;

-- AlterTable
ALTER TABLE "ProductGroup" ADD COLUMN     "moyskladId" TEXT;
