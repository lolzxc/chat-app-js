/*
  Warnings:

  - The primary key for the `RoomMembers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `RoomMembers` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[createdAt]` on the table `RoomMembers` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `updatedAt` to the `RoomMembers` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "RoomMembers" DROP CONSTRAINT "RoomMembers_userId_fkey";

-- AlterTable
ALTER TABLE "RoomMembers" DROP CONSTRAINT "RoomMembers_pkey",
DROP COLUMN "id",
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "JoinedRoom" (
    "joinedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "JoinedRoom_joinedAt_key" ON "JoinedRoom"("joinedAt");

-- CreateIndex
CREATE UNIQUE INDEX "RoomMembers_createdAt_key" ON "RoomMembers"("createdAt");

-- AddForeignKey
ALTER TABLE "JoinedRoom" ADD CONSTRAINT "JoinedRoom_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
