program MiniBrowser;

{$I cef.inc}

uses
  Winapi.Windows,
  Vcl.Forms,
  uCEFApplication,
  uDirectorySelector in 'src\uDirectorySelector.pas' {DirectorySelectorFrm},
  uFindFrm in 'src\uFindFrm.pas' {FindFrm},
  uMiniBrowser in 'src\uMiniBrowser.pas' {FrmMiniBrowser},
  uPreferences in 'src\uPreferences.pas' {PreferencesFrm},
  uSelectCertForm in 'src\uSelectCertForm.pas' {SelectCertForm},
  uSimpleTextViewer in 'src\uSimpleTextViewer.pas' {SimpleTextViewerFrm};

{$R *.res}

{$SetPEFlags IMAGE_FILE_LARGE_ADDRESS_AWARE}

begin
  CreateGlobalCEFApp;

  if GlobalCEFApp.StartMainProcess then
    begin
      Application.Initialize;
      {$IFDEF DELPHI11_UP}
      Application.MainFormOnTaskbar := True;
      {$ENDIF}
      Application.CreateForm(TFrmMiniBrowser, FrmMiniBrowser);
  Application.CreateForm(TFindFrm, FindFrm);
  Application.CreateForm(TPreferencesFrm, PreferencesFrm);
  Application.CreateForm(TSimpleTextViewerFrm, SimpleTextViewerFrm);
  Application.Run;
    end;

  DestroyGlobalCEFApp;
end.
