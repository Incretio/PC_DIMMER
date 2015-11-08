unit opensourcefrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExControls, JvXPCore, JvXPButtons, dxGDIPlusClasses,
  ExtCtrls, JvGradient, gnugettext;

type
  Topensourceform = class(TForm)
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    Image1: TImage;
    Label34: TLabel;
    Label35: TLabel;
    spendenbtn: TJvXPButton;
    Image3: TImage;
    Memo1: TMemo;
    nichtspendenbtn: TJvXPButton;
    startbtn: TJvXPButton;
    procedure spendenbtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nichtspendenbtnClick(Sender: TObject);
    procedure startbtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  opensourceform: Topensourceform;

implementation

{$R *.dfm}

procedure Topensourceform.spendenbtnClick(Sender: TObject);
begin
  memo1.Text:=_('Paypal-Konto: christian@noeding-online.de'+#13#10#13#10+
    'Bank-Konto:'+#13#10+
    'Christian N�ding'+#13#10+
    'ING DiBa (BIC: INGDDEFFXXX)'+#13#10+
    'IBAN: DE46500105175414867906'+#13#10#13#10+
    'Vielen Dank f�r Ihre Unterst�tzung!');
  spendenbtn.Visible:=false;
  nichtspendenbtn.Visible:=false;
  startbtn.Visible:=true;
end;

procedure Topensourceform.FormShow(Sender: TObject);
begin
  memo1.text:=_('Hallo,'+#10#13#10#13+'das Lichttechnik-Programm "PC_DIMMER", welches Sie soeben gestartet haben, wird kostenlos zur Verf�gung gestellt.'+' Zudem kann der Quelltext kostenlos im Internet heruntergeladen werden. Es wird somit kein Profit mit dieser Software angestrebt. Dennoch fallen f�r den Betrieb der Website, die Entwicklungstools und die Entwicklung selbst entsprechende Kosten an.'+#13#10#13#10+
    'Nat�rlich steht es jedem frei, den PC_DIMMER auch bei Veranstaltungen einzusetzen, bei denen Eintrittsgelder genommen werden. Mit diesem Text m�chte ich auf die M�glichkeit einer Spende hinweisen:'+#13#10#13#10+
    'Sollten Ihnen die umfangreichen Funktionen des Programms gefallen und Sie Ihre Lichtshows damit auf profit-orientierten Veranstaltungen nutzen, so bitte ich um eine Spende.'+#13#10#13#10+
    'Herzlichen Dank, Christian N�ding');
end;

procedure Topensourceform.nichtspendenbtnClick(Sender: TObject);
begin
  opensourceform.ModalResult:=mrCancel;
end;

procedure Topensourceform.startbtnClick(Sender: TObject);
begin
  opensourceform.ModalResult:=mrOK;
end;

procedure Topensourceform.FormCreate(Sender: TObject);
begin
  TranslateComponent(self);
end;

end.
