-- CreateEnum
CREATE TYPE "ProductInfoStatus" AS ENUM ('NORMAL', 'NEXTGEN');

-- AlterTable
ALTER TABLE "ProductInfo" ADD COLUMN     "status" "ProductInfoStatus" NOT NULL DEFAULT 'NORMAL';
