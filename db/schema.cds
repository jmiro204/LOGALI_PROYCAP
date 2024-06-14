namespace com.logaligroup;

using {
    cuid,
} from '@sap/cds/common';

entity Headersales : cuid, managed  {
    key Salesorder   : String(16);
        Email        : String(40);
        Firstname    : String(40);
        Lastname     : String(40);
        Country      : String(30);
        Createon     : Date;
        Deliverydate : Date;
        Orderstatus  : Int16;
        ImageUrl     : String(600) @UI.IsImageURL;
        ToItems   : Composition of many Items
                              on ToItems.Salesorder = $self;

}

entity Items : cuid  {
    key Salesorderitem : Int16;
        Name        : String(40);
        Description    : String(40);
        Releasedate: Date;
        Discontinueddate: Date;
        Price: Decimal(12,2);
        Height: Decimal(15,3);
        Widht: Decimal(15,3);
        Depth: Decimal(12,2);
        @Measures.Unit: Unitofmeasure
        Quantity: Decimal(16,2);
        @Common.IsUnit
        Unitofmeasure: String(2);

        Salesorder    : Association to Headersales ;
};
