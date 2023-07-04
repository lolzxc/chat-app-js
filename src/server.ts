import express from 'express'
import { protect } from './modules/auth'
import router from './router'
import { createNewUser, signIn } from './handlers/user'
import { catchErrors } from './modules/middleware'

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use('/api', protect, router)
app.post('/register', createNewUser)
app.post('/signin', signIn)

app.use(catchErrors)
export default app
