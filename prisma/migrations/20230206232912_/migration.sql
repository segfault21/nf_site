-- AlterTable
ALTER TABLE "stored_item" ADD COLUMN     "orderAssembled" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "orderPacked" BOOLEAN NOT NULL DEFAULT false;
