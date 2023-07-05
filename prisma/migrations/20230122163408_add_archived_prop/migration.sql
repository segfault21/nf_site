-- AlterTable
ALTER TABLE "Modification" ADD COLUMN     "archived" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "archived" BOOLEAN NOT NULL DEFAULT false;
