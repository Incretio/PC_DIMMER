unit tippofthedayfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvGradient, JvExControls, JvAnimatedImage, JvGIFCtrl,
  ExtCtrls, gnugettext;

type
  Ttippoftheday = class(TForm)
    Panel1: TPanel;
    JvGIFAnimator1: TJvGIFAnimator;
    JvGradient2: TJvGradient;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Memo1: TMemo;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    Label3: TLabel;
    Button2: TButton;
    Button4: TButton;
    Shape4: TShape;
    Shape1: TShape;
    procedure CheckBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CreateParams(var Params:TCreateParams);override;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    tipptext: array of String;
    aktuellertipp:integer;
  end;

var
  tippoftheday: Ttippoftheday;

implementation

uses PCDIMMER;

{$R *.dfm}

procedure Ttippoftheday.CheckBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  mainform.showtipofday:=Checkbox1.checked;
end;

procedure Ttippoftheday.FormShow(Sender: TObject);
begin
  Checkbox1.checked:=mainform.showtipofday;

  Randomize;
  aktuellertipp:=random(length(tipptext));
  label3.Caption:=inttostr(aktuellertipp+1)+'/'+inttostr(length(tipptext));
  memo1.Text:=tipptext[aktuellertipp];
end;

procedure Ttippoftheday.FormCreate(Sender: TObject);
begin
  TranslateComponent(self);
  setlength(tipptext,0);
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('�ber die Projektverwaltung (STRG+B) k�nnen Sie Dateien einfach mit der Maus in das Projekt einbinden.')+#13#10#13#10+_('Ziehen Sie dazu einfach eine Datei auf das Fenster und die Datei wird automatisch mit in die Projektdatei gespeichert.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('�ber die Kombinationsszenen k�nnen auf leichte Weise komplexe Abl�ufe zeitgleich gestartet werden.')+#13#10#13#10+_('�ber einen Befehl kann dann die Kombination schnell wieder beendet werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Mit dem Audioeffektplayer k�nnen im Aufnahmemodus �nderungen im Kontrollpanel, sowie vielen weiteren Plugins und Optionen direkt in die jeweilige Spur aufgezeichnet werden.')+#13#10#13#10+_('Dies erleichtert die Licht-Synchronisation zur Musik erheblich.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Im Audioeffektplayer kann �ber die Repeat-Funktion ein Endlosablauf erzeugt werden, welcher mit nur einem Klick, bzw. �ber einen Befehl aktiviert und deaktiviert werden kann.')+#13#10#13#10+_('Diese Funktion ist z.B. bei Live-Anwendungen sehr Hilfreich, wenn Einm�rsche oder andere Fortlaufende Dinge beleuchtet werden m�ssen.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('�ber die PC_DIMMER-Pluginschnittstelle k�nnen auf einfache Weise grundlegende Programmfunktionen gesteuert, sowie Kanal-, MIDI- und Steuerfunktionen verwendet werden.')+#13#10#13#10+_('Die Funktionsvielfalt des PC_DIMMERs kann so weiter gesteigert werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Das Kontrollpanel kann mit �ber 500 Schaltfl�chen jegliche Funktionen, Szenen und Befehle des PC_DIMMERs ausf�hren.')+#13#10#13#10+_('Nutzen Sie Farben und Grafiken, um die gew�nschten Optionen schnell zu finden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('MIDI-Keyboards k�nnen sehr leicht mit Szenen und Funktionen belegt werden.')+#13#10#13#10+_('Nutzen Sie daf�r das MIDI-Setup unter Einstellungen->MIDI Einstellungen...')+#13#10#13#10+_('MIDI Ereignisse k�nnen zudem auch in den einzelnen Plugins verarbeitet werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('�ber die Softpatch-Funktion k�nnen s�mtliche Kan�le des PC_DIMMERs mit einzelnen Spezialfunktionen versehen werden.')+#13#10#13#10+_('Verwenden Sie die Funktion "DataIn" unter Hauptmen�->Einstellungen->DataIn Einstellungen, um die Entsprechenden Optionen einzusehen.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Mit dem Ger�teeditor k�nnen eigene Oberfl�chen f�r Ger�teeinstellungen erstellt und bearbeitet werden, welche �ber die grafische B�hnenansicht aufgerufen werden k�nnen.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Jedem Ger�tekanal kann eine eigene Dimmkurve und ein eigener Dimmverlauf zugeordnet werden. Somit k�nnen zum Beispiel LED-Lampen dem normalen Gl�hlampenverhalten angen�hert werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Mit Automatikszenen k�nnen Ger�te automatisch auf eine Farbe gesetzt werden. Dies funktioniert auch bei Ger�ten ohne eigene RGB-Mischung (z.B. Ger�ten mit Farbrad)');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Jeder Kanal kann �ber die DataIn-Funktion mit Spezialfunktionen belegt werden. So kann z.B. Kanal 7 als Submaster f�r alle Dimmerkan�le fungieren, oder Kanal 20 als Fader f�r alle "Rot"-Kan�le einer Ger�tegruppe dienen.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Effekte bieten eine gute M�glichkeit, komplexe Abl�ufe zu erstellen. Durch Verschachtelung von Effekten kann ein abwechselndes Programm kreiert werden. Mit Befehlen kann zudem der Ablauf leicht beeinflusst werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Bewegungsszenen k�nnen nicht nur f�r Scanner verwendet, sondern auch f�r statische Lichter benutzt werden. Die Offsetfunktion erlaubt ein Schnelles erstellen interessanter Lauflichter.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Der Videoscreen kann in Verbindung mit dem Audioeffektplayer und entsprechenden Befehlen eine gro�e Erleichterung beim Programmieren einer Lichtshow auf bereits vorhandene Choreografien sein.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Mit gruppierten Ger�ten ist das Verwenden von Fanning m�glich. Fanning ist ein zeitlich versetztes Ausf�hren von gleichen Funktionen. So k�nnen z.B. 8 Ger�te gruppiert, ein Ger�t als ')+_('Master ausgew�hlt und eine Delay-Zeit definiert werden. Spricht man nun die Gruppe aus den einzelnen Teilen des PC_DIMMERs an '+'(z.B. Submaster) werden alle 8 Ger�te zeitlich versetzt die gleiche Aktion ausf�hren. Dynamisches Licht ist somit sehr einfach zu erstellen');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Das Faderpanel erm�glicht auch einfache Gruppierungen. Halten Sie entweder STRG-, Shift-, oder ALT-Taste gedr�ckt, w�hrend Sie auf einen Kanalfader klicken. Es k�nnen bis zu 3 Gruppen gebildet werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Der PC_DIMMER l�sst sich auch Fernsteuern. Das Programm PC_DIMMER_CMD.EXE aus dem Installationsordner erm�glich das Senden von Kommandos per Netzwerk. Es k�nnen Kanalwerte ge�ndert und Szenen gestartet/gestoppt werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Lauflichter k�nnen mit dem Effektsequenzer und dem dort aufrufbaren Lauflichtassistenten sehr einfach erstellt werden. Einige Lauflichter sind bereits voreingestellt und k�nnen auf beliebige Ger�te angewendet werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Selektieren Sie Ger�te in der grafischen B�hnenansicht mit gedr�ckter Shift-Taste und ziehen sie mit Hilfe der Maus einen Rahmen. Mit Hilfe des Gruppeneditors k�nnen so sehr schnell und einfach Ger�tegruppen erstellt werden.');
  setlength(tipptext,length(tipptext)+1);
  tipptext[length(tipptext)-1]:=_('Sie k�nnen die Ansicht des PC_DIMMERs zwischen einer Vollbildansicht und einer Darstellung am oberen Bildschirmrand umstellen. Verwenden Sie den Button "Minimieren ein/aus" aus dem Tab "Home" oder "Sonstiges"');
