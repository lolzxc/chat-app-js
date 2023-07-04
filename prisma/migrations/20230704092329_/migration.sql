/*
  Warnings:

  - A unique constraint covering the columns `[roomId,userId]` on the table `RoomMembers` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "RoomMembers_roomId_userId_key" ON "RoomMembers"("roomId", "userId");
