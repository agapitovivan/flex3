unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Buttons;

type
s30=string[30];
p=record
  atracsion:string[30];
  stoimost:integer;
  vosrast:integer;
  koli4estvo:integer;
  end;

  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Edit2: TEdit;
    Button4: TButton;
    Edit4: TEdit;
    BitBtn1: TBitBtn;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);







  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ft:TextFile;

    fz:file of p;
j :Integer;


implementation

{$R *.dfm}


procedure TForm1.BitBtn1Click(Sender: TObject);

var i, k: integer;
begin
 button2.Visible:=true;
button8.Visible:=true;
button7.Visible:=true;
bitbtn1.Visible:=true;
i:=0;
repeat
if StringGrid1.Cells[0,i]=edit4.Text then
begin
k:=i;
while k<StringGrid1.RowCount-1 do
begin
StringGrid1.Cells[0,k]:= StringGrid1.Cells[0,k+1];
StringGrid1.Cells[1,k]:=StringGrid1.Cells[1,k+1];
StringGrid1.Cells[2,k]:=StringGrid1.Cells[2,k+1];
StringGrid1.Cells[3,k]:=StringGrid1.Cells[3,k+1];
k:=k+1;
end;
StringGrid1.RowCount:=StringGrid1.RowCount-1;
end;
i:=i+1;
until StringGrid1.RowCount-1<i;
end;





procedure TForm1.Button1Click(Sender: TObject);
var
    i:integer;
    s:string;
    z:p;
    f:file of p;
begin
Edit4.Visible:=true;
 button2.Visible:=true;
button8.Visible:=true;
button7.Visible:=true;
bitbtn1.Visible:=true;
s:=edit1.Text;
system.Assign(f,s);
Rewrite(f);
for i:=1 to StringGrid1.RowCount do
if StringGrid1.Cells[0,i]<>'' then
 begin
z.atracsion:=StringGrid1.Cells[0,i];
 z.stoimost:=StrToint(StringGrid1.Cells[1,i]);
 z.vosrast:=strtoint(StringGrid1.Cells[2,i]);
 Z.koli4estvo:=strToint(StringGrid1.Cells[3,i]);
write(f,z);
ShowMessage('Изменения сохранены');
end;
System.Close(f);



end;

procedure TForm1.Button2Click(Sender: TObject);


var i,a,w,sum:integer;

begin
Edit2.Visible := True;
sum:=0;

for i:=1 to stringGrid1.RowCount-1 do
begin
a:= strtoint(StringGrid1.cells[1,i]);
sum:=sum+a;
end;
  Edit2.Text:=inttostr(sum);
end;
















procedure TForm1.Button4Click(Sender: TObject);
var i,j:integer;
F:textFile;
fname:string;

begin

with StringGrid1 do
  for i:=1 to RowCount-1 do
    Rows[i].Clear;
Edit4.Visible:=true;
 button2.Visible:=true;
button8.Visible:=true;
button7.Visible:=true;
bitbtn1.Visible:=true;
fname:=Edit1.Text;
AssignFile(f,fname);
rewrite(F);
CloseFile(f);
if IOResult=0 then messageDlg('Файл успешно создан',mtInformation,[mbOk,mbCancel],0) else
MessageDlg('Ошибка',mtError,[mbok],0);

end;



procedure TForm1.Button5Click(Sender: TObject);
var

    i:integer;
    z:p;
    f:file of p;
begin
Edit4.Visible:=true;
 button2.Visible:=true;
button8.Visible:=true;
button7.Visible:=true;
bitbtn1.Visible:=true;
i:=1;
system.Assign(f,Edit1.Text);
Reset(f);
while not eof(f) do
begin
read(f,z);
StringGrid1.Cells[0,i]:=(z.atracsion);
StringGrid1.Cells[1,i]:= inttostr(z.stoimost);
StringGrid1.Cells[2,i]:=inttostr(z.vosrast);
StringGrid1.Cells[3,i]:=inttostr(z. koli4estvo);
StringGrid1.RowCount:=i+1;
i:=i+1;
end;
system.Close(f);





end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Form1.Close;
end;

procedure TForm1.Button7Click(Sender: TObject);

var i:integer;
begin
Edit4.Visible:=true;
 button2.Visible:=true;
button8.Visible:=true;
button7.Visible:=true;
bitbtn1.Visible:=true;
stringgrid1.RowCount:=stringgrid1.RowCount+1;
for i:=0 to 4 do
stringgrid1.cells[i,stringgrid1.RowCount-1]:=' ';
end;


procedure TForm1.Button8Click(Sender: TObject);


var
Max: integer;
MaxI,MaxJ: Integer;
begin

  Max:= strtoint(Stringgrid1.Cells[1,1]);//присваивание  значения 1 элемента

    for j:=1 to stringgrid1.RowCount do //цикл по строкам
      if strtoint(stringgrid1.Cells[1,j])>=Max //сравниваем элемент с текущим максимальным
        then
          begin
          Max:=strtoint(stringgrid1.Cells[1,j]);//значение максимального элемента

          MaxJ:=j; //строка
         label2.Caption:='Цена самого прибыльного атракциона= '+inttostr(Max);
          end;

end;


procedure TForm1.FormCreate(Sender: TObject);

begin
StringGrid1.Cells[0,0]:='Название атракциона';
StringGrid1.Cells[1,0]:='Стоимость билета';
StringGrid1.Cells[2,0]:='Возрастные границы';
StringGrid1.Cells[3,0]:='Количество мест';

end;



end.
