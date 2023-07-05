-- AlterTable
-- ALTER TABLE "ExtraPressLog" ADD COLUMN     "pressCount" INTEGER NOT NULL DEFAULT 1,
ALTER TABLE "ExtraPressLog" ALTER COLUMN "pressCount" SET DEFAULT 1,
ALTER COLUMN "positionsCount" SET DEFAULT 1;
