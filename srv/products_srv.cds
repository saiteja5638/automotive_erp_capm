using products from '../db/products';

service ProductService {

    @odata.draft.enabled
    
    entity Brands                 as projection on products.Brands;


    @readonly
    @cds.search: {
        brandCode,
        name
    }
    entity BrandValueHelps        as
        projection on Brands {
            key brandCode,
                name
        };

    entity VehicleModels          as projection on products.VehicleModels;

    entity VehicleVariants        as projection on products.VehicleVariants;

    entity Characteristics        as projection on products.Characteristics;

    entity CharacteristicValues   as projection on products.CharacteristicValues;

    entity VariantCharacteristics as projection on products.VariantCharacteristics;

    entity VariantAllowedValues   as projection on products.VariantAllowedValues;

    entity AccessoryCategories    as projection on products.AccessoryCategories;

    entity Accessories            as projection on products.Accessories;

    entity AccessoryCompatibility as projection on products.AccessoryCompatibility;

}
