using {cuid, managed} from '@sap/cds/common';

context products {


    // ==========================================
    // 1. BRAND MASTER
    // ==========================================

    entity Brands : cuid, managed {
        brandCode   : String(20) not null;
        name        : String(100) not null;
        description : String(500);
        country     : String(3);
        isActive    : Boolean default true;

        models      : Composition of many VehicleModels
                          on models.brand = $self;
    }


    // ==========================================
    // 2. VEHICLE MODEL MASTER
    // ==========================================

    entity VehicleModels : cuid, managed {
        modelCode   : String(30) not null;
        name        : String(100) not null;
        description : String(500);
        launchDate  : Date;
        isActive    : Boolean default true;

        brand       : Association to Brands not null;

        variants    : Composition of many VehicleVariants
                          on variants.model = $self;
    }


    // ==========================================
    // 3. VEHICLE VARIANT MASTER
    // ==========================================

    entity VehicleVariants : cuid, managed {
        variantCode        : String(30) not null;
        name               : String(100) not null;
        description        : String(500);

        basePrice          : Decimal(15, 2) default 0;
        currency           : String(3) default 'INR';

        isActive           : Boolean default true;

        model              : Association to VehicleModels not null;

        characteristics    : Composition of many VariantCharacteristics
                                 on characteristics.variant = $self;

        allowedAccessories : Composition of many AccessoryCompatibility
                                 on allowedAccessories.variant = $self;
    }


    // ==========================================
    // 4. CHARACTERISTIC MASTER
    // ==========================================

    entity Characteristics : cuid, managed {
        characteristicCode : String(30) not null;
        name               : String(100) not null;
        description        : String(500);

        dataType           : String(20) default 'STRING';
        unit               : String(20);

        isActive           : Boolean default true;
    }


    // ==========================================
    // 5. CHARACTERISTIC VALUES
    // ==========================================

    entity CharacteristicValues : cuid, managed {
        valueCode      : String(30) not null;
        value          : String(100) not null;
        description    : String(250);

        numericValue   : Decimal(15, 3);
        isActive       : Boolean default true;

        characteristic : Association to Characteristics not null;
    }


    // ==========================================
    // 6. VARIANT CHARACTERISTICS
    // ==========================================

    entity VariantCharacteristics : cuid, managed {
        variant        : Association to VehicleVariants not null;

        characteristic : Association to Characteristics not null;

        isMandatory    : Boolean default true;

        selectionMode  : String(10) default 'SINGLE';

        minSelections  : Integer default 1;
        maxSelections  : Integer default 1;

        allowedValues  : Composition of many VariantAllowedValues
                             on allowedValues.variantCharacteristic = $self;
    }


    // ==========================================
    // 7. VARIANT ALLOWED VALUES
    // ==========================================

    entity VariantAllowedValues : cuid, managed {
        variantCharacteristic : Association to VariantCharacteristics not null;

        value                 : Association to CharacteristicValues not null;

        isDefault             : Boolean default false;

        sortOrder             : Integer default 0;
    }


    // ==========================================
    // 8. ACCESSORY CATEGORY MASTER
    // ==========================================

    entity AccessoryCategories : cuid, managed {
        categoryCode : String(30) not null;
        name         : String(100) not null;
        description  : String(250);

        isActive     : Boolean default true;

        accessories  : Composition of many Accessories
                           on accessories.category = $self;
    }


    // ==========================================
    // 9. ACCESSORY MASTER
    // ==========================================

    entity Accessories : cuid, managed {
        accessoryCode : String(30) not null;
        name          : String(150) not null;
        description   : String(500);

        basePrice     : Decimal(15, 2) default 0;
        currency      : String(3) default 'INR';

        isOptional    : Boolean default true;
        isActive      : Boolean default true;

        category      : Association to AccessoryCategories not null;
    }


    // ==========================================
    // 10. ACCESSORY COMPATIBILITY
    // ==========================================

    entity AccessoryCompatibility : cuid, managed {
        variant     : Association to VehicleVariants not null;

        accessory   : Association to Accessories not null;

        isMandatory : Boolean default false;

        isActive    : Boolean default true;
    }



}