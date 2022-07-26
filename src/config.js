import {config} from 'dotenv'
config();

export default{
    port : process.env.PORT || 4000,
    host : process.env.DB_HOST || '',
    user : process.env.DB_USER || '',
    password : process.env.DB_PASSWORD || '',
    database : process.env.DB_DATABASE || ''
}
