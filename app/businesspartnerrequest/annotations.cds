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
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'BusinessPartner',
                Value : BusinessPartner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'user',
                Value : user,
            },
            {
                $Type : 'UI.DataField',
                Label : 'action',
                Value : action,
            },
            {
                $Type : 'UI.DataField',
                Label : 'comment',
                Value : comment,
            },
            {
                $Type : 'UI.DataField',
                Label : 'executed',
                Value : executed,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'BusinessPartner',
            Value : BusinessPartner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'user',
            Value : user,
        },
        {
            $Type : 'UI.DataField',
            Label : 'action',
            Value : action,
        },
        {
            $Type : 'UI.DataField',
            Label : 'comment',
            Value : comment,
        },
        {
            $Type : 'UI.DataField',
            Label : 'executed',
            Value : executed,
        },
    ],
);

