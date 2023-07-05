/*
  Warnings:

  - The values [SOKOLNIKI,PITER] on the enum `Store` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Store_new" AS ENUM ('WORKSHOP', 'BASE', 'RESERVE', 'TRANSIT_POINT', 'SECOND_LINE', 'CUSTOM', 'CUSTOM_RESERVE', 'PRODUCTION', 'READY', 'FAIL', 'SOLD', 'BUFFER', 'FLACON', 'CDM', 'CDM_CUSTOM', 'OHOTNIY', 'VINZAVOD', 'AVIAPARK', 'METROPOLIS', 'ATRIUM', 'ETAGHI', 'DESIGN', 'FORMATICA_BASE', 'WILDBERRIES');
ALTER TABLE "Batch" ALTER COLUMN "store" DROP DEFAULT;
ALTER TABLE "Batch" ALTER COLUMN "store" TYPE "Store_new" USING ("store"::text::"Store_new");
ALTER TABLE "PhysicalItem" ALTER COLUMN "store" TYPE "Store_new" USING ("store"::text::"Store_new");
ALTER TABLE "PhysicalItem" ALTER COLUMN "reservedFrom" TYPE "Store_new" USING ("reservedFrom"::text::"Store_new");
ALTER TABLE "PhysicalItemLog" ALTER COLUMN "sourceStore" TYPE "Store_new" USING ("sourceStore"::text::"Store_new");
ALTER TABLE "PhysicalItemLog" ALTER COLUMN "targetStore" TYPE "Store_new" USING ("targetStore"::text::"Store_new");
ALTER TABLE "StoreCell" ALTER COLUMN "store" TYPE "Store_new" USING ("store"::text::"Store_new");
ALTER TYPE "Store" RENAME TO "Store_old";
ALTER TYPE "Store_new" RENAME TO "Store";
DROP TYPE "Store_old";
ALTER TABLE "Batch" ALTER COLUMN "store" SET DEFAULT 'BASE';
COMMIT;
