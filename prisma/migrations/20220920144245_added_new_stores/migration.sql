-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "Store" ADD VALUE 'FLACON';
ALTER TYPE "Store" ADD VALUE 'CDM';
ALTER TYPE "Store" ADD VALUE 'OHOTNIY';
ALTER TYPE "Store" ADD VALUE 'VINZAVOD';
ALTER TYPE "Store" ADD VALUE 'SOKOLNIKI';
ALTER TYPE "Store" ADD VALUE 'PITER';
