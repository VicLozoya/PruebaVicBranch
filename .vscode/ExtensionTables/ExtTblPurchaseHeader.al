tableextension 50100 Ext_Tbl_PurchaseHeader extends "Purchase Header"
{
    fields
    {
        field(50100; Aprobado; Boolean)
        {
            Caption = 'Aprobado';
            DataClassification = ToBeClassified;
        }
        field(50101; Estado; Option)
        {
            Caption = 'Estado';
            DataClassification = ToBeClassified;
            OptionMembers = Nueva,"En recepción","Crear CxP";
        }
        field(50102; Comentarios_Comprador; Text[200])
        {
            Caption = 'Comentarios_Comprador';
            DataClassification = ToBeClassified;
        }
        field(50103; Fecha_Recepcion; DateTime)
        {
            Caption = 'Fecha_Recepcion';
            DataClassification = ToBeClassified;
        }
    }
}
