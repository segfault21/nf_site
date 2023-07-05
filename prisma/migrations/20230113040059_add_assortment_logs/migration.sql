-- CreateTable
CREATE TABLE "AssortmentUpdateLog" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "changedFields" JSONB[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" UUID NOT NULL,
    "productId" UUID,
    "modificationId" UUID,

    CONSTRAINT "AssortmentUpdateLog_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AssortmentUpdateLog" ADD CONSTRAINT "AssortmentUpdateLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AssortmentUpdateLog" ADD CONSTRAINT "AssortmentUpdateLog_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AssortmentUpdateLog" ADD CONSTRAINT "AssortmentUpdateLog_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE SET NULL ON UPDATE CASCADE;
