/*
  Warnings:

  - You are about to drop the column `createdAt` on the `RoomMembers` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `RoomMembers` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "JoinedRoom_joinedAt_key";

-- DropIndex
DROP INDEX "RoomMembers_createdAt_key";

-- AlterTable
ALTER TABLE "JoinedRoom" ADD CONSTRAINT "JoinedRoom_pkey" PRIMARY KEY ("userId");

-- AlterTable
ALTER TABLE "RoomMembers" DROP COLUMN "createdAt",
DROP COLUMN "updatedAt",
ADD COLUMN     "joinedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD CONSTRAINT "RoomMembers_pkey" PRIMARY KEY ("roomId");
