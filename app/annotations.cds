using { invoiceTrackingSrv } from '../srv/service.cds';

annotate invoiceTrackingSrv.Invoices with @UI.DataPoint #invoiceDate: {
  Value: invoiceDate,
  Title: 'Invoice Date',
};
annotate invoiceTrackingSrv.Invoices with @UI.DataPoint #totalAmount: {
  Value: totalAmount,
  Title: 'Total Amount',
  CriticalityCalculation: {
    ImprovementDirection: #Minimize,
    ToleranceRangeHighValue: 200,
    DeviationRangeHighValue: 260
  },
  CriticalityRepresentation: #WithIcon
};
annotate invoiceTrackingSrv.Invoices with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#invoiceDate', ID: 'InvoiceDate' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#totalAmount', ID: 'TotalAmount' }
];
annotate invoiceTrackingSrv.Invoices with @UI.HeaderInfo: {
  TypeName: 'Invoice',
  TypeNamePlural: 'Invoices',
  Title: { Value: invoiceNumber }
};
annotate invoiceTrackingSrv.Invoices with {
  ID @UI.Hidden
};
annotate invoiceTrackingSrv.Invoices with @UI.Identification: [{ Value: invoiceNumber }];
annotate invoiceTrackingSrv.Invoices with {
  invoiceNumber @Common.Label: 'Invoice Number';
  invoiceDate @Common.Label: 'Invoice Date';
  totalAmount @Common.Label: 'Total Amount';
  lineItems @Common.Label: 'Line Items'
};
annotate invoiceTrackingSrv.Invoices with {
  ID @Common.Text: { $value: invoiceNumber, ![@UI.TextArrangement]: #TextOnly };
};
annotate invoiceTrackingSrv.Invoices with @UI.SelectionFields: [
  invoiceNumber
];
annotate invoiceTrackingSrv.Invoices with @UI.LineItem : [
    { $Type: 'UI.DataField', Value: invoiceNumber },
    { $Type: 'UI.DataField', Value: invoiceDate },
    { $Type: 'UI.DataFieldForAnnotation', Target: '@UI.DataPoint#totalAmount' }
];
annotate invoiceTrackingSrv.Invoices with @UI.FieldGroup #invoiceDetails: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: invoiceNumber },
    { $Type: 'UI.DataField', Value: invoiceDate },
    { $Type: 'UI.DataField', Value: totalAmount }

  ]
};


annotate invoiceTrackingSrv.LineItems with @UI.LineItem #lineItems: [
    { $Type: 'UI.DataField', Value: lineItemNumber },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: unitPrice }

  ];


annotate invoiceTrackingSrv.Invoices with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'invoiceDetails', Label: 'Invoice Details', Target: '@UI.FieldGroup#invoiceDetails' },
  { $Type: 'UI.ReferenceFacet', ID: 'lineItems', Label: 'Line Items', Target: 'lineItems/@UI.LineItem#lineItems' }
];
annotate invoiceTrackingSrv.LineItems with {
  invoice @Common.ValueList: {
    CollectionPath: 'Invoices',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: invoice_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'invoiceNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'invoiceDate'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalAmount'
      },
    ],
  }
};
annotate invoiceTrackingSrv.LineItems with {
  product @Common.ValueList: {
    CollectionPath: 'Products',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: product_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productCode'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'productName'
      },
    ],
  }
};
annotate invoiceTrackingSrv.LineItems with @UI.DataPoint #quantity: {
  Value: quantity,
  Title: 'Quantity',
};
annotate invoiceTrackingSrv.LineItems with @UI.DataPoint #unitPrice: {
  Value: unitPrice,
  Title: 'Unit Price',
};
annotate invoiceTrackingSrv.LineItems with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#quantity', ID: 'Quantity' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#unitPrice', ID: 'UnitPrice' }
];
annotate invoiceTrackingSrv.LineItems with @UI.HeaderInfo: {
  TypeName: 'Line Item',
  TypeNamePlural: 'Line Items',
  Title: { Value: lineItemNumber }
};
annotate invoiceTrackingSrv.LineItems with {
  ID @UI.Hidden
};
annotate invoiceTrackingSrv.LineItems with @UI.Identification: [{ Value: lineItemNumber }];
annotate invoiceTrackingSrv.LineItems with {
  lineItemNumber @Common.Label: 'Line Item Number';
  quantity @Common.Label: 'Quantity';
  unitPrice @Common.Label: 'Unit Price';
  invoice @Common.Label: 'Invoice';
  product @Common.Label: 'Product'
};
annotate invoiceTrackingSrv.LineItems with {
  ID @Common.Text: { $value: lineItemNumber, ![@UI.TextArrangement]: #TextOnly };
  invoice @Common.Text: { $value: invoice.invoiceNumber, ![@UI.TextArrangement]: #TextOnly };
  product @Common.Text: { $value: product.productCode, ![@UI.TextArrangement]: #TextOnly };
};
annotate invoiceTrackingSrv.LineItems with @UI.SelectionFields: [
  invoice_ID,
  product_ID
];
annotate invoiceTrackingSrv.LineItems with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: lineItemNumber },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: unitPrice },
    { $Type: 'UI.DataField', Label: 'Invoice', Value: invoice_ID },
    { $Type: 'UI.DataField', Label: 'Product', Value: product_ID }
];
annotate invoiceTrackingSrv.LineItems with @UI.FieldGroup #lineItemsSection: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: lineItemNumber },
    { $Type: 'UI.DataField', Value: quantity },
    { $Type: 'UI.DataField', Value: unitPrice }

  ]
};


annotate invoiceTrackingSrv.LineItems with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'lineItemsSection', Label: 'Line Items', Target: '@UI.FieldGroup#lineItemsSection' }
];
annotate invoiceTrackingSrv.Products with @UI.DataPoint #productName: {
  Value: productName,
  Title: 'Product Name',
};
annotate invoiceTrackingSrv.Products with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#productName', ID: 'ProductName' }
];
annotate invoiceTrackingSrv.Products with @UI.HeaderInfo: {
  TypeName: 'Product',
  TypeNamePlural: 'Products',
  Title: { Value: productCode }
};
annotate invoiceTrackingSrv.Products with {
  ID @UI.Hidden
};
annotate invoiceTrackingSrv.Products with @UI.Identification: [{ Value: productCode }];
annotate invoiceTrackingSrv.Products with {
  productCode @Common.Label: 'Product Code';
  productName @Common.Label: 'Product Name'
};
annotate invoiceTrackingSrv.Products with {
  ID @Common.Text: { $value: productCode, ![@UI.TextArrangement]: #TextOnly };
};
annotate invoiceTrackingSrv.Products with @UI.SelectionFields: [
  productCode
];
annotate invoiceTrackingSrv.Products with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: productCode },
    { $Type: 'UI.DataField', Value: productName }
];
annotate invoiceTrackingSrv.Products with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: productCode },
    { $Type: 'UI.DataField', Value: productName }
]};
annotate invoiceTrackingSrv.Products with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];