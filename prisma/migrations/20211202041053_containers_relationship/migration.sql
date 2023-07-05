-- CreateTable
CREATE TABLE "_ContainerToContainerTag" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ContainerToContainerTag_AB_unique" ON "_ContainerToContainerTag"("A", "B");

-- CreateIndex
CREATE INDEX "_ContainerToContainerTag_B_index" ON "_ContainerToContainerTag"("B");

-- AddForeignKey
ALTER TABLE "_ContainerToContainerTag" ADD FOREIGN KEY ("A") REFERENCES "container"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ContainerToContainerTag" ADD FOREIGN KEY ("B") REFERENCES "container_tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
