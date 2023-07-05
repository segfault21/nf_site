-- CreateTable
CREATE TABLE "ModificationStructure" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "modificationId" UUID NOT NULL,
    "value" TEXT NOT NULL,

    CONSTRAINT "ModificationStructure_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ModificationStructure" ADD CONSTRAINT "ModificationStructure_modificationId_fkey" FOREIGN KEY ("modificationId") REFERENCES "Modification"("id") ON DELETE CASCADE ON UPDATE CASCADE;
