-- AlterTable
ALTER TABLE "PhysicalItem" ADD COLUMN     "storeCellComment" TEXT,
ADD COLUMN     "storeCellId" UUID;

-- AlterTable
ALTER TABLE "PhysicalItemLog" ADD COLUMN     "storeCellComment" TEXT,
ADD COLUMN     "storeCellId" UUID;

-- CreateTable
CREATE TABLE "StoreCell" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" TEXT NOT NULL,
    "store" "Store" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" UUID NOT NULL,

    CONSTRAINT "StoreCell_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "PhysicalItem" ADD CONSTRAINT "PhysicalItem_storeCellId_fkey" FOREIGN KEY ("storeCellId") REFERENCES "StoreCell"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhysicalItemLog" ADD CONSTRAINT "PhysicalItemLog_storeCellId_fkey" FOREIGN KEY ("storeCellId") REFERENCES "StoreCell"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StoreCell" ADD CONSTRAINT "StoreCell_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
