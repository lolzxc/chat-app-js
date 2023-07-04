import { validationResult } from 'express-validator'

export const handleInputErrors = (req, res, next) => {
  const errors = validationResult(req)

  if (!errors.isEmpty()) {
    res.status(400)
    res.json({ errors: errors.array() })
    return
  } else {
    next()
  }
}

export const catchErrors = (err, req, res, next) => {
  const errorTypes = {
    auth: { status: 401, error: { message: 'unauthorized' } },
    input: { status: 400, error: { message: 'invalid input' } },
    email: { status: 400, error: { message: 'email not found' } },
    room: { status: 400, error: { message: 'room not found' } },
    server: { status: 500, error: { message: 'server error' } },
  }
  res.status(errorTypes[err.type].status).json(errorTypes[err.type].error)
}
