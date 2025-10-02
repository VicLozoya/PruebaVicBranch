table 50100 Table_Datos_Entrega
{
    Caption = 'Table_Datos_Entrega';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; NoPedido; Code[20])
        {
            Caption = 'NoPedido';
        }
        field(2; NoProveedor; Code[20])
        {
            Caption = 'NoProveedor';
        }
        field(3; NoRemision; Code[20])
        {
            Caption = 'NoRemision';
        }
        field(4; FechaRecepcion; Date)
        {
            Caption = 'FechaRecepcion';
        }
        field(5; HoraRecepcion; Time)
        {
            Caption = 'HoraRecepcion';
        }
        field(6; Comprador; Code[20])
        {
            Caption = 'Purchaser Code';
            TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
        }
    }
    keys
    {
        key(PK; NoPedido, NoRemision)
        {
            Clustered = true;
        }
    }
}
