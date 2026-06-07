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

            // Strip virtual columns so the DB query only touches real fields.
            // Re-use req.query directly to preserve where, one, orderBy, limit, etc.
            if (sel.columns) {
                sel.columns = sel.columns.filter(c => !bpVirtuals.includes(c.ref?.[0]));
            }

            const results = await db.run(req.query);

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
