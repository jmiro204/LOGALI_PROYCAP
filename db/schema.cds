namespace com.project;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';


entity Salesorder : cuid, managed {
    key Salesorderid : String(16);
        Email        : String(40);
        Firstname    : String(40);
        Lastname     : String(40);
        Country      : String(30);
        Createon     : Date;
        Deliverydate : Date;
        Orderstatus  : Association to VH_Status;
        ImageUrl     : LargeBinary  @UI.IsImage  @Core.MediaType: 'image/jpg';
        ToItems      : Composition of many Items
                           on ToItems.Salesorderid = $self;

}

entity Items : cuid, managed {
    key Salesorderitem   : Int16;
        Name             : String(40);
        Description      : String(40);
        Releasedate      : Date;
        Discontinueddate : Date;
        Price            : Decimal(12, 2);
        @Measures.Unit: Unitofmeasure
        Height           : Decimal(15, 3);
        @Measures.Unit: Unitofmeasure
        Widht            : Decimal(15, 3);
        @Measures.Unit: Unitofmeasure
        Depth            : Decimal(12, 2);        
        Quantity         : Decimal(16, 2);
        @Common.IsUnit
        Unitofmeasure    : String(2);
        Salesorderid     : Association to Salesorder;
};

entity VH_Status : CodeList {
    key Status :Int16;
};