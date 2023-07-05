-- CreateEnum
CREATE TYPE "Contractor" AS ENUM ('WORKSHOP', 'OUTSOURCE');

-- AlterTable
ALTER TABLE "Batch" ADD COLUMN     "contractor" "Contractor" NOT NULL DEFAULT 'WORKSHOP';
