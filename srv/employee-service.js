const cds = require('@sap/cds');

module.exports = class EmployeeService extends cds.ApplicationService {
    async init() {
        const bupa = await cds.connect.to('API_BUSINESS_PARTNER');

        this.on('READ', 'BusinessPartner', async (req) => {
            console.log('>>> Calling BuPa URL:', bupa.options?.credentials?.url);
            return bupa.run(req.query);
        });

        this.on('READ', 'ProcessStep', async (req) => {
            const db = await cds.connect.to('db');
            const { SELECT: sel } = req.query;

            // Only fetch BP data when the Object Page requests the virtual fields
            const bpVirtuals = ['bpFullName','bpFirstName','bpLastName','bpCategory','bpOrganization','bpCustomer','bpSupplier','bpIsBlocked'];
            const needsBp = !sel.columns || sel.columns.some(c => bpVirtuals.includes(c.ref?.[0]));

            // Build a clean DB query — virtual fields don't exist in the DB
            const dbQuery = SELECT.from('BP_API.ProcessStep');
            if (sel.where)   dbQuery.SELECT.where   = sel.where;
            if (sel.orderBy) dbQuery.SELECT.orderBy = sel.orderBy;
            if (sel.limit)   dbQuery.SELECT.limit   = sel.limit;

            const results = await db.run(dbQuery);

            if (needsBp && results) {
                const items = Array.isArray(results) ? results : [results];
                const bpIds = [...new Set(items.map(r => r.BusinessPartner).filter(Boolean))];

                if (bpIds.length > 0) {
                    const bps = await bupa.run(
                        SELECT.from('A_BusinessPartner').where({ BusinessPartner: { in: bpIds } })
                    );
                    const bpMap = Object.fromEntries(bps.map(bp => [bp.BusinessPartner, bp]));
                    items.forEach(r => {
                        const bp = bpMap[r.BusinessPartner];
                        if (bp) {
                            r.bpFullName     = bp.BusinessPartnerFullName;
                            r.bpFirstName    = bp.FirstName;
                            r.bpLastName     = bp.LastName;
                            r.bpCategory     = bp.BusinessPartnerCategory;
                            r.bpOrganization = bp.OrganizationBPName1;
                            r.bpCustomer     = bp.Customer;
                            r.bpSupplier     = bp.Supplier;
                            r.bpIsBlocked    = bp.BusinessPartnerIsBlocked;
                        }
                    });
                }
            }

            return results;
        });

        await super.init();
    }
};
