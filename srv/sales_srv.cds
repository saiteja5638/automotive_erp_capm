using sales from '../db/sales';

service Sales {

    entity Quotations        as projection on sales.Quotations;

    entity QuotationItems    as projection on sales.QuotationItems;

    entity SalesOrders       as projection on sales.SalesOrders;

    entity SalesOrderItems   as projection on sales.SalesOrderItems;

    entity Customers         as projection on sales.Customers;

    entity CustomerAddresses as projection on sales.CustomerAddresses;

    entity CustomerContacts  as projection on sales.CustomerContacts;

}
