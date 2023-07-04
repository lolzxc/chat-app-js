import prisma from '../db'

export const getRoom = async (req, res) => {
  const rooms = await prisma.room.findMany({
    select: {
      id: true,
      createdAt: true,
      updatedAt: true,
      name: true,
      roomMembers: {
        select: {
          joinedAt: true,
          userId: true,
        },
      },
    },
  })
  res.json({ rooms: rooms })
}

export const getRoomByID = async (req, res, next) => {
  try {
    const room = await prisma.room.findFirst({
      select: {
        id: true,
        createdAt: true,
        updatedAt: true,
        name: true,
        roomMembers: {
          select: {
            joinedAt: true,
            userId: true,
          },
        },
      },
    })
    res.json({ room: room })
  } catch (e) {
    e.type = 'room'
    next(e)
  }
}

export const createRoom = async (req, res, next) => {
  try {
    const room = await prisma.room.create({
      data: {
        name: req.body.name,
        roomCreatorId: req.user.id,
        roomMembers: {
          create: {
            userId: req.user.id,
          },
        },
      },
      include: {
        roomMembers: true,
      },
    })
    res.json({ room: room })
  } catch (e) {
    e.type = 'input'
    next(e)
  }
}

export const updateRoom = async (req, res, next) => {
  try {
    const room = await prisma.room.update({
      where: {
        id_roomCreatorId: {
          id: parseInt(req.params.id),
          roomCreatorId: req.user.id,
        },
      },
      data: {
        name: req.body.name,
      },
    })
    res.json({ room: room })
  } catch (e) {
    e.type = 'input'
    next(e)
  }
}

export const joinRoom = async (req, res, next) => {
  try {
    const isUserHere = await prisma.roomMembers.findUnique({
      where: {
        roomId_userId: {
          roomId: parseInt(req.params.id),
          userId: req.user.id,
        },
      },
    })

    if (isUserHere) {
      res.json({ message: 'you already joined the channel' })
      return
    }

    const room = await prisma.room.update({
      where: {
        id: parseInt(req.params.id),
      },
      data: {
        roomMembers: {
          create: {
            userId: req.user.id,
          },
        },
      },
      include: {
        roomMembers: true,
      },
    })
    res.json({ room: room })
  } catch (e) {
    e.type = 'room'
    next(e)
  }
}

export const leaveRoom = async (req, res, next) => {
  try {
    const isUserHere = await prisma.roomMembers.findUnique({
      where: {
        roomId_userId: {
          roomId: parseInt(req.params.id),
          userId: req.user.id,
        },
      },
    })

    if (!isUserHere) {
      res.json({ message: 'You are not in the room' })
      return
    }

    const room = await prisma.roomMembers.delete({
      where: {
        roomId_userId: {
          roomId: parseInt(req.params.id),
          userId: req.user.id,
        },
      },
    })
    res.json({ room: room })
  } catch (e) {
    e.type = 'room'
    next(e)
  }
}

export const deleteRoom = async (req, res, next) => {
  try {
    const room = await prisma.room.delete({
      where: {
        id_roomCreatorId: {
          id: parseInt(req.params.id),
          roomCreatorId: req.user.id,
        },
      },
    })
    res.json({ room: room })
  } catch (e) {
    e.type = 'room'
    next(e)
  }
}
