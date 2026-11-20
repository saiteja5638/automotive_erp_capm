using CatalogSalesService from './sales_srv';


annotate CatalogSalesService.Quotations with @(

    UI.SelectionFields              : [quotationNumber],

    UI.LineItem                     : [
        {
            $Type: 'UI.DataField',
            Value: quotationNumber,
            Label: 'Quotation Number'
        },
        {
            $Type: 'UI.DataField',
            Value: quotationDate,
            Label: 'Quotation Date'
        },
        {
            $Type: 'UI.DataField',
            Value: validUntil,
            Label: 'Vaild Untill'
        },
        {
            $Type: 'UI.DataField',
            Value: status,
            Label: 'Status'
        },
    ],

    UI.HeaderInfo                   : {
        TypeName      : 'Quotation Overiew',
        TypeNamePlural: 'Quotation Overiew',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        }
    },

    UI.Facets                       : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Quotation Overview',
        Target: '@UI.FieldGroup#QuotationOverview'
    }],

    UI.FieldGroup #QuotationOverview: {Data: [
        {
            $Type: 'UI.DataField',
            Label: 'Quotation Number',
            Value: quotationNumber
        },
        {
            $Type: 'UI.DataField',
            Label: 'Quotation Date',
            Value: quotationDate
        },
        {
            $Type: 'UI.DataField',
            Label: 'Vaild Until',
            Value: validUntil
        },
        {
            $Type: 'UI.DataField',
            Label: 'Status',
            Value: status
        },
        {
            $Type: 'UI.DataField',
            Label: 'Total Quantity',
            Value: totalQuantity
        },
        {
            $Type: 'UI.DataField',
            Label: 'Sub Total Amount',
            Value: subtotalAmount
        },
        {
            $Type: 'UI.DataField',
            Label: 'Discount Amount',
            Value: discountAmount
        },
        {
            $Type: 'UI.DataField',
            Label: 'Tax Amount',
            Value: taxAmount
        },
        {
            $Type: 'UI.DataField',
            Label: 'Total Amount',
            Value: totalAmount
        },
        {
            $Type: 'UI.DataField',
            Label: 'Remarks',
            Value: remarks
        }


    ]}


);


annotate CatalogSalesService.Customers with @( 
    UI.FieldGroup #CustomerDetail : {
        Data : [
               {
        $Type: 'UI.DataField',
        Label: 'FirstName',
        Value: fullName
    },
    {
        $Type: 'UI.DataField',
        Label: 'Description',
        Value: PDescription
    },
    {
        $Type: 'UI.DataField',
        Label: 'Project Type',
        Value: PType
    },
        ]
    }
);
