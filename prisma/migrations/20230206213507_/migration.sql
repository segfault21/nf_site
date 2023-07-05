/*
  Warnings:

  - You are about to drop the column `status` on the `StatusChangeQueue` table. All the data in the column will be lost.
  - Added the required column `updateData` to the `StatusChangeQueue` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "StatusChangeQueue_status_createdAt_finishedAt_idx";

-- AlterTable
ALTER TABLE "StatusChangeQueue" DROP COLUMN "status",
ADD COLUMN     "updateData" JSONB NOT NULL;

-- CreateIndex
CREATE INDEX "StatusChangeQueue_createdAt_finishedAt_idx" ON "StatusChangeQueue"("createdAt", "finishedAt");
