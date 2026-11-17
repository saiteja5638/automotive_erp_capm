using {cuid, managed} from '@sap/cds/common';

context schema {

    entity Companies : cuid, managed {
        companyCode : String(10) not null;
        name        : String(100) not null;
        legalName   : String(150);
        currency    : String(3) default 'INR';
        country     : String(3) default 'IND';
        isActive    : Boolean default true;

        states      : Composition of many States
                          on states.company = $self;
    }

    entity States : cuid, managed {
        stateCode : String(10) not null;
        name      : String(100) not null;
        gstCode   : String(2);

        company   : Association to Companies not null;

        cities    : Composition of many Cities
                        on cities.state = $self;
    }

    entity Cities : cuid, managed {
        cityCode  : String(15) not null;
        name      : String(100) not null;
        pincode   : String(6);

        state     : Association to States not null;

        showrooms : Composition of many Showrooms
                        on showrooms.city = $self;
    }

    entity Showrooms : cuid, managed {
        showroomCode : String(20) not null;
        name         : String(150) not null;
        address      : String(500);
        postalCode   : String(6);
        phone        : String(15);
        email        : String(100);
        isActive     : Boolean default true;

        city         : Association to Cities not null;

        employees    : Composition of many Employees
                           on employees.showroom = $self;
    }


    entity Employees : cuid, managed {
        employeeNo  : String(20) not null;
        firstName   : String(80) not null;
        lastName    : String(80);
        email       : String(150) not null;
        mobile      : String(15);
        joiningDate : Date;
        isActive    : Boolean default true;

        showroom    : Association to Showrooms not null;

        roles       : Composition of many EmployeeRoles
                          on roles.employee = $self;
    }

    entity EmployeeRoles : cuid, managed {
        roleCode : String(40) not null;

        employee : Association to Employees not null;
    }


}