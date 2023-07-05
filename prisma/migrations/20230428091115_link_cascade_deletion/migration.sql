-- DropForeignKey
ALTER TABLE "MoyskladLink" DROP CONSTRAINT "MoyskladLink_productId_fkey";

-- AddForeignKey
ALTER TABLE "MoyskladLink" ADD CONSTRAINT "MoyskladLink_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
