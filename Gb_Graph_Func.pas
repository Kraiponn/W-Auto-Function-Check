unit Gb_Graph_Func;

interface
 uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, TeeProcs, TeEngine, Chart,
  Grids, Series, Menus, jpeg, ButtonGroup, CategoryButtons, StrUtils;

  //-------------------------------------: Prototype
   procedure Initial_Graph(Yp_min : real; Yp_max : real);
   procedure Prot_MinMaxSpec(data : real; xAxis : integer; AvPoint : boolean);

   function Prot_GPoint(dat : real; xAxis : integer) : integer;



implementation
 uses Nikon_Model,Gb_param,Gb_func;





//------------------------------------: Initial Graph
 procedure Initial_Graph(Yp_min : real; Yp_max : real);
 begin
        with frmMain do
        begin
               pX := 0;
               pY := -0.1;
               flag_draw := true;

        end;
 end;




//----------------------------------:  Prot Spec Min-Max
procedure Prot_MinMaxSpec(data : real; xAxis : integer; AvPoint : boolean);
var
    py_ref : real;
begin
       with frmMain do
       begin

              Chart1.Series[1].AddXY(0,StrToFloatDef(edtAv_min.Text,0),'');
              Chart1.Series[1].AddXY(xAxis,StrToFloatDef(edtAv_min.Text,0),'');
              Chart1.Series[2].AddXY(0,StrToFloatDef(edtAv_max.Text,0),'');
              Chart1.Series[2].AddXY(xAxis,StrToFloatDef(edtAv_max.Text,0),'');


       end;
end;





//----------------------------------: Prot Graph
function Prot_GPoint(dat : real; xAxis : integer) : integer;
begin
       with frmMain do
       begin
              px := pX+1;
              Chart1.Series[0].AddXY(xAxis,dat,'');
              Result := 0;
       end;
end;




end.
