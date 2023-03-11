unit Gb_param;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes;


     //--------------------------------------: The Constant Test Data
     const
              strD1 = '#DA09,03,01,8.000,-0.03';
              strD2 = '#DA09,03,02,8.000,-0.03';
              strD3 = '#DA09,03,03,8.000,-0.03';
              str2 = 'JFF00';
              str3 = 'O0000';

              strSS = 'Application';

var
    Origins : TPoint;
    XCount,YC,XExist,XNew : integer;        // Variable For Test Sample Graph

    flag_draw  : boolean;
    flag_draw2 : boolean;
    X_count    : integer;
    Y_count    : integer;
    cnt        : integer;


    //---------------------------------------: Commond
     pX,pY : real;

     //--------------------------------------: For Config .csv File
     Date_cur  : string;
     Date_ref  : string;

     flag_SetDat    : boolean;
     add_DataPacket : integer;
     DataPacket  : array[0..1000]  of string;
     CombineData : array[0..1000] of string;
     AvData      : array[0..50]   of real;





implementation











end.
