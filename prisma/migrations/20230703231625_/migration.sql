/*
  Warnings:

  - You are about to drop the `LeaveEvent` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "LeaveEvent" DROP CONSTRAINT "LeaveEvent_roomId_fkey";

-- DropForeignKey
ALTER TABLE "LeaveEvent" DROP CONSTRAINT "LeaveEvent_userId_fkey";

-- DropTable
DROP TABLE "LeaveEvent";
