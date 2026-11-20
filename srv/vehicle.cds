using ProductService from './products_srv';

annotate ProductService.Brands with @(

    UI.SelectionFields        : [
        brandCode,
        name,
        isActive
    ],

    Capabilities.FilterRestrictions :{
      Filterable : true,
      NonFilterableProperties :[
        description
      ]
    },
    UI.LineItem               : [
        {
            $Type: 'UI.DataField',
            Value: brandCode,
            Label: 'Brand Code'
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Brand Name'
        },
        {
            $Type: 'UI.DataField',
            Value: description,
            Label: 'Description'
        },
        {
            $Type: 'UI.DataField',
            Value: isActive,
            Label: 'Status'
        }
    ],

    UI.HeaderInfo             : {
        TypeName      : 'Brand',
        TypeNamePlural: 'Brands',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    },

    UI.Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CarOverview',
            Label : 'Car Information',
            Target: '@UI.FieldGroup#CarOverview'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CarModels',
            Label : 'Car Models',
            Target: 'models/@UI.LineItem'
        }
    ],

    UI.FieldGroup #CarOverview: {Data: [
        {
            $Type: 'UI.DataField',
            Value: brandCode,
            Label: 'Brand Code'
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Brand Name'
        },
        {
            $Type: 'UI.DataField',
            Value: description,
            Label: 'Description'
        },
        {
            $Type: 'UI.DataField',
            Value: isActive,
            Label: 'Status'
        }
    ]},

    
);


annotate ProductService.VehicleModels with @(
    
    UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: modelCode,
        Label: 'Model Code'
    },
    {
        $Type: 'UI.DataField',
        Value: name,
        Label: 'Model Name'
    },
    {
        $Type: 'UI.DataField',
        Value: description,
        Label: 'Description'
    },
    {
        $Type: 'UI.DataField',
        Value: launchDate,
        Label: 'Launch Date'
    },
    {
        $Type: 'UI.DataField',
        Value: isActive,
        Label: 'Status'
    }
],

    UI.HeaderInfo             : {
        TypeName      : 'VehicleModels',
        TypeNamePlural: 'VehicleModels',
        Title         : {
            $Type: 'UI.DataField',
            Value: name
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description
        }
    },

        UI.Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'variants',
            Label : 'Model Varients',
            Target: 'variants/@UI.LineItem'
        }
    ]


);


annotate ProductService.VehicleVariants with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: variantCode,
        Label: 'Model Code'
    },
    {
        $Type: 'UI.DataField',
        Value: name,
        Label: 'Varient Name'
    },
    {
        $Type: 'UI.DataField',
        Value: description,
        Label: 'Varient Description'
    },
    {
        $Type: 'UI.DataField',
        Value: basePrice,
        Label: 'Base Price'
    },
    {
        $Type: 'UI.DataField',
        Value: currency,
        Label: 'Currency'
    }
]);
