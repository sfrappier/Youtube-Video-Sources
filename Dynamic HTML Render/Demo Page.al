page 50100 "Demo Page"
{
    Caption = 'Demo Page';
    layout
    {
        area(Content)
        {
            usercontrol(html; HTML)
            {
                ApplicationArea = all;
                trigger ControlReady()
                begin
                    //CurrPage.html.Render('<a href="https://www.hougaard.com">A great blog!</a>');
                    CurrPage.html.Render(CreateTable(10, 8));
                end;
            }
        }
    }
    procedure CreateTable(rows: Integer; Columns: Integer): Text
    var
        GL: Record "G/L Account";
        out: Text;
        r, c : Integer;
    begin
        GL.FindSet();
        out := '<table border="1" style="width: 100%;">';
        for r := 1 to rows do begin
            out += '<tr>';
            for c := 1 to Columns do begin
                out += '<td>' + GL.Name + '</td>';
                GL.Next();
            end;
            out += '</tr>';
        end;
        out += '</table>';
        exit(out);
    end;
}