let pool = require('./dbConfig.js');
const getAllClients = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllClients');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

module.exports = (router) => {
    router.route('/clients')
    .get((req, res) => {
        getAllClients().then(result => {
            res.send(result);
        })
        .catch(err => {
            res.status(500).send(err);
        })
    });
}