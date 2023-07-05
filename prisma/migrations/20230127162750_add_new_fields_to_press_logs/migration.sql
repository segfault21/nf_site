-- AlterTable
ALTER TABLE "ExtraPressLog" ADD COLUMN     "departament" TEXT,
ADD COLUMN     "positionsCount" INTEGER NOT NULL DEFAULT 1,
ADD COLUMN     "shop" TEXT;
