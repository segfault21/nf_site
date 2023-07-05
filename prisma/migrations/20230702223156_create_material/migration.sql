-- CreateEnum
CREATE TYPE "MaterialStatus" AS ENUM ('CREATED', 'PAYMENT', 'DELYVERY', 'ACCEPT', 'OLD');

-- CreateEnum
CREATE TYPE "materialStore" AS ENUM ('ONLINE_SHOPS_MATERIAL', 'OFFLINE_SHOPS_MATERIAL', 'FORMATICA_BASE_MATERIAL', 'WILDBERRIES_MATERIAL');

-- CreateEnum
CREATE TYPE "materialUnits" AS ENUM ('wt', 'quantity');

-- CreateTable
CREATE TABLE "Material" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "number" SERIAL NOT NULL,
    "status" "MaterialStatus" NOT NULL DEFAULT 'CREATED',
    "store" "materialStore" NOT NULL DEFAULT 'ONLINE_SHOPS_MATERIAL',
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Material_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaterialItems" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "itemId" TEXT,
    "name" TEXT,
    "article" TEXT,
    "quantity" TEXT,
    "units" "materialUnits" NOT NULL DEFAULT 'quantity',
    "materialId" UUID NOT NULL,

    CONSTRAINT "MaterialItems_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MaterialItems" ADD CONSTRAINT "MaterialItems_materialId_fkey" FOREIGN KEY ("materialId") REFERENCES "Material"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
