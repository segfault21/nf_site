/*
  Warnings:

  - Changed the type of `entityType` on the `MoyskladChange` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `entityType` to the `MoyskladLink` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "MoyskladEntityType" AS ENUM ('PRODUCT', 'MODIFICATION', 'GROUP', 'PRICE_TYPE', 'CUSTOM_FIELD', 'CUSTOM_ENTITY', 'CUSTOM_ENTITY_VALUE', 'MODIFICATION_CHARACTERISTIC');

-- AlterTable
DELETE FROM "MoyskladChange";
ALTER TABLE "MoyskladChange" DROP COLUMN "entityType",
ADD COLUMN     "entityType" "MoyskladEntityType" NOT NULL;

-- AlterTable
DELETE FROM "MoyskladLink";
ALTER TABLE "MoyskladLink" ADD COLUMN     "entityType" "MoyskladEntityType" NOT NULL;

-- DropEnum
DROP TYPE "MoyskladChangeEntity";

-- CreateIndex
CREATE INDEX "MoyskladChange_action_entityId_entityType_executedAt_idx" ON "MoyskladChange"("action", "entityId", "entityType", "executedAt");
