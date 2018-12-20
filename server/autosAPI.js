let pool = require('./dbConfig.js');
let sql = require('mssql');

const getAllAutos = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllAutos');
        return result.recordset;
    } catch (error) {
        throw error;
    }
};

const createAuto = async (data) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Brand', sql.NVarChar(100), data.brand)
        .input('Model', sql.NVarChar(200), data.model)
        .input('Price', sql.BigInt, +data.price)
        .input('CountryId', sql.Int, +data.country)
        .input('WarehouseCount', sql.Int, +data.warehouseCount)
        .execute('CreateAuto');
        return result.recordset[0];
    } catch (error) {
        throw error;
    }
};

const createAutoParams = async (data, id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Id', sql.Int, id)
        .input('BodyType', sql.NVarChar(50), data.bodyType)
        .input('PlacesCount', sql.Int, +data.placesCount)
        .input('EngineType', sql.NVarChar(50), data.engineType)
        .input('AirConditioning', sql.NVarChar(50), data.airConditioning)
        .input('DriveUnit', sql.NVarChar(50), data.driveUnit)
        .input('Transmission', sql.NVarChar(50), data.transmission)
        .input('MaxSpeed', sql.Int, +data.maxSpeed)
        .execute('CreateCarEquipment');
        return result;
    } catch (error) {
        throw error;
    }
};

const deleteAuto = async (id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Id', sql.Int, id)
        .execute('DeleteAuto');
        return result;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

const getAllCountries = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllCountries');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

module.exports = (router) => {
    router.route('/autos')
    .get(async (req, res) => {
        try {
            const result = await getAllAutos();
            res.send(result);
        } catch (error) {
            res.status(500).send(err);
        }
    })
    .post(async (req, res) => {
        try {
            const result = await createAuto(req.body);
            await createAutoParams(req.body, result.Id);
            res.send(result);
        } catch (error) {
            res.status(500).send(err);
        }
    })
    .delete(async (req, res) => {
        try {
            await deleteAuto(req.query.id);
            res.status(200).send('Ok!');
        } catch (error) {
            res.status(500).send(err);
        }
    })
    router.route('/countries')
    .get((req, res) => {
        getAllCountries().then(result => {
            res.send(result);
        })
        .catch(err => {
            res.status(500).send(err);
        })
    });
}