unit scenenotfoundfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, JvExControls, JvGradient, StdCtrls, gnugettext;

type
  Tscenenotfoundform = class(TForm)
    Label6: TLabel;
    guidlbl: TLabel;
    Panel1: TPanel;
    JvGradient1: TJvGradient;
    Image2: TImage;
    Label34: TLabel;
    Label35: TLabel;
    Shape2: TShape;
    Shape1: TShape;
    OKBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CreateParams(var Params:TCreateParams);override;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  scenenotfoundform: Tscenenotfoundform;

implementation

uses PCDIMMER;

{$R *.dfm}

procedure Tscenenotfoundform.FormCreate(Sender: TObject);
begin
  TranslateComponent(self);
end;

procedure Tscenenotfoundform.OKBtnClick(Sender: TObject);
begin
  close;
end;

procedure Tscenenotfoundform.CreateParams(var Params:TCreateParams);
begin
  inherited CreateParams(Params);

  if mainform.ShowButtonInTaskbar then
  begin
    Params.ExStyle:=WS_EX_APPWINDOW; // Params.ExStyle sorgt daf�r, dass das Form einen eigenen Taskbareintrag erh�lt
    if mainform.ShowIconInTaskSwitcher then
    begin
      Params.WndParent:=GetDesktopWindow;
      self.ParentWindow := GetDesktopWindow;
    end;
  end;
end;

end.
