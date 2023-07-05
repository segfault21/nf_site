-- CreateEnum
CREATE TYPE "container_type_enum" AS ENUM ('default', 'urgent');

-- AlterTable
ALTER TABLE "container" ADD COLUMN     "type" "container_type_enum" NOT NULL DEFAULT E'default';
