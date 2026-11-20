using OrganizationService from './schema_srv';

annotate OrganizationService.Companies with @(

  UI.SelectionFields : [
    companyCode
  ],

    UI.LineItem       : [
        {
            Value: companyCode,
            Label: 'Company Code'
        },
        {
            Value: name,
            Label: 'Company Name'
        },
        {
            Value: currency,
            Label: 'Currency'
        },
        {
            Value: country,
            Label: 'Country'
        },
        {
            Value: isActive,
            Label: 'Status'
        }
    ],


UI.FieldGroup #GeneralInfo: {
    $Type: 'UI.FieldGroupType',
    Label: 'General Information',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: companyCode,
            Label: 'Company Code'
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Company Name'
        },
        {
            $Type: 'UI.DataField',
            Value: currency,
            Label: 'Currency'
        }
    ]
},

UI.FieldGroup #CompanyInfo: {
    $Type: 'UI.FieldGroupType',
    Label: 'Company Information',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: states,
            Label: 'State'
        },
        {
            $Type: 'UI.DataField',
            Value: isActive,
            Label: 'Status'
        }
    ]
},

UI.Facets                 : [
    {
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneralFacet',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneralInfo'
    },
    {
        $Type : 'UI.CollectionFacet',
        ID    : 'CompanyFacet',
        Label : 'Company Information',
        Facets: [
                {
                    $Type: 'UI.ReferenceFacet',
                    ID: 'CompanyTable',
                    Label: 'States',
                    Target: 'states/@UI.LineItem'
                }
            ]
    }
]


);

annotate OrganizationService.States with @(
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'State Name'
        },
        {
            $Type: 'UI.DataField',
            Value: company.name,
            Label: 'Company'
        }
    ]
);