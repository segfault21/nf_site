-- CreateEnum
CREATE TYPE "ItemReserveType" AS ENUM ('NONE', 'BASE', 'READY');

-- AlterTable
ALTER TABLE "stored_item" ADD COLUMN     "reserveType" "ItemReserveType" NOT NULL DEFAULT E'NONE';
