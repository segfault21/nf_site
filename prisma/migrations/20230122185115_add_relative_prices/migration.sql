-- CreateEnum
CREATE TYPE "PriceRelationType" AS ENUM ('EQUAL', 'INCREMENT', 'DECREMENT', 'DIVIDE', 'MULTIPLY');

-- AlterTable
ALTER TABLE "ModificationPrice" ADD COLUMN     "relationType" "PriceRelationType",
ADD COLUMN     "relative" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "targetId" UUID;

-- AlterTable
ALTER TABLE "ProductPrice" ADD COLUMN     "relationType" "PriceRelationType",
ADD COLUMN     "relative" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "targetId" UUID;

-- AddForeignKey
ALTER TABLE "ProductPrice" ADD CONSTRAINT "ProductPrice_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "PriceType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModificationPrice" ADD CONSTRAINT "ModificationPrice_targetId_fkey" FOREIGN KEY ("targetId") REFERENCES "PriceType"("id") ON DELETE SET NULL ON UPDATE CASCADE;
