/*
  Warnings:

  - The primary key for the `RoomMembers` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "RoomMembers" DROP CONSTRAINT "RoomMembers_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "RoomMembers_pkey" PRIMARY KEY ("id");
