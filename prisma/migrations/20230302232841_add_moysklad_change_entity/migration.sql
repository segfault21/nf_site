-- CreateEnum
CREATE TYPE "MoyskladChangeAction" AS ENUM ('UPSERT', 'DELETE');

-- CreateEnum
CREATE TYPE "MoyskladChangeEntity" AS ENUM ('PRODUCT', 'MODIFICATION', 'GROUP', 'PRICE_TYPE', 'CUSTOM_FIELD', 'CUSTOM_ENTITY', 'CUSTOM_ENTITY_VALUE', 'MODIFICATION_CHARACTERISTIC');

-- CreateTable
CREATE TABLE "MoyskladChange" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "moyskladAccountId" UUID NOT NULL,
    "action" "MoyskladChangeAction" NOT NULL,
    "entityType" "MoyskladChangeEntity" NOT NULL,
    "entityId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MoyskladChange_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MoyskladChange" ADD CONSTRAINT "MoyskladChange_moyskladAccountId_fkey" FOREIGN KEY ("moyskladAccountId") REFERENCES "MoyskladAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
