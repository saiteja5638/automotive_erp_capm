using schema from '../db/schema';

service OrganizationService {

    @odata.draft.enabled
    entity Companies     as projection on schema.Companies;

    entity States        as projection on schema.States;

    entity Cities        as projection on schema.Cities;

    entity Showrooms     as projection on schema.Showrooms;

    entity Employees     as projection on schema.Employees;

    entity EmployeeRoles as projection on schema.EmployeeRoles;

}
