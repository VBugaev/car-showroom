let pool = require('./dbConfig.js');
let sql = require('mssql');

const getAllClients = async () => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .execute('GetAllClients');
        return result.recordset;
    } catch (error) {
        throw error;
    }
};

const getClientByPhone = async (phone) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Phone', sql.NVarChar(20), phone)
        .execute('GetClientByPhone');
        return result.recordset[0];
    } catch (error) {
        throw error;
    }
}

const register = async (data) => {
    try {
        let connectedPool = await pool;
        const existedResult = await getClientByPhone(data.phone)
        if (existedResult) {
            return { error: 'This phone already registered' }
        }

        const userRoleResult =  await connectedPool.request()
        .input('Title', sql.NVarChar(50), 'User')
        .execute('GetRoleByTitle');

        const result = await connectedPool.request()
        .input('Name', sql.NVarChar(50), data.name)
        .input('Surname', sql.NVarChar(50), data.surname)
        .input('Password', sql.NVarChar(sql.MAX), data.password)
        .input('RoleId', sql.Int, userRoleResult.recordset[0].Id)
        .input('DeliveryType', sql.Bit, data.isDelivery)
        .input('Patronymic', sql.NVarChar(50), data.patronymic)
        .input('StreetId', sql.Int, data.street)
        .input('Phone', sql.NVarChar(20), data.phone)
        .execute('CreateClient');

        await connectedPool.request()
        .input('UserId', sql.Int, result.recordset[0].Id)
        .input('Password', sql.NVarChar(sql.MAX), data.password)
        .execute('SetPassword');
        return result.recordset[0];
    } catch (error) {
        throw error;
    }
}

const login = async (data) => {
    try {
        let connectedPool = await pool;
        const result = await connectedPool.request()
        .input('Phone', sql.NVarChar(20), data.phone)
        .execute('GetClientByPhone');
        if (result.recordset[0]) {
            const user = result.recordset[0];
            const hashresult = await connectedPool.request()
            .input('UserId', sql.Int, user.Id)
            .execute('GetPassword');
            if (hashresult.recordset[0].Hash === data.password) {
                return user;
            }
            return { error: 'Incorrect phone or password' };
        }
        return { error: 'Incorrect phone or password' };
    } catch (error) {
        throw error;
    }
}



module.exports = (router) => {
    router.route('/login')
    .post(async (req, res) => {
        try {
            const result = await login(req.body);
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })
    router.route('/register')
    .post(async (req, res) => {
        try {
            const result = await register(req.body);
            res.send(result);
        } catch (error) {
            res.status(500).send(error);
        }
    })
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