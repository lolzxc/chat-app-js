/*
  Warnings:

  - You are about to drop the `ChatMembers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_RoomMembers` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "ChatMembers" DROP CONSTRAINT "ChatMembers_roomId_fkey";

-- DropForeignKey
ALTER TABLE "ChatMembers" DROP CONSTRAINT "ChatMembers_userId_fkey";

-- DropForeignKey
ALTER TABLE "_RoomMembers" DROP CONSTRAINT "_RoomMembers_A_fkey";

-- DropForeignKey
ALTER TABLE "_RoomMembers" DROP CONSTRAINT "_RoomMembers_B_fkey";

-- DropTable
DROP TABLE "ChatMembers";

-- DropTable
DROP TABLE "_RoomMembers";

-- CreateTable
CREATE TABLE "RoomMembers" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "roomId" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "RoomMembers_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "RoomMembers" ADD CONSTRAINT "RoomMembers_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoomMembers" ADD CONSTRAINT "RoomMembers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
