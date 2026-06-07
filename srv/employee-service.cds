using {BP_API.ProcessStep as DBProcessStep} from '../db/schema.cds';
using {API_BUSINESS_PARTNER as bupa} from './external/API_BUSINESS_PARTNER';

service EmployeeService @(path: '/employee') {
    entity ProcessStep       as projection on DBProcessStep;

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
