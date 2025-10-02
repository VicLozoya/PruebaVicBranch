page 50100 Page_Datos_Entrega
{
    ApplicationArea = All;
    Caption = 'Datos de Entrega';
    PageType = List;
    SourceTable = Table_Datos_Entrega;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No. Pedido"; Rec.NoPedido)
                {
                    Caption = 'No. Pedido';
                    ToolTip = 'Número del pedido.', Comment = '%';
                }
                field("No. Proveedor"; Rec.NoProveedor)
                {
                    Caption = 'No. Proveedor';
                    ToolTip = 'Proveedor del pedido.', Comment = '%';
                }
                field(NoRemision; Rec.NoRemision)
                {
                    Caption = 'No. Remisión';
                    ToolTip = 'Número de remisión.', Comment = '%';
                }
                field(FechaRecepcion; Rec.FechaRecepcion)
                {
                    Caption = 'Fecha Recepción';
                    ToolTip = 'Fecha de recepción.', Comment = '%';
                }
                field(HoraRecepcion; Rec.HoraRecepcion)
                {
                    Caption = 'Hora Recepción';
                    ToolTip = 'Hora de recepción (capturar en formato 24 hrs.).', Comment = '%';
                }
                field(Comprador; Rec.Comprador)
                {
                    Caption = 'Comprador';
                    ToolTip = 'Especifica el comprador que ha creado el registro.', Comment = '%';
                    Visible = false;
                }
            }//cierre repeater General
        }
    }//cierre layout

    trigger OnOpenPage()
    begin
        if PedidoNo <> '' then
            Rec.SetFilter(NoPedido, '%1', PedidoNo);

        //Rec.SetFilter(Comprador, '%1', UserId);

        CurrPage.Caption := rec.NoPedido + ' - Datos de Entrega del Pedido';

        if ProveedorNo <> '' then begin
            Rec.NoProveedor := ProveedorNo;
            if Rec.Modify() then;
        end;
        //CurrPage.Update();
    end;

    var
        PedidoNo: Code[20];
        ProveedorNo: Code[20];
        Comprador: Text[200];
}
