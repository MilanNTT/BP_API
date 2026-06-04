const cds = require('@sap/cds');

module.exports = class EmployeeService extends cds.ApplicationService {
    async init() {
        const bupa = await cds.connect.to('API_BUSINESS_PARTNER');

        this.on('READ', 'BusinessPartner', async (req) => {
            console.log('>>> Calling BuPa URL:', bupa.options?.credentials?.url);
            return bupa.run(req.query);
        });

        await super.init();
    }
};
