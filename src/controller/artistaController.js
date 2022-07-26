import { getConnection } from "../database/connections";

export const getArtista = async (req, res) => {
  const pool = await getConnection();

  pool.query("call listarArtista;", function (error, results, fields) {
    res.json(results[0]);
  });
};

export const getAlbums = async (req, res) => {
  const pool = await getConnection();

  pool.query("call listarAlbum();", function (error, results, fields) {
    res.json(results[0]);
  });
};

export const getPaises = async (req, res) => {
  const pool = await getConnection();

  pool.query("select * from pais", function (error, results, fields) {
    res.json(results);
  });
};

export const getGeneros = async (req, res) => {
  const pool = await getConnection();

  pool.query("call listarGenero()", function (error, results, fields) {
    res.json(results[0]);
  });
};

export const insertCancion = async (req, res) => {
  const { idAlbum, duracion, gen_codigo, nombre } = req.body;
  const pool = await getConnection();

  console.log(req.body);

  pool.query(
    "call insertCancion(?,?,?,?)",
    [nombre, duracion, gen_codigo, idAlbum],
    function (error, results, fields) {
      res.json("");
    }
  );
};
export const insertAlbum = async (req, res) => {
  const { aniopub, art_codigo, nrocanciones, idAlbum } = req.body;
  const pool = await getConnection();

  pool.query(
    "call insertAlbum(?,?,?,?);",
    [nombre, nrocanciones, aniopub, art_codigo],
    function (error, results, fields) {
      res.json("");
    }
  );
};

export const getAlbum = async (req, res) => {
  const { idalbum } = req.params;
  const pool = await getConnection();

  pool.query("call getAlbum(?);", [idalbum], function (error, results, fields) {
    res.json(results[0]);
  });
};

export const getCanciones = async (req, res) => {
  const { idalbum } = req.params;
  const pool = await getConnection();

  pool.query(
    "call listarCanciones(?);",
    [idalbum],
    function (error, results, fields) {
      res.json(results[0]);
    }
  );
};

export const getReporte = async (req, res) => {
  const { idalbum } = req.params;
  const pool = await getConnection();

  pool.query(
    "call listarReporte();",
    [idalbum],
    function (error, results, fields) {
      res.json(results[0]);
    }
  );
};
