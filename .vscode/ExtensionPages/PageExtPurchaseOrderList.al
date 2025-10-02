pageextension 50100 Page_Ext_PurchaseOrderList extends "Purchase Order List"
{
    layout
    {
        addlast(Content)
        {
            group("Datos Adicionales y de estado")
            {
                field(Aprobado; Rec.Aprobado)
                {
                    ApplicationArea = All;
                    Caption = 'Aprobado';
                }
                field(Estado; Rec.Estado)
                {
                    ApplicationArea = All;
                    Caption = 'Estado';
                }
            }//cierre grupo

        }
    }

}
