let pool = require('./dbConfig.js');
const getAllAutos = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllAutos');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

module.exports = (router) => {
    router.route('/autos')
    .get((req, res) => {
        getAllAutos().then(result => {
            res.send(result);
        })
        .catch(err => {
            res.status(500).send(err);
        })
    });
}