/*
  Warnings:

  - You are about to drop the column `version` on the `batch` table. All the data in the column will be lost.
  - You are about to drop the column `version` on the `container_tag` table. All the data in the column will be lost.
  - You are about to drop the column `reserveType` on the `item_actions_log` table. All the data in the column will be lost.
  - You are about to drop the column `productionMethodId` on the `stored_item` table. All the data in the column will be lost.
  - You are about to drop the column `reserveType` on the `stored_item` table. All the data in the column will be lost.
  - You are about to drop the column `version` on the `stored_item_log` table. All the data in the column will be lost.
  - You are about to drop the column `version` on the `task` table. All the data in the column will be lost.
  - You are about to drop the column `version` on the `task_run` table. All the data in the column will be lost.
  - You are about to drop the `TransferRequest` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `acceptance` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `acceptance_item` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `acceptance_log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `batch_log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `build_request` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `colelction_item_log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `import_error` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `moysklad_product_cache` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `moysklad_techcard_cache` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `moysklad_variant_cache` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `print_request` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `production_method` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "AcceptanceLogAction" AS ENUM ('CREATE', 'COMMENT', 'COLLECT_ONE', 'FAIL_ONE');

-- CreateEnum
CREATE TYPE "BatchLogAction" AS ENUM ('CREATE', 'SEPARATE', 'EXTEND', 'COMMENT', 'ACCEPT_ALL', 'SEW_ONE', 'UNSEW_ONE', 'DELETE_ONE', 'ACCEPT_ONE');

-- CreateEnum
CREATE TYPE "PhysicalItemLogAction" AS ENUM ('CREATE', 'MOVE');

-- CreateEnum
CREATE TYPE "SewingItemStatus" AS ENUM ('SEWING', 'SEWN', 'WAITING_ACCEPTANCE', 'COLLECTED', 'FAILED_REMAKE', 'FAILED_SHOP', 'FAILED_CUSTOM', 'FAILED_DAMAGED', 'FAILED_DISCOUNT');

-- CreateEnum
CREATE TYPE "Store" AS ENUM ('BASE', 'PRODUCTION', 'READY', 'FAIL', 'SOLD');

-- DropForeignKey
ALTER TABLE "TransferRequest" DROP CONSTRAINT "TransferRequest_itemId_fkey";

-- DropForeignKey
ALTER TABLE "TransferRequest" DROP CONSTRAINT "TransferRequest_printRequestId_fkey";

-- DropForeignKey
ALTER TABLE "acceptance" DROP CONSTRAINT "FK_0eb81449edb4100b03391c86655";

-- DropForeignKey
ALTER TABLE "acceptance" DROP CONSTRAINT "FK_ed17e6150ee2d2653470b5ebf1c";

-- DropForeignKey
ALTER TABLE "acceptance_item" DROP CONSTRAINT "FK_bc03eb359c075b6140537c30e45";

-- DropForeignKey
ALTER TABLE "acceptance_item" DROP CONSTRAINT "FK_399d92960bcd76585c0be06606f";

-- DropForeignKey
ALTER TABLE "acceptance_item" DROP CONSTRAINT "FK_285c3240ef8632c22e08b78e267";

-- DropForeignKey
ALTER TABLE "acceptance_log" DROP CONSTRAINT "FK_565935c169d56492f22cd6820a8";

-- DropForeignKey
ALTER TABLE "acceptance_log" DROP CONSTRAINT "FK_46b7b8ccfa5825696ed8387d430";

-- DropForeignKey
ALTER TABLE "acceptance_log" DROP CONSTRAINT "FK_92dee24cac95ec5e5d6e030c562";

-- DropForeignKey
ALTER TABLE "batch_log" DROP CONSTRAINT "FK_b6f142fb9641d4c129657cdaa69";

-- DropForeignKey
ALTER TABLE "batch_log" DROP CONSTRAINT "FK_3f56f39ed70b86bfde742dfe9fb";

-- DropForeignKey
ALTER TABLE "build_request" DROP CONSTRAINT "FK_cb72961913651f3fac07e3121c2";

-- DropForeignKey
ALTER TABLE "build_request" DROP CONSTRAINT "FK_521ed8d22af8f7b55bb69c00a60";

-- DropForeignKey
ALTER TABLE "build_request" DROP CONSTRAINT "FK_faf6ce6a58e3b36d896984082aa";

-- DropForeignKey
ALTER TABLE "build_request" DROP CONSTRAINT "FK_2264e98ecb2cc217ffe2c318dc2";

-- DropForeignKey
ALTER TABLE "colelction_item_log" DROP CONSTRAINT "FK_f16be30e9276949810032aee447";

-- DropForeignKey
ALTER TABLE "colelction_item_log" DROP CONSTRAINT "FK_e0a4b0d6d3e19cc6fec56571bde";

-- DropForeignKey
ALTER TABLE "item_actions_log" DROP CONSTRAINT "FK_035ccacb36d9311de5c3dc7f499";

-- DropForeignKey
ALTER TABLE "print_request" DROP CONSTRAINT "FK_aa5529be9e5f624a0030da28c0f";

-- DropForeignKey
ALTER TABLE "stored_item" DROP CONSTRAINT "FK_f4035515bbd56cbe586746914bf";

-- AlterTable
ALTER TABLE "batch" DROP COLUMN "version";

-- AlterTable
ALTER TABLE "container_tag" DROP COLUMN "version";

-- AlterTable
ALTER TABLE "item_actions_log" DROP COLUMN "reserveType";

-- AlterTable
ALTER TABLE "stored_item" DROP COLUMN "productionMethodId",
DROP COLUMN "reserveType",
ADD COLUMN     "active" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "isProduction" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "productionMethod" TEXT;

-- AlterTable
ALTER TABLE "stored_item_log" DROP COLUMN "version";

-- AlterTable
ALTER TABLE "task" DROP COLUMN "version";

-- AlterTable
ALTER TABLE "task_run" DROP COLUMN "version";

-- DropTable
DROP TABLE "TransferRequest";

-- DropTable
DROP TABLE "acceptance";

-- DropTable
DROP TABLE "acceptance_item";

-- DropTable
DROP TABLE "acceptance_log";

-- DropTable
DROP TABLE "batch_log";

-- DropTable
DROP TABLE "build_request";

-- DropTable
DROP TABLE "colelction_item_log";

-- DropTable
DROP TABLE "import_error";

-- DropTable
DROP TABLE "moysklad_product_cache";

-- DropTable
DROP TABLE "moysklad_techcard_cache";

-- DropTable
DROP TABLE "moysklad_variant_cache";

-- DropTable
DROP TABLE "print_request";

-- DropTable
DROP TABLE "production_method";

-- DropEnum
DROP TYPE "ItemReserveType";

-- DropEnum
DROP TYPE "TransferSource";

-- DropEnum
DROP TYPE "TransferTarget";

-- DropEnum
DROP TYPE "build_request_status_enum";

-- DropEnum
DROP TYPE "import_error_type_enum";

-- DropEnum
DROP TYPE "pack_request_target_enum";

-- CreateTable
CREATE TABLE "Acceptance" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "comment" VARCHAR,
    "userId" UUID NOT NULL,
    "batchId" UUID NOT NULL,

    CONSTRAINT "Acceptance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AcceptanceLog" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "comment" VARCHAR,
    "action" "AcceptanceLogAction" NOT NULL,
    "userId" UUID NOT NULL,
    "acceptanceId" UUID NOT NULL,
    "sewingItemId" UUID,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AcceptanceLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BatchLog" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "productNames" TEXT[],
    "comment" TEXT,
    "action" "BatchLogAction" NOT NULL,
    "batchId" UUID NOT NULL,
    "newBatchId" UUID,
    "userId" UUID,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BatchLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductInfo" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,
    "externalId" TEXT NOT NULL,
    "xmlId" TEXT NOT NULL,
    "article" TEXT,
    "baseArticle" TEXT,
    "notForSewing" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProductInfo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PhysicalItem" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "store" "Store" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "productExternalCode" TEXT,
    "productArticle" TEXT,
    "productName" TEXT NOT NULL,
    "userId" UUID,
    "storedItemId" UUID,
    "sewingItemId" UUID,
    "shipmentId" UUID,

    CONSTRAINT "PhysicalItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PhysicalItemLog" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "physicalItemId" UUID NOT NULL,
    "userId" UUID NOT NULL,
    "action" "PhysicalItemLogAction" NOT NULL,
    "sourceStore" "Store",
    "targetStore" "Store",

    CONSTRAINT "PhysicalItemLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SewingItem" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "batchId" UUID NOT NULL,
    "acceptanceId" UUID,
    "storedItemId" UUID,
    "productExternalCode" TEXT,
    "productArticle" TEXT,
    "productName" TEXT NOT NULL,
    "status" "SewingItemStatus" NOT NULL DEFAULT 'SEWING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SewingItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Shipment" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "userId" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Shipment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Acceptance_batchId_key" ON "Acceptance"("batchId");

-- CreateIndex
CREATE UNIQUE INDEX "ProductInfo_externalId_article_key" ON "ProductInfo"("externalId", "article");

-- CreateIndex
CREATE UNIQUE INDEX "PhysicalItem_sewingItemId_key" ON "PhysicalItem"("sewingItemId");

-- CreateIndex
CREATE INDEX "stored_item_orderStatus_idx" ON "stored_item"("orderStatus");

-- CreateIndex
CREATE INDEX "stored_item_id_active_orderId_idx" ON "stored_item"("id", "active", "orderId");

-- AddForeignKey
ALTER TABLE "Acceptance" ADD CONSTRAINT "Acceptance_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Acceptance" ADD CONSTRAINT "Acceptance_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "AcceptanceLog" ADD CONSTRAINT "AcceptanceLog_acceptanceId_fkey" FOREIGN KEY ("acceptanceId") REFERENCES "Acceptance"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "AcceptanceLog" ADD CONSTRAINT "AcceptanceLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "AcceptanceLog" ADD CONSTRAINT "AcceptanceLog_sewingItemId_fkey" FOREIGN KEY ("sewingItemId") REFERENCES "SewingItem"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "BatchLog" ADD CONSTRAINT "BatchLog_newBatchId_fkey" FOREIGN KEY ("newBatchId") REFERENCES "batch"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatchLog" ADD CONSTRAINT "BatchLog_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BatchLog" ADD CONSTRAINT "BatchLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "item_actions_log" ADD CONSTRAINT "FK_035ccacb36d9311de5c3dc7f499" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItem" ADD CONSTRAINT "PhysicalItem_storedItemId_fkey" FOREIGN KEY ("storedItemId") REFERENCES "stored_item"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItem" ADD CONSTRAINT "PhysicalItem_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItem" ADD CONSTRAINT "PhysicalItem_sewingItemId_fkey" FOREIGN KEY ("sewingItemId") REFERENCES "SewingItem"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItem" ADD CONSTRAINT "PhysicalItem_shipmentId_fkey" FOREIGN KEY ("shipmentId") REFERENCES "Shipment"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItemLog" ADD CONSTRAINT "PhysicalItemLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItemLog" ADD CONSTRAINT "PhysicalItemLog_physicalItemId_fkey" FOREIGN KEY ("physicalItemId") REFERENCES "PhysicalItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SewingItem" ADD CONSTRAINT "SewingItem_acceptanceId_fkey" FOREIGN KEY ("acceptanceId") REFERENCES "Acceptance"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SewingItem" ADD CONSTRAINT "SewingItem_batchId_fkey" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SewingItem" ADD CONSTRAINT "SewingItem_storedItemId_fkey" FOREIGN KEY ("storedItemId") REFERENCES "stored_item"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Shipment" ADD CONSTRAINT "Shipment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
