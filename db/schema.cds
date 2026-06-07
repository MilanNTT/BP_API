namespace BP_API;

using {cuid} from '@sap/cds/common';

entity ProcessStep : cuid {
    BusinessPartner : String(10);
    user            : String(100);
    action          : String(100);
    comment         : String(100);
    executed        : DateTime;
}