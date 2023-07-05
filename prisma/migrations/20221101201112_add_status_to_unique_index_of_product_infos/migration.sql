/*
  Warnings:

  - A unique constraint covering the columns `[externalId,article,status]` on the table `ProductInfo` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "ProductInfo_externalId_article_key";

-- CreateIndex
CREATE UNIQUE INDEX "ProductInfo_externalId_article_status_key" ON "ProductInfo"("externalId", "article", "status");
