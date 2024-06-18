using {ServiceCatalog as call} from '../service';

annotate call.Items with {
    Salesorderitem   @title: 'Items' @mandatory;
    Name             @title: 'Name';
    Description      @title: 'Description';
    Releasedate      @title: 'Releasedate';
    Discontinueddate @title: 'Discontinueddate';
    Price            @title: 'Price';
    Height           @title: 'Height';
    Widht            @title: 'Widht';
    Depth            @title: 'Depth';
    Quantity         @title: 'Quantity';
    Unitofmeasure    @title: 'Unitofmeasure';
};


annotate call.Items with @(


    UI.LineItem #Items : [
         {
            $Type : 'UI.DataField',
            Value : Salesorderitem,
        },
        {
            $Type : 'UI.DataField',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Value : Description,
        },
        {
            $Type : 'UI.DataField',
            Value : Price
            ,
        },
        {
            $Type : 'UI.DataField',
            Value : Quantity,
        },
        {
            $Type : 'UI.DataField',
            Value : Unitofmeasure,
        },
        {
            $Type : 'UI.DataField',
            Value : Releasedate,
        },
        {
            $Type : 'UI.DataField',
            Value : Discontinueddate,
        }        
    ]

);