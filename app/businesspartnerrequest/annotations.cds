using EmployeeService as service from '../../srv/employee-service';

annotate service.BusinessPartner with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : BusinessPartner,
            Label : 'Business Partner',
        },
        {
            $Type : 'UI.DataField',
            Value : BusinessPartnerFullName,
            Label : 'Full Name',
        },
        {
            $Type : 'UI.DataField',
            Value : BusinessPartnerCategory,
            Label : 'Category',
        },
        {
            $Type : 'UI.DataField',
            Value : Customer,
            Label : 'Customer',
        },
        {
            $Type : 'UI.DataField',
            Value : Supplier,
            Label : 'Supplier',
        },
        {
            $Type : 'UI.DataField',
            Value : BusinessPartnerIsBlocked,
            Label : 'Blocked',
        },
    ],
    UI.FieldGroup #GeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Value : BusinessPartner,        Label : 'Business Partner' },
            { $Type : 'UI.DataField', Value : BusinessPartnerFullName, Label : 'Full Name' },
            { $Type : 'UI.DataField', Value : FirstName,              Label : 'First Name' },
            { $Type : 'UI.DataField', Value : LastName,               Label : 'Last Name' },
            { $Type : 'UI.DataField', Value : OrganizationBPName1,    Label : 'Organization' },
            { $Type : 'UI.DataField', Value : BusinessPartnerCategory, Label : 'Category' },
            { $Type : 'UI.DataField', Value : Customer,               Label : 'Customer' },
            { $Type : 'UI.DataField', Value : Supplier,               Label : 'Supplier' },
            { $Type : 'UI.DataField', Value : BirthDate,              Label : 'Birth Date' },
            { $Type : 'UI.DataField', Value : BusinessPartnerIsBlocked, Label : 'Blocked' },
            { $Type : 'UI.DataField', Value : CreationDate,           Label : 'Created On' },
            { $Type : 'UI.DataField', Value : LastChangeDate,         Label : 'Last Changed' },
        ],
    },
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'GeneralInfoFacet',
            Label  : 'General Information',
            Target : '@UI.FieldGroup#GeneralInfo',
        },
    ],
    UI.HeaderInfo : {
        TypeName       : 'Business Partner',
        TypeNamePlural : 'Business Partners',
        Title          : { $Type : 'UI.DataField', Value : BusinessPartnerFullName },
        Description    : { $Type : 'UI.DataField', Value : BusinessPartner },
    },
);

annotate service.ProcessStep with @(
    UI.HeaderInfo : {
        TypeName       : 'Process Step',
        TypeNamePlural : 'Process Steps',
        Title          : { $Type : 'UI.DataField', Value : action },
        Description    : { $Type : 'UI.DataField', Value : BusinessPartner },
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Business Partner',
            Value : BusinessPartner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'User',
            Value : user,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Action',
            Value : action,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Comment',
            Value : comment,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Executed',
            Value : executed,
        },
    ],
    UI.FieldGroup #ProcessStepInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Business Partner', Value : BusinessPartner },
            { $Type : 'UI.DataField', Label : 'User',             Value : user },
            { $Type : 'UI.DataField', Label : 'Action',           Value : action },
            { $Type : 'UI.DataField', Label : 'Comment',          Value : comment },
            { $Type : 'UI.DataField', Label : 'Executed',         Value : executed },
        ],
    },
    UI.FieldGroup #BusinessPartnerInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { $Type : 'UI.DataField', Label : 'Business Partner ID', Value : BusinessPartner },
            { $Type : 'UI.DataField', Label : 'Full Name',           Value : bpFullName },
            { $Type : 'UI.DataField', Label : 'First Name',          Value : bpFirstName },
            { $Type : 'UI.DataField', Label : 'Last Name',           Value : bpLastName },
            { $Type : 'UI.DataField', Label : 'Organization',        Value : bpOrganization },
            { $Type : 'UI.DataField', Label : 'Category',            Value : bpCategory },
            { $Type : 'UI.DataField', Label : 'Customer',            Value : bpCustomer },
            { $Type : 'UI.DataField', Label : 'Supplier',            Value : bpSupplier },
            { $Type : 'UI.DataField', Label : 'Blocked',             Value : bpIsBlocked },
        ],
    },
    UI.Facets : [
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'ProcessStepFacet',
            Label  : 'Process Step',
            Target : '@UI.FieldGroup#ProcessStepInfo',
        },
        {
            $Type  : 'UI.ReferenceFacet',
            ID     : 'BusinessPartnerFacet',
            Label  : 'Business Partner',
            Target : '@UI.FieldGroup#BusinessPartnerInfo',
        },
    ],
);

