-- CreateTable
CREATE TABLE "StatusChangeQueue" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "storedItemId" UUID NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finishedAt" TIMESTAMP(3),
    "error" TEXT,

    CONSTRAINT "StatusChangeQueue_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "StatusChangeQueue_status_createdAt_finishedAt_idx" ON "StatusChangeQueue"("status", "createdAt", "finishedAt");

-- AddForeignKey
ALTER TABLE "StatusChangeQueue" ADD CONSTRAINT "StatusChangeQueue_storedItemId_fkey" FOREIGN KEY ("storedItemId") REFERENCES "stored_item"("id") ON DELETE CASCADE ON UPDATE CASCADE;
