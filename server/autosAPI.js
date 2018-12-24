let pool = require('./dbConfig.js');
let sql = require('mssql');
let moment = require('moment');

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

const getAutoById = async (id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Id', sql.Int, +id)
        .execute('GetAutoById');
        return result.recordset[0];
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

const createOrderParams = async (data, id) => {
    console.log(data);
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Id', sql.Int, id)
        .input('WindowRaisers', sql.Bit, data.windowRaisers ? data.windowRaisers : null)
        .input('ParkingSensors', sql.Bit, data.parkingSensors ? data.parkingSensors : null)
        .input('RearViewCamera', sql.Bit, data.rearViewCamera ? data.rearViewCamera : null)
        .input('HeatedSteeringWheel', sql.Bit, data.heatedSteeringWheel ? data.heatedSteeringWheel : null)
        .input('WheelDisks', sql.Bit, data.wheelDisks ? data.wheelDisks : null)
        .input('AdaptiveHeadlights', sql.Bit, data.adaptiveHeadlights ? data.adaptiveHeadlights : null)
        .input('CabinMaterial', sql.Bit, data.cabinMaterial ? data.cabinMaterial : null)
        .execute('CreateOrderParams');
        return result;
    } catch (error) {
        console.log(error);
        throw error;
    }
};

const getStatusByTitle = async (title) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Title', sql.NVarChar(50), title)
        .execute('GetStatusByTitle');
        return result.recordset[0];
    } catch (error) {
        throw error;
    }
};

const createOrder = async (data) => {
    try {
        let connectedPool = await pool;

        const statusResult = await getStatusByTitle('Pending');
        const result = await connectedPool.request()
        .input('UserId', sql.Int, +data.userid)
        .input('AutoId', sql.Int, +data.autoid)
        .input('StatusId', sql.Int, statusResult.Id)
        .input('Date', sql.DateTimeOffset(7), moment(data.date).toDate())
        .input('TotalPrice', sql.BigInt, data.totalPrice)
        .execute('CreateOrder');
        return result;
    } catch (error) {
        console.log(error);
        throw error;
    }
}

const getAllOrders = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllOrders');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

const getAllOrdersByUser = async (id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('UserId', sql.Int, id)
        .execute('GetAllOrdersByUser');
        return result.recordset;
    } catch (error) {
        throw error;
    }
};

const getSumOrdersPrices = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('CountAllOrdersPrice');
        return result.recordset[0];
    } catch (error) {
        throw error;
    }
}

const getSumOrdersPricesByBrand = async (brand) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Brand', sql.NVarChar(100), brand)
        .execute('CountAllOrdersPriceByBrand');
        return result.recordset[0];
    } catch (error) {
        throw error;
    }
}

const getAdditionalParams = async (id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('AutoId', sql.Int, +id)
        .execute('GetAdditionalParamsByAutoId');
        return result.recordset;
    } catch (error) {
        throw error;
    }
};

const getAdditionalParamsPrices = async (id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('AutoId', sql.Int, +id)
        .execute('GetAdditionalParamsPricesById');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

const deleteAuto = async (id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Id', sql.Int, +id)
        .execute('DeleteAuto');
        return result;
    } catch (error) {
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

const getAllStreets = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllStreets');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

const createTestDrive = async (data) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('UserId', sql.Int, data.userid)
        .input('AutoId', sql.Int, data.autoid)
        .input('Date', sql.DateTimeOffset(7), moment(data.date).toDate())
        .execute('CreateTestDriveRecord');
        return result;
    } catch (error) {
        throw error;
    }
}

const updateOrder = async (updData) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Id', sql.Int, updData.id)
        .input('StatusId', sql.Int, updData.statusid)
        .execute('UpdateOrder');
        return result;
    } catch (error) {
        throw error;
    }
}

const getAllStatuses = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllStatuses');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

const getAllTestDrives = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllTestDrives');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

const getAllTestDrivesByUser = async (id) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('UserId', sql.Int, id)
        .execute('GetAllTestDrivesByUser');
        return result.recordset;
    } catch (error) {
        throw error;
    }
}

module.exports = (router) => {
    router.route('/stat')
    .get(async (req, res) => {
        try {
            const stat = await getSumOrdersPrices();
            res.send(stat);
        } catch (error) {
            throw error;
        }
    })
    router.route('/stat/:brand')
    .get(async (req, res) => {
        try {
            const stat = await getSumOrdersPricesByBrand(req.params.brand);
            res.send(stat);
        } catch (error) {
            throw error;
        }
    })
    router.route('/streets')
    .get(async (req, res) => {
        try {
            const resultStreets = await getAllStreets();
            res.send(resultStreets);
        } catch (error) {
            throw error;
        }
    })
    router.route('/autoparams')
    .get(async (req, res) => {
        try {
            const resultParams = await getAdditionalParams(req.query.id);
            const resultPrices = await getAdditionalParamsPrices(req.query.id);
            const autoData = await getAutoById(req.query.id);
            res.send({
                autoData,
                resultParams,
                resultPrices
            });
        } catch (error) {
            throw error;
        }
    })

    router.route('/statuses')
    .get(async (req, res) => {
        try {
            const result = await getAllStatuses();
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })
    router.route('/orders/:id')
    .get(async (req, res) => {
        try {
            const result = await getAllOrdersByUser(req.params.id);
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })

    router.route('/orders')
    .get(async (req, res) => {
        try {
            const result = await getAllOrders();
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })
    router.route('/order')
    .post(async (req, res) => {
        try {
            const result = await createOrder(req.body);
            await createOrderParams(req.body, result.recordset[0].Id);
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })
    .put(async (req, res) => {
        try {
            await updateOrder(req.query);
            res.status(200).send('Ok');
        } catch (error) {
            res.status(500).send(error);
        }
    })
    router.route('/testdrives')
    .get(async (req, res) => {
        try {
            const result = await getAllTestDrives();
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })
    router.route('/testdrives/:id')
    .get(async (req, res) => {
        try {
            const result = await getAllTestDrivesByUser(req.params.id);
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })

    router.route('/testdrive')
    .post(async (req, res) => {
        try {
            console.log(req.body);
            await createTestDrive(req.body);
            res.status(200).send('Created');
        } catch (error) {
            console.log(error);
            res.status(500).send(error)
        }
    })
    router.route('/autos')
    .get(async (req, res) => {
        try {
            const result = await getAllAutos();
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
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