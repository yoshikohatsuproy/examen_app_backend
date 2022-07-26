import express from 'express'
import cors from 'cors'
import morgan from 'morgan'
import config from './config'

import artistaRoutes from './routes/artistaRoutes'

const app = express()

app.set('port', config.port || 4000)

app.use(cors())
app.use(morgan('dev'))
app.use(express.urlencoded({extended: false}))
app.use(express.json())

app.use(artistaRoutes)

export default app