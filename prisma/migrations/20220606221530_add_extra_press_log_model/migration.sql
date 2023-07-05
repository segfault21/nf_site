-- CreateTable
CREATE TABLE "ExtraPressLog" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "itemName" TEXT NOT NULL,
    "pressCount" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" UUID NOT NULL,

    CONSTRAINT "ExtraPressLog_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ExtraPressLog" ADD CONSTRAINT "ExtraPressLog_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
