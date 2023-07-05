-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "PhysicalItemLogAction" ADD VALUE 'TRANSFORM';
ALTER TYPE "PhysicalItemLogAction" ADD VALUE 'CONNECT';
ALTER TYPE "PhysicalItemLogAction" ADD VALUE 'DISCONNECT';

-- DropForeignKey
ALTER TABLE "PhysicalItemLog" DROP CONSTRAINT "PhysicalItemLog_userId_fkey";

-- AlterTable
ALTER TABLE "PhysicalItemLog" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "sourceAction" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "userId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "PhysicalItemLog" ADD CONSTRAINT "PhysicalItemLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;
