import app from './server'

let port = 3001

app.listen(port, () => {
  console.log(`hello on: http://localhost:${port}`)
})
