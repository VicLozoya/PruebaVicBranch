pageextension 50101 PageExtPurchaseOrder extends "Purchase Order"
{
    layout
    {

        addlast(Content)
        {
            group("Datos adicionales y de estado")
            {
                Caption = 'Datos adicionales y de estatus';
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
                field(Comentarios_Comprador; Rec.Comentarios_Comprador)
                {
                    ApplicationArea = All;
                    Caption = 'Comentarios Comprador';
                }
                field(Fecha_Recepcion; Rec.Fecha_Recepcion)
                {
                    ApplicationArea = All;
                    Caption = 'Fecha Recepción';
                }
            }
            group("Auditoría")
            {
                Caption = 'Auditoría';
                field("Fecha de creación"; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Fecha de creación';
                }
                field("Fecha de modificación"; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    Caption = 'Fecha de modificación';
                }
                field("Creado por"; UserRec."User Name" + ' (' + UserRec."Full Name" + ')')
                {
                    ApplicationArea = All;
                    Caption = 'Creado por';
                    ToolTip = 'Usuario que creó el registro.';
                    Editable = false;
                    //Enabled = false;
                    //ShowCaption = true;
                    //StyleExpr = 'Bold';
                    //Style = Bold;

                }

            }//cierre group Auditoría
        }
    }//cierre layout
    actions
    {
        addafter("Vendor")
        {
            action(OpenPageDatosEntrega)
            {
                ApplicationArea = Suite;
                Caption = 'Datos de entrega';
                ToolTip = 'Ver o editar los datos de entrega';
                Image = ShipmentLines; //NewTransferOrder;
                RunObject = Page Page_Datos_Entrega;
                RunPageLink = NoPedido = field("No."),
                            NoProveedor = field("Buy-from Vendor No.");
            }
        }//cierre addlast Order
    }//cierre actions

    //Obtener el nombre del usuario que creó el registro
    trigger OnAfterGetRecord()
    begin
        Clear(UserRec);
        if not UserRec.Get(Rec.SystemCreatedBy) then;
    end;

    var
        UserRec: Record User;

    /*trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if (CloseAction = Action::OK) and not Rec.Aprobado then
            Error('No se puede registrar el pedido de compra porque no está aprobado.');
        exit(true);
    end;*/
}
