using products from '../db/products';

service ProductService {

    entity Brands                 as projection on products.Brands;

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