end;

procedure Ttippoftheday.Button3Click(Sender: TObject);
begin
  if aktuellertipp<length(tipptext)-1 then
    aktuellertipp:=aktuellertipp+1
  else
    aktuellertipp:=0;

  label3.Caption:=inttostr(aktuellertipp+1)+'/'+inttostr(length(tipptext));
  memo1.Text:=tipptext[aktuellertipp];
end;

procedure Ttippoftheday.Button2Click(Sender: TObject);
begin
  Randomize;
  aktuellertipp:=random(length(tipptext));
  label3.Caption:=inttostr(aktuellertipp+1)+'/'+inttostr(length(tipptext));
  memo1.Text:=tipptext[aktuellertipp];
end;

procedure Ttippoftheday.Button4Click(Sender: TObject);
begin
  if aktuellertipp>0 then
    aktuellertipp:=aktuellertipp-1
  else
    aktuellertipp:=length(tipptext)-1;

  label3.Caption:=inttostr(aktuellertipp+1)+'/'+inttostr(length(tipptext));
  memo1.Text:=tipptext[aktuellertipp];
end;

procedure Ttippoftheday.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_escape then
    modalresult:=mrOK;
end;

procedure Ttippoftheday.CreateParams(var Params:TCreateParams);
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

procedure Ttippoftheday.Button1Click(Sender: TObject);
begin
  close;
end;

end.
