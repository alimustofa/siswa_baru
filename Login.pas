unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ExtCtrls;

type
  Tf_login = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    tb_username: TEdit;
    tb_password: TEdit;
    ADOConnection1: TADOConnection;
    q_temp: TADOQuery;
    Label3: TLabel;
    Panel2: TPanel;
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_login: Tf_login;

implementation

uses Dashboard;

{$R *.dfm}

procedure Tf_login.Panel2Click(Sender: TObject);
begin
  if (tb_username.Text = '') then
    begin
      MessageDlg('Username atau password kosong', mtInformation, [mbOK], 0);
    end
  else
    begin
      q_temp.Close;
      q_temp.SQL.Clear;
      q_temp.SQL.Add('SELECT * FROM admin WHERE username='''+tb_username.Text+''' AND password='''+tb_password.Text+'''');
      q_temp.Open;

      if (q_temp.RecordCount <> 0) then
        begin
          f_dashboard.ShowModal();
        end
      else
        begin
          MessageDlg('Admin tidak ditemukan', mtInformation, [mbOK], 0);
        end
    end
end;

end.
