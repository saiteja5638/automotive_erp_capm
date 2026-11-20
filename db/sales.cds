using {cuid, managed} from '@sap/cds/common';

using products from './products';
using schema from './schema';


context salhist {


    // ============================================================
    // 1. QUOTATION HEADER
    // ============================================================
    entity Quotations : cuid, managed {

        quotationNumber : String(30) not null;

        quotationDate   : Date not null;
        validUntil      : Date;

        status          : String(20) default 'DRAFT' not null;
        // DRAFT / SUBMITTED / APPROVED / REJECTED
        // ACCEPTED / EXPIRED / CANCELLED

        customer        : Association to Customers not null;

        showroom        : Association to schema.Showrooms not null;

        salesEmployee   : Association to schema.Employees;

        currency        : String(3) default 'INR' not null;

        totalQuantity   : Integer default 0;

        subtotalAmount  : Decimal(15, 2) default 0;

        discountAmount  : Decimal(15, 2) default 0;

        taxAmount       : Decimal(15, 2) default 0;

        totalAmount     : Decimal(15, 2) default 0;

        remarks         : String(500);

        items           : Composition of many QuotationItems
                              on items.quotation = $self;
    }


    // ============================================================
    // 2. QUOTATION ITEMS
    // ============================================================
    entity QuotationItems : cuid, managed {

        itemNumber         : Integer not null;

        model              : Association to products.VehicleModels not null;

        variant            : Association to products.VehicleVariants not null;

        quantity           : Integer default 1 not null;

        unitPrice          : Decimal(15, 2) not null;

        grossAmount        : Decimal(15, 2) default 0;

        discountPercentage : Decimal(5, 2) default 0;

        discountAmount     : Decimal(15, 2) default 0;

        taxableAmount      : Decimal(15, 2) default 0;

        taxPercentage      : Decimal(5, 2) default 0;

        taxAmount          : Decimal(15, 2) default 0;

        netAmount          : Decimal(15, 2) default 0;

        currency           : String(3) default 'INR';

        quotation          : Association to Quotations not null;
    }


    // ============================================================
    // 3. SALES ORDER HEADER
    // ============================================================
    entity SalesOrders : cuid, managed {

        salesOrderNumber : String(30) not null;

        orderDate        : Date not null;

        status           : String(30) default 'OPEN' not null;
        // OPEN / CONFIRMED / IN_PROGRESS
        // COMPLETED / CANCELLED

        customer         : Association to Customers not null;

        showroom         : Association to schema.Showrooms not null;

        salesEmployee    : Association to schema.Employees;

        quotation        : Association to Quotations not null;

        currency         : String(3) default 'INR' not null;

        totalQuantity    : Integer default 0;

        subtotalAmount   : Decimal(15, 2) default 0;

        discountAmount   : Decimal(15, 2) default 0;

        taxAmount        : Decimal(15, 2) default 0;

        totalAmount      : Decimal(15, 2) default 0;

        remarks          : String(500);

        items            : Composition of many SalesOrderItems
                               on items.salesOrder = $self;
    }


    // ============================================================
    // 4. SALES ORDER ITEMS
    // ============================================================
    entity SalesOrderItems : cuid, managed {

        itemNumber         : Integer not null;

        model              : Association to products.VehicleModels not null;

        variant            : Association to products.VehicleVariants not null;

        quotationItem      : Association to QuotationItems;

        quantity           : Integer default 1 not null;

        unitPrice          : Decimal(15, 2) not null;

        grossAmount        : Decimal(15, 2) default 0;

        discountPercentage : Decimal(5, 2) default 0;

        discountAmount     : Decimal(15, 2) default 0;

        taxableAmount      : Decimal(15, 2) default 0;

        taxPercentage      : Decimal(5, 2) default 0;

        taxAmount          : Decimal(15, 2) default 0;

        netAmount          : Decimal(15, 2) default 0;

        currency           : String(3) default 'INR';

        salesOrder         : Association to SalesOrders not null;
    }


    // ========================================
    // 1. CUSTOMER MASTER
    // ========================================
    entity Customers : cuid, managed {

        customerCode    : String(20);

        customerType    : String(20) not null;
        // INDIVIDUAL / CORPORATE

        firstName       : String(100);
        lastName        : String(100);

        companyName     : String(200);

        email           : String(150);
        mobileNumber    : String(20);
        alternateNumber : String(20);

        taxNumber       : String(30);
        gstNumber       : String(20);

        dateOfBirth     : Date;

        gender          : String(20);

        isActive        : Boolean default true;

        remarks         : String(500);

        addresses       : Composition of many CustomerAddresses
                              on addresses.customer = $self;

        contacts        : Composition of many CustomerContacts
                              on contacts.customer = $self;
    }


    // ========================================
    // 2. CUSTOMER ADDRESS
    // ========================================
    entity CustomerAddresses : cuid, managed {

        addressType  : String(20) not null;
        // HOME / OFFICE / BILLING / DELIVERY

        addressLine1 : String(200) not null;
        addressLine2 : String(200);

        landmark     : String(100);

        city         : String(100);
        district     : String(100);

        state        : String(100);
        country      : String(100) default 'India';

        postalCode   : String(10);

        isDefault    : Boolean default false;

        customer     : Association to Customers not null;
    }


    // ========================================
    // 3. CUSTOMER CONTACT PERSON
    // ========================================
    entity CustomerContacts : cuid, managed {

        contactName     : String(150) not null;

        designation     : String(100);

        email           : String(150);

        mobileNumber    : String(20);

        alternateNumber : String(20);

        isPrimary       : Boolean default false;

        remarks         : String(250);

        customer        : Association to Customers not null;
    }

}