unit uPreferences;

{$I cef.inc}

interface

uses
  {$IFDEF DELPHI16_UP}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls;
  {$ELSE}
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Spin, ExtCtrls;
  {$ENDIF}

type
  TPreferencesFrm = class(TForm)
    GroupBox1: TGroupBox;
    ProxyTypeCbx: TComboBox;
    ProxyTypeLbl: TLabel;
    ProxyServerLbl: TLabel;
    ProxyServerEdt: TEdit;
    ProxyPortLbl: TLabel;
    ProxyPortEdt: TEdit;
    ProxyUsernameLbl: TLabel;
    ProxyUsernameEdt: TEdit;
    ProxyPasswordLbl: TLabel;
    ProxyPasswordEdt: TEdit;
    ProxyScriptURLEdt: TEdit;
    ProxyScriptURLLbl: TLabel;
    ProxyByPassListEdt: TEdit;
    ProxyByPassListLbl: TLabel;
    GroupBox2: TGroupBox;
    HeaderNameEdt: TEdit;
    HeaderNameLbl: TLabel;
    HeaderValueEdt: TEdit;
    HeaderValueLbl: TLabel;
    ProxySchemeCb: TComboBox;
    MaxConnectionsPerProxyLbl: TLabel;
    MaxConnectionsPerProxyEdt: TSpinEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    AuthenticationUsernameEdt: TEdit;
    AuthenticationPasswordEdt: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreferencesFrm: TPreferencesFrm;

implementation

uses
  System.IOUtils,
  IniFiles;

{$R *.dfm}

procedure TPreferencesFrm.Button1Click(Sender: TObject);
begin
  var LIni := TIniFile.Create(TPath.Combine(TDirectory.GetCurrentDirectory, 'browser.ini'));
  try
    for var I := 0 to Pred(ComponentCount) do
    begin
      if Components[I] is TEdit then
      begin
        LIni.WriteString('Preferences', Components[I].Name, (Components[I] as TEdit).Text);
      end;
    end;
  finally
    LIni.Free;
  end;
end;

end.
