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
  uSimpleTextViewer in 'src\uSimpleTextViewer.pas' {SimpleTextViewerFrm},
  about in '..\BookmarksManager4Delphi\units\about.pas' {frmAbout},
  addcat in '..\BookmarksManager4Delphi\units\addcat.pas' {frmCatAdd},
  addlink in '..\BookmarksManager4Delphi\units\addlink.pas' {frmAddLink},
  browsercfg in '..\BookmarksManager4Delphi\units\browsercfg.pas' {frmBrowsers},
  filebag in '..\BookmarksManager4Delphi\units\filebag.pas',
  htmlprop in '..\BookmarksManager4Delphi\units\htmlprop.pas' {frmHtml},
  linkmove in '..\BookmarksManager4Delphi\units\linkmove.pas' {frmMoveLink},
  linkshare in '..\BookmarksManager4Delphi\units\linkshare.pas' {frmShareLink},
  listimages in '..\BookmarksManager4Delphi\units\listimages.pas' {frmTemp},
  main in '..\BookmarksManager4Delphi\units\main.pas' {frmLinks},
  tools in '..\BookmarksManager4Delphi\units\tools.pas';

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
