import { Router } from "express"
import {
    getAlbum,
    getAlbums,
    getArtista,
    getGeneros,
    getPaises,
    insertAlbum,
    insertCancion,
    getCanciones,
    getReporte
} from '../controller/artistaController'

const router = Router()

router.get("/api/genero", getGeneros)
router.get("/api/artista", getArtista)
router.get("/api/album", getAlbums)
router.get("/api/album/:idalbum", getAlbum)
router.get("/api/canciones/:idalbum", getCanciones)
router.get("/api/reporte", getReporte)
router.get("/api/pais", getPaises)

router.post("/api/album", insertAlbum)
router.post("/api/cancion", insertCancion)
export default router