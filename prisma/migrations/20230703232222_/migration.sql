/*
  Warnings:

  - A unique constraint covering the columns `[roomId,userId]` on the table `ChatMembers` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "ChatMembers_roomId_userId_key" ON "ChatMembers"("roomId", "userId");
