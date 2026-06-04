using {BP_API.Employee as DBEmployee} from '../db/schema.cds';
using {API_BUSINESS_PARTNER as bupa} from './external/API_BUSINESS_PARTNER';

service EmployeeService @(path: '/employee') {
    entity Employees       as projection on DBEmployee;

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
