-- AlterEnum
ALTER TYPE "PhysicalItemMovementDocumentType" ADD VALUE 'MOVE';

-- AlterTable
ALTER TABLE "PhysicalItemMovementDocument" ADD COLUMN     "comment" TEXT;
