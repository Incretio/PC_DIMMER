library kwllighting;

{ Wichtiger Hinweis zur DLL-Speicherverwaltung: ShareMem muss sich in der
  ersten Unit der unit-Klausel der Bibliothek und des Projekts befinden (Projekt-
  Quelltext anzeigen), falls die DLL Prozeduren oder Funktionen exportiert, die
  Strings als Parameter oder Funktionsergebnisse �bergeben. Das gilt f�r alle
  Strings, die von oder an die DLL �bergeben werden -- sogar f�r diejenigen, die
  sich in Records und Klassen befinden. Sharemem ist die Schnittstellen-Unit zur
  Verwaltungs-DLL f�r gemeinsame Speicherzugriffe, BORLNDMM.DLL.
  Um die Verwendung von BORLNDMM.DLL zu vermeiden, k�nnen Sie String-
  Informationen als PChar- oder ShortString-Parameter �bergeben. }


uses
  Forms,
  Dialogs,
  SysUtils,
  Classes,
  Windows,
  configfrm in 'configfrm.pas' {Config},
  aboutfrm in 'aboutfrm.pas' {About},
  messagesystem in '..\..\..\messagesystem.pas',
//  KWL-Lighting_Dmx512UsbCom_TLB in '..\..\..\..\..\..\Programme\Borland\Delphi7\Imports\KWL-Lighting_Dmx512UsbCom_TLB.pas';
  KWLLighting_Dmx512UsbCom_TLB in 'KWLLighting_Dmx512UsbCom_TLB.pas';

{$R *.res}

procedure DLLCreate(CallbackSetDLLValues,CallbackSetDLLValueEvent,CallbackSetDLLNames,CallbackGetDLLValue,CallbackSendMessage:Pointer);stdcall;
begin
  config:=TConfig.Create(Application);
  @Config.RefreshDLLValues:=CallbackSetDLLValues;
  @Config.RefreshDLLEvent:=CallbackSetDLLValueEvent;
end;

procedure DLLStart;stdcall;
begin
  config.startup;
end;

function DLLDestroy:boolean;stdcall;
begin
  try
	  config.shutdown:=true;
    Config.DMXInterface.Term;
	  @config.RefreshDLLValues:=nil;
	  @config.RefreshDLLEvent:=nil;
	  Config.release;
  except
  end;
  Result:=True;
end;

function DLLIdentify:PChar;stdcall;
begin
  Result:=PChar('Output');
end;

function DLLGetName:PChar;stdcall;
begin
  Result := PChar('KWL Lighting DMX512 USB');
end;

function DLLGetVersion:PChar;stdcall;
begin
  Result := PChar('v1.0');
end;

procedure DLLConfigure;stdcall;
begin
  Config.DMXInterface.Configure;
//  Config.ShowModal;
end;

procedure DLLAbout;stdcall;
begin
  about:=tabout.create(nil);
  about.showmodal;
  about.release;
end;

procedure DLLSendData(address, startvalue, endvalue, fadetime:integer;name:PChar);stdcall;
begin
end;

function DLLIsSending:boolean;stdcall;
begin
	result:=config.issending;
  config.issending:=false;
end;

procedure DLLSendMessage(MSG:Byte; Data1, Data2:Variant);stdcall;
begin
  case MSG of
    MSG_ACTUALCHANNELVALUE:
    begin
      // Data1=Kanal
      // Data2=Wert
      Config.DMXInterface.SetChannel(Integer(Data1), Integer(Data2));
    end;
  end;
end;

exports
  DLLCreate,
  DLLStart,
  DLLDestroy,
  DLLIdentify,
  DLLGetVersion,
  DLLGetName,
  DLLAbout,
  DLLConfigure,
  DLLSendData,
  DLLIsSending,
  DLLSendMessage;

begin
end.
