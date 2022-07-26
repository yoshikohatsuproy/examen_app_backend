import mysql from 'mysql'
import config from '../config'


const dbSettings = {
    host: config.host,
    user: config.user,
    password : config.password,
    database : config.database
}

export async function getConnection() {
    try {
        const pool = mysql.createConnection(dbSettings)
        console.log(dbSettings)
        return pool
    } catch(error){
        console.log(error)
    }
}

