-- AlterTable
ALTER TABLE "ProductInfo" ADD COLUMN     "brand" TEXT,
ADD COLUMN     "category" TEXT,
ADD COLUMN     "collection" TEXT,
ADD COLUMN     "cut" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "dtf" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "firstStep" TEXT,
ADD COLUMN     "productType" TEXT,
ADD COLUMN     "productionMethod" TEXT,
ADD COLUMN     "secondStep" TEXT,
ADD COLUMN     "thirdStep" TEXT;
