with
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;
use
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;

procedure sapoPulador is
    tubo : Integer;
    pulo : Integer;
    altura : Integer;
    Numtubos : Integer;
    amortecedor : String(1..1000) := (others => ' ');
    Sep : String := " ";
    last : Natural;
    splitId : Integer;

    procedure Split(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Tmp : String(1..Source'Last);
    begin
        if Pos = Source'Last then Move(Source, Tmp);
        else Move(Source(Source'First .. Pos-1), Tmp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;
        Value := Integer'Value(Tmp);
    end Split;
begin
    Get_Line(Item => amortecedor, Last => last);
    splitId := Index(Source => amortecedor, Pattern => Sep, From => 1);
    Split(Source => amortecedor, Pos => splitId, Value => altura, Remainder => amortecedor);
    Split(Source => amortecedor, Pos => amortecedor'Last, Value => Numtubos, Remainder => amortecedor);
    Get_Line(Item => amortecedor, Last => last);
    for I in 1 .. Numtubos loop
        splitId := Index(Source => amortecedor, Pattern => Sep, From => 1);
        Split(Source => amortecedor, Pos => splitId, Value => pulo, Remainder => amortecedor);
        if I /= 1 and abs(pulo - tubo) > altura then
            Put_Line("Voce perdeu!");
            exit;
        end if;
        tubo := pulo;
        if I = Numtubos then
            Put_Line("Parabens, Voce ganhou!");
        end if;
    end loop;
end sapoPulador;