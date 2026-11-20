using salhist from '../db/sales';

service CatalogSalesService {

    entity Quotations        as projection on salhist.Quotations;

    entity QuotationItems    as projection on salhist.QuotationItems;

    entity SalesOrders       as projection on salhist.SalesOrders;

    entity SalesOrderItems   as projection on salhist.SalesOrderItems;

    entity Customers         as projection on salhist.Customers {
        *,
        firstName || '' || lastName as fullName : String
    };

    entity CustomerAddresses as projection on salhist.CustomerAddresses;

    entity CustomerContacts  as projection on salhist.CustomerContacts;

}
