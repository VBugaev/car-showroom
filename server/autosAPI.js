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

const createAutoAdditionalParams = async (data, id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('AutoId', sql.Int, id)
        .input('WindowRaisers', sql.NVarChar(50), data.windowRaisers ? data.windowRaisers : null)
        .input('ParkingSensors', sql.Bit, data.hasParkingSensors)
        .input('RearViewCamera', sql.Bit, data.hasRearViewCamera)
        .input('HeatedSteeringWheel', sql.Bit, data.hasHeatedSteeringWheel)
        .input('WheelDisks', sql.NVarChar(50), data.wheelDisks ? data.wheelDisks : null)
        .input('AdaptiveHeadlights', sql.Bit, data.hasAdaptiveHeadlights)
        .input('CabinMaterial', sql.NVarChar(50), data.cabinMaterial ? data.cabinMaterial : null)
        .execute('CreateAdditionalParams');
        return result;
    } catch (error) {
        console.log(error);
        throw error;
    }
};

const createAutoAdditionalParamsPrices = async (data, id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('AutoId', sql.Int, id)
        .input('WindowRaisers', sql.BigInt, data.windowRaisers ? +data.windowRaisersPrice : null)
        .input('ParkingSensors', sql.BigInt, data.hasParkingSensors ? +data.parkingSensorsPrice : null)
        .input('RearViewCamera', sql.BigInt, data.hasRearViewCamera ? +data.rearViewCameraPrice : null)
        .input('HeatedSteeringWheel', sql.BigInt, data.hasHeatedSteeringWheel ? +data.heatedSteeringWheelPrice : null)
        .input('WheelDisks', sql.BigInt, data.wheelDisks ? +data.wheelDisksPrice : null)
        .input('AdaptiveHeadlights', sql.BigInt, data.hasAdaptiveHeadlights ? +data.adaptiveHeadlightsPrice : null)
        .input('CabinMaterial', sql.BigInt, data.cabinMaterial ? +data.cabinMaterialPrice : null)
        .execute('CreateAdditionalParamsPrices');
        return result;
    } catch (error) {
        console.log(error);
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
            await createAutoAdditionalParams(req.body, result.Id);
            await createAutoAdditionalParamsPrices(req.body, result.Id);
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