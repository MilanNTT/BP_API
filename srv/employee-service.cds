using {BP_API.ProcessStep as DBProcessStep} from '../db/schema.cds';
using {API_BUSINESS_PARTNER as bupa} from './external/API_BUSINESS_PARTNER';

service EmployeeService @(path: '/employee') {
    entity ProcessStep as projection on DBProcessStep {
        *,
        virtual bpFullName     : String,
        virtual bpFirstName    : String,
        virtual bpLastName     : String,
        virtual bpCategory     : String,
        virtual bpOrganization : String,
        virtual bpCustomer     : String,
        virtual bpSupplier     : String,
        virtual bpIsBlocked    : Boolean
    };

    entity BusinessPartner as
        projection on bupa.A_BusinessPartner {
            key BusinessPartner,
                BusinessPartnerFullName,
                BusinessPartnerName,
                FirstName,
                LastName,
                BusinessPartnerCategory,
                OrganizationBPName1,
                Customer,
                Supplier,
                BirthDate,
                BusinessPartnerIsBlocked,
                CreationDate,
                LastChangeDate
        };
}
