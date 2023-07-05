/*
  Warnings:

  - The `status` column on the `batch` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "BatchStatus" AS ENUM ('CREATED', 'SEWN', 'WAITING_ACCEPTANCE', 'ACCEPTED', 'ACCEPTED_PARTIALLY', 'REJECTED');

-- AlterTable
ALTER TABLE "batch" DROP COLUMN "status",
ADD COLUMN     "status" "BatchStatus" NOT NULL DEFAULT 'CREATED';

-- DropEnum
DROP TYPE "batch_status_enum";
