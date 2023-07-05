/*
  Warnings:

  - Added the required column `itemId` to the `StatusChangeQueue` table without a default value. This is not possible if the table is not empty.
  - Added the required column `itemIndex` to the `StatusChangeQueue` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderId` to the `StatusChangeQueue` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `StatusChangeQueue` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "StatusChangeQueue" DROP CONSTRAINT "StatusChangeQueue_storedItemId_fkey";

-- AlterTable
ALTER TABLE "StatusChangeQueue" ADD COLUMN     "itemId" INTEGER NOT NULL,
ADD COLUMN     "itemIndex" INTEGER NOT NULL,
ADD COLUMN     "orderId" INTEGER NOT NULL,
ADD COLUMN     "userId" UUID NOT NULL,
ALTER COLUMN "storedItemId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "StatusChangeQueue" ADD CONSTRAINT "StatusChangeQueue_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StatusChangeQueue" ADD CONSTRAINT "StatusChangeQueue_storedItemId_fkey" FOREIGN KEY ("storedItemId") REFERENCES "stored_item"("id") ON DELETE SET NULL ON UPDATE CASCADE;
