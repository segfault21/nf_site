/*
  Warnings:

  - You are about to drop the column `materials` on the `moysklad_techcard_cache` table. All the data in the column will be lost.
  - You are about to drop the column `products` on the `moysklad_techcard_cache` table. All the data in the column will be lost.
  - Added the required column `material` to the `moysklad_techcard_cache` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product` to the `moysklad_techcard_cache` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
DELETE FROM moysklad_techcard_cache;
ALTER TABLE "moysklad_techcard_cache" DROP COLUMN "materials",
DROP COLUMN "products",
ADD COLUMN     "material" TEXT NOT NULL,
ADD COLUMN     "product" TEXT NOT NULL;
