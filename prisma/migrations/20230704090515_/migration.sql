/*
  Warnings:

  - You are about to drop the `_RoomToRoomMembers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_RoomToRoomMembers" DROP CONSTRAINT "_RoomToRoomMembers_A_fkey";

-- DropForeignKey
ALTER TABLE "_RoomToRoomMembers" DROP CONSTRAINT "_RoomToRoomMembers_B_fkey";

-- DropTable
DROP TABLE "_RoomToRoomMembers";

-- AddForeignKey
ALTER TABLE "RoomMembers" ADD CONSTRAINT "RoomMembers_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE CASCADE ON UPDATE CASCADE;
