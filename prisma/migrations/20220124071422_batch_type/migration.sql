-- CreateEnum
CREATE TYPE "batch_type_enum" AS ENUM ('default', 'defect');

-- AlterTable
ALTER TABLE "batch" ADD COLUMN     "type" "batch_type_enum" NOT NULL DEFAULT E'default';
