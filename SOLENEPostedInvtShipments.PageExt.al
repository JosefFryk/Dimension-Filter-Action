pageextension 84033 SOL_ENE_PostedInvtShipments extends "Posted Invt. Shipments"
{
    layout
    {
        addbefore("Shortcut Dimension 1 Code")
        {
            field("SOL ENE Invt Doc Consum Type"; Rec."SOL ENE Invt Doc Consum Type")
            {
                ApplicationArea = Basic, Suite;
            }
            field("SOL ENE Job No."; Rec."SOL ENE Job No.")
            {
                ApplicationArea = Basic, Suite;
            }
            field("SOL ENE Job Task No."; Rec."SOL ENE Job Task No.")
            {
                ApplicationArea = Basic, Suite;
            }
        }
        modify("Shortcut Dimension 1 Code")
        {
            Visible = true;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field(SOLENEDIMTEST3; Rec."SOL ENE Shortcut Dimension 3")
            {
                ApplicationArea = Basic, Suite;
                CaptionClass = '1,2,3';
                Visible = DimVisible3;
            }
            field(SOLENEDIMTEST4; Rec."SOL ENE Shortcut Dimension 4")
            {
                ApplicationArea = Basic, Suite;
                CaptionClass = '1,2,4';
                Visible = DimVisible4;
            }
            field(SOLENEDIMTEST5; Rec."SOL ENE Shortcut Dimension 5")
            {
                ApplicationArea = Basic, Suite;
                CaptionClass = '1,2,5';
                Visible = DimVisible5;
            }
            field(SOLENEDIMTEST6; Rec."SOL ENE Shortcut Dimension 6")
            {
                ApplicationArea = Basic, Suite;
                CaptionClass = '1,2,6';
                Visible = DimVisible6;
            }
            field(SOLENEDIMTEST7; Rec."SOL ENE Shortcut Dimension 7")
            {
                ApplicationArea = Basic, Suite;
                CaptionClass = '1,2,7';
                Visible = DimVisible7;
            }
            field(SOLENEDIMTEST8; Rec."SOL ENE Shortcut Dimension 8")
            {
                ApplicationArea = Basic, Suite;
                CaptionClass = '1,2,8';
                Visible = DimVisible8;
            }
            field("SOL ENE SystemCreatedBy"; Rec."SOL ENE User Id")
            {
                ApplicationArea = All;
            }
            field("SOL ENE SystemCreatedAt"; Rec.SystemCreatedAt)
            {
                ApplicationArea = All;
                Caption = 'Create Date';
                Editable = false;
            }
        }
    }
    actions
    {
        addafter("&Print")
        {
            action(SOLENESetDimensionFilter)
            {
                ApplicationArea = Dimensions;
                Caption = 'Set Dimension Filter';
                Ellipsis = true;
                Image = "Filter";
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Limit the entries according to the dimension filters that you specify.NOTE: If you use a high number of dimension combinations, this function may not work and can result in a message that the SQL server only supports a maximum of 2100 parameters.';

                trigger OnAction()
                begin
                    Rec.SetFilter("Dimension Set ID", DimensionSetIDFilter.LookupFilter());
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.SOLENEShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnOpenPage()
    begin
        Rec.SOLENESetDimensionsVisibility(DimVisible1, DimVisible2, DimVisible3, DimVisible4, DimVisible5, DimVisible6, DimVisible7, DimVisible8);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
        DimVisible1: Boolean;
        DimVisible2: Boolean;
        DimVisible3: Boolean;
        DimVisible4: Boolean;
        DimVisible5: Boolean;
        DimVisible6: Boolean;
        DimVisible7: Boolean;
        DimVisible8: Boolean;
        DimensionSetIDFilter: Page "Dimension Set ID Filter";
        test: page 20;

}
