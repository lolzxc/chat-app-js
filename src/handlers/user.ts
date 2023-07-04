import { comparePasswords, createJWT, hashPassword } from '../modules/auth'
import prisma from '../db'

export const createNewUser = async (req, res, next) => {
  try {
    if (req.body.email.length >= 60) Error()
    const user = await prisma.user.create({
      data: {
        email: req.body.email,
        username: req.body.username,
        password: await hashPassword(req.body.password),
      },
    })
    const token = createJWT(user)
    res.json(token)
  } catch (e) {
    e.type = 'input'
    next(e)
  }
}

export const signIn = async (req, res, next) => {
  try {
    const user = await prisma.user.findUnique({
      where: {
        email: req.body.email,
      },
    })
    const isValid = await comparePasswords(req.body.password, user.password)

    if (!isValid) {
      res.json(401)
      res.json({ message: 'wrong password' })
      return
    }

    const token = createJWT(user)
    res.json(token)
  } catch (e) {
    e.type = 'email'
    next(e)
  }
}
