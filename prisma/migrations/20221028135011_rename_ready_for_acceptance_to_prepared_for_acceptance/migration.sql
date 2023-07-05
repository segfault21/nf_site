/*
  Warnings:

  - The values [READY_FOR_ACCEPTANCE] on the enum `SewingItemStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "SewingItemStatus_new" AS ENUM ('CUT', 'SEWING', 'PREPARED_FOR_ACCEPTANCE', 'WAITING_ACCEPTANCE', 'COLLECTED', 'FAILED_REMAKE', 'FAILED_SHOP', 'FAILED_CUSTOM', 'FAILED_DAMAGED', 'FAILED_DISCOUNT');
ALTER TABLE "SewingItem" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "SewingItem" ALTER COLUMN "status" TYPE "SewingItemStatus_new" USING ("status"::text::"SewingItemStatus_new");
ALTER TYPE "SewingItemStatus" RENAME TO "SewingItemStatus_old";
ALTER TYPE "SewingItemStatus_new" RENAME TO "SewingItemStatus";
DROP TYPE "SewingItemStatus_old";
ALTER TABLE "SewingItem" ALTER COLUMN "status" SET DEFAULT 'CUT';
COMMIT;
