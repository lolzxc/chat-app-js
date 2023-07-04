/*
  Warnings:

  - You are about to drop the `JoinEvent` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "JoinEvent" DROP CONSTRAINT "JoinEvent_roomId_fkey";

-- DropForeignKey
ALTER TABLE "JoinEvent" DROP CONSTRAINT "JoinEvent_userId_fkey";

-- DropTable
DROP TABLE "JoinEvent";

-- CreateTable
CREATE TABLE "ChatMembers" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "roomId" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "ChatMembers_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ChatMembers" ADD CONSTRAINT "ChatMembers_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatMembers" ADD CONSTRAINT "ChatMembers_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
