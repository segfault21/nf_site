-- AlterEnum
ALTER TYPE "PhysicalItemLogAction" ADD VALUE 'COMMENT';

-- AlterTable
ALTER TABLE "PhysicalItem" ADD COLUMN     "comment" TEXT;
