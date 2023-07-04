-- DropForeignKey
ALTER TABLE "RoomMembers" DROP CONSTRAINT "RoomMembers_roomId_fkey";

-- CreateTable
CREATE TABLE "_RoomToRoomMembers" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_RoomToRoomMembers_AB_unique" ON "_RoomToRoomMembers"("A", "B");

-- CreateIndex
CREATE INDEX "_RoomToRoomMembers_B_index" ON "_RoomToRoomMembers"("B");

-- AddForeignKey
ALTER TABLE "_RoomToRoomMembers" ADD CONSTRAINT "_RoomToRoomMembers_A_fkey" FOREIGN KEY ("A") REFERENCES "Room"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RoomToRoomMembers" ADD CONSTRAINT "_RoomToRoomMembers_B_fkey" FOREIGN KEY ("B") REFERENCES "RoomMembers"("roomId") ON DELETE CASCADE ON UPDATE CASCADE;
