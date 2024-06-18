using {ServiceCatalog as call} from '../service';
using from './annotations-Items';

annotate call.Salesorder with @odata.draft.enabled;

annotate call.Salesorder with {
    Salesorderid  @title: 'Sales order'  @mandatory;
    Firstname     @title: 'First name';
    Lastname      @title: 'Last name';
    Email         @title: 'Email'        @mandatory;
    Deliverydate  @title: 'Delivery date';
    Orderstatus   @title: 'Order status';
    ImageUrl      @title: 'Image';

};

annotate call.Salesorder with @(
    UI.SelectionFields   : [
        Firstname,
        Lastname,
        Orderstatus
    ],
    UI.LineItem          : [
        {
            $Type                : 'UI.DataField',
            Value                : ImageUrl,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '6rem',
            }
        },
        {
            $Type: 'UI.DataField',
            Value: Salesorderid
        },
        {
            $Type: 'UI.DataField',
            Value: Firstname
        },
        {
            $Type: 'UI.DataField',
            Value: Lastname
        },
        {
            $Type: 'UI.DataField',
            Value: Email
        }

    ],
    UI.FieldGroup #Genera: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Salesorderid,
            },
            {
                $Type: 'UI.DataField',
                Value: Firstname,
            },
            {
                $Type: 'UI.DataField',
                Value: Lastname,
            },
            {
                $Type: 'UI.DataField',
                Value: Email,
            },
        ],
        Label: 'Datos generales'
    },
    UI.Facets            : [
        {
            $Type       : 'UI.CollectionFacet',
            Facets      : [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#Genera',
                Label : 'Datos generales'
            }, ],
            @title      : 'Datos',
            @description: 'Datos',
            Label       : 'Datos generales',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'ToItems/@UI.LineItem#Items',
        },
    ]

);
