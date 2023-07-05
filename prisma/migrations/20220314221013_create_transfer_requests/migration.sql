-- CreateEnum
CREATE TYPE "TransferTarget" AS ENUM ('PRINTING', 'PACKAGING');

-- CreateEnum
CREATE TYPE "TransferSource" AS ENUM ('BASE', 'PRINTED', 'COMPLETE');

-- CreateTable
CREATE TABLE "TransferRequest" (
    "id" UUID NOT NULL,
    "from" "TransferSource" NOT NULL,
    "to" "TransferTarget" NOT NULL,
    "itemId" UUID NOT NULL,

    CONSTRAINT "TransferRequest_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "TransferRequest" ADD CONSTRAINT "TransferRequest_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "stored_item"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
