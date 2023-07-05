-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "Store" ADD VALUE 'SECOND_LINE';
ALTER TYPE "Store" ADD VALUE 'CUSTOM';
ALTER TYPE "Store" ADD VALUE 'CUSTOM_RESERVE';
