import { Router } from 'express'
import { body } from 'express-validator'
import { handleInputErrors } from './modules/middleware'
import {
  createRoom,
  deleteRoom,
  getRoom,
  getRoomByID,
  joinRoom,
  leaveRoom,
  updateRoom,
} from './handlers/room'

const router = Router()

router.get('/room', getRoom)
router.post('/room', body('name').isString(), createRoom, handleInputErrors)
router.get('/room/:id', getRoomByID)
router.put('/room/:id', body('name').isString(), updateRoom, handleInputErrors)
router.delete('/room/:id', deleteRoom, handleInputErrors)

router.put('/join/:id', joinRoom)
router.put('/leave/:id', leaveRoom)
export default router
