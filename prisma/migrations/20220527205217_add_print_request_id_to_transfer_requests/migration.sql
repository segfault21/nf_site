-- AlterTable
ALTER TABLE "TransferRequest" ADD COLUMN     "printRequestId" UUID;

-- AddForeignKey
ALTER TABLE "TransferRequest" ADD CONSTRAINT "TransferRequest_printRequestId_fkey" FOREIGN KEY ("printRequestId") REFERENCES "print_request"("id") ON DELETE SET NULL ON UPDATE CASCADE;
