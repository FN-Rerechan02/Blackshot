// V1.0
Program ProgramName;

{$APPTYPE CONSOLE}

uses
  Windows, SysUtils,
  Classes, Forms, IdHashMessageDigest ;

Const
FbossHashSEA     : String = 'FA856772CBADB14CAF4B17156AC81D43' ;
FbossHashEU      : String = 'AFD618ADA214B598A950874F0DDDBD66' ;
AllBodiesPath    : String = 'Data\Character\All\' ;
AdamBodiesPath   : String = 'Data\Character\Adam\' ;
CassieBodiesPath : String = 'Data\Character\Cassie\' ;
ForceModelBase   : String = 'Data\Character\' ;
KeiBodiesPath    : String = 'Data\Character\Kei\' ;
ViolaBodiesPath  : String = 'Data\Character\Viola\' ;
BIGHEAD          : String = '...Stub\BIGHEAD.nif' ;
Bypass           : String = 'msssrs.flt' ;
BSEU             : String = 'Data\_EU\Character' ;
BSSEA            : String = 'data\_SG\Character' ;

All_Bodies : Array [0..10] of String = (
           'A_C_K_body_vietnam_US.nif', 'A_C_K_body_vietnam_VT.nif',
           'Crimson_body.nif', 'Dragon_body_gold.nif',
           'Dragon_body_silver.nif', 'Fboss_body.nif',
           'Rudolph.nif', 'santa_body.nif',
           'santa_gm_body.nif', 'Vi_body_vietnam_US.nif',
           'Vi_body_vietnam_VT.nif' ) ;

Adam_Bodies : Array [0..3] of String = (
           'Ad_body1.nif', 'Ad_body2.nif',
           'Ad_body3.nif', 'Ad_body4.nif' ) ;

Cassie_Bodies : Array [0..3] of String = (
           'ca_body1.nif', 'ca_body2.nif',
           'ca_body3.nif', 'ca_body4.nif' ) ;

Kei_Bodies : Array [0..3] of String = (
           'ke_body1.nif', 'ke_body2.nif',
           'ke_body3.nif', 'ke_body4.nif' ) ;

Viola_Bodies : Array [0..3] of String = (
           'vi_body1.nif', 'vi_body2.nif',
           'vi_body3.nif', 'vi_body4.nif' ) ;

ForceModel_Bodies : Array [0..19] of String = (
           'wehrmacht.nif', 'usa_2war.nif',
           'adam_renew.nif', 'cassie_renew.nif',
           'chinese_spy.nif', 'cowgirl.nif',
           'gangsta.nif', 'isabelle.nif',
           'kei_renew.nif', 'new_viola.nif',
           'nina.nif', 'ninja.nif',
           'paratrooper.nif', 'police.nif',
           'mantis.nif', 'sniper_rayne.nif',
           'swat.nif', 'UDT.nif',
           'Usarmy.nif', 'viola_renew.nif' ) ;

ForceModel_Bodies_Path : Array [0..19] of String = (
           'forcemodel\2war_germany\', 'forcemodel\2war_usa\',
           'forcemodel\ADAM_RENEW\', 'forcemodel\CASSIE_RENEW\',
           'forcemodel\CHINESE_SPY\', 'forcemodel\Cowgirl\',
           'forcemodel\GANGSTA\', 'forcemodel\Isabelle\',
           'forcemodel\KEI_RENEW\', 'forcemodel\New_Viola\',
           'forcemodel\NINA\', 'forcemodel\NINJA\',
           'forcemodel\PARATROOPER\', 'forcemodel\POLICE\',
           'forcemodel\Sniper_Mantis\', 'forcemodel\Sniper_Rayne\',
           'forcemodel\SWAT\', 'forcemodel\UDT\',
           'forcemodel\USarmy\', 'forcemodel\VIOLA_RENEW\' ) ;

function GetMD5HashFromFile (FileN : string) : string;
var
   MD5Hash : TIdHashMessageDigest5;
   FileS : TFileStream;
 begin
 MD5Hash := TIdHashMessageDigest5.Create;
   FileS := TFileStream.Create(FileN, fmShareDenyWrite or fmOpenRead) ;
      try
        result := MD5Hash.AsHex(MD5Hash.hashValue(FileS)) ;
       finally
          FileS.Free;
            MD5Hash.Free;
      end;
end;

Function NewMD5BigHead (const BigHeadFile, CopyTo : String ;
var NewMD5Hash : string) : Bool ;
Const
  Max : WORD = $FFFF ;
Var
  AddSize : integer;
  FileS : TMemoryStream;
SL : TStringlist;
begin
Result := False ;
  Randomize;
    AddSize := Random(Max);
      FileS := TMemoryStream.Create;
        FileS.LoadFromFile(BigHeadFile);
        FileS.Size := FileS.Size + AddSize ;
        FileS.SaveToFile(CopyTo);
        If FileExists(CopyTo) Then
        begin
        NewMD5Hash := GetMD5HashFromFile(CopyTo) ;
        Result := True ;
        end;
end;

Procedure BypassName(Size: Cardinal ; Var Result : String) ;
Var
Value : String ;
begin
 Randomize;
  Value    := '0123456789';
   repeat
   Result := Result + Value[Random(Length(Value)) + 1];
 until( Length ( Result ) = Size);
end;

Function CopyF (Source, New : String ) : LongBool ;
begin
    Result := CopyFile (Pchar(Source), Pchar(New), False) ;
end;

Procedure Space ;
begin
   writeln ('');
end;

Var
i : Integer ;
pas, fullpath, source, sourcebypass, asibypass, BGNewMD5 : string ;
LogFile : TStringList ;
CheckBSSEA : Bool = False ;
begin
  BypassName(10,asibypass);
  LogFile := TStringList.Create ;
  fullpath := ExtractFilePath(Application.ExeName) ;
  source   := fullpath + 'Stub\BIGHEAD.nif' ;
  Space;
  writeln ('******************************************************************');
  writeln ('*** bengaludo Wizard setup - Blackshot SEA/Global BIGHEAD FREE ***');
  writeln ('******************************************************************');
  Space;
  writeln ('Checking folder...');

  If FileExists(fullpath+'System\blackshot_BE.exe') Then
  begin
  If FileExists(fullpath+'System\blackshot.exe') Then
  begin
  If FileExists(fullpath+'System\multiplay_sg.dll') Then
  begin
  CheckBSSEA := True ;
  LogFile.Add ('Client: BLACKSHOT SEA');
  writeln ('Client: BLACKSHOT SEA');
  end;
  If FileExists(fullpath+'System\multiplay_eu.dll') Then
  begin
  LogFile.Add ('Client: BLACKSHOT GLOBAL');
  writeln ('Client: BLACKSHOT GLOBAL');
  end;
  end;
  end
  else
  begin
  LogFile.Add('ERROR ::: Run this program in the game folder!') ;
  LogFile.SaveToFile(fullpath+'Result.txt');
  writeln ('ERROR ::: Run this program in the game folder!');
  readln;
  ExitProcess(0);
  end;

  Space;
  writeln ('Checking for BIGHEAD.nif...');
  If FileExists (fullpath+ 'Stub\BIGHEAD.nif') Then
  begin
  pas := 'Stub\BIGHEAD.nif' ;
  writeln ('The BIGHEAD.nif has been found! @' + pas + '') ;
  writeln ('BIGHEAD.nif Current MD5: @'+GetMD5HashFromFile(source));
  LogFile.Add('BIGHEAD.nif Current MD5: @'+GetMD5HashFromFile(source)) ;

  {Changing MD5...}

  NewMD5BigHead(source,fullpath+'Stub\BIGHEAD.nif', BGNewMD5) ;
  writeln ('BIGHEAD.nif new MD5    : @'+BGNewMD5) ;
  LogFile.Add('BIGHEAD.nif new MD5    : @'+BGNewMD5) ;

  Space;
  LogFile.Add('The BIGHEAD.nif has been found! @' + pas + '') ;
  LogFile.Add('');
  end
  else
  begin
  writeln ('Error!!!  Stub\BIGHEAD.nif was not found!') ;
  LogFile.Add('Error!!!  Stub\BIGHEAD.nif was not found!') ;
  LogFile.SaveToFile(fullpath+'Result.txt');
  readln;
  ExitProcess(0);
  end;
  Space;
  writeln ('Press ENTER to install, waiting...');
  readln;
  writeln (DateTimeToStr(Now)+' ::: Process started...');
  Space;

  LogFile.Add(DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + AllBodiesPath ) ;
  writeln (DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + AllBodiesPath );
  LogFile.Add('') ;
  Space;

  {All Bodies *****************************}

  For i := 0 to Length(All_Bodies) -1 do
  begin

  {Backup GM BOdy}
  If All_Bodies[i] = 'Fboss_body.nif' Then
  begin
  If ( ( GetMD5HashFromFile(fullpath + AllBodiesPath + 'Fboss_body.nif') =  FbossHashSEA)
  or
  ( GetMD5HashFromFile(fullpath + AllBodiesPath + 'Fboss_body.nif') =  FbossHashEU) ) Then
  begin
  If CopyF(fullpath + AllBodiesPath + 'Fboss_body.nif', fullpath + AllBodiesPath + 'Fboss.xor') Then
  begin
  LogFile.Add('...Fboss_body.nif' + '   ---> ' + '@' + 'Fboss.xor' + ' ::: OK');
  Writeln ('...Fboss_body.nif' + '   ---> ' + '@' + 'Fboss.xor' + ' ::: OK') ;
  end
  else
  begin
  LogFile.Add('...Fboss_body.nif' + '   ---> ' + '@' + 'Fboss.xor' + ' ::: ERROR') ;
  Writeln ('...Fboss_body.nif' + '   ---> ' + '@' + 'Fboss.xor' + ' ::: ERROR') ;
  end;
  end;

  end;

  If CopyF(source, fullpath + AllBodiesPath + All_Bodies[i] ) Then
  begin
  writeln (BIGHEAD + ' ---> ' + '@' + All_Bodies[i] + ' ::: OK') ;
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + All_Bodies[i] + ' ::: OK')
  end
  else
  begin
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + All_Bodies[i] + ' ::: ERROR') ;
  writeln (BIGHEAD + ' ---> ' + '@' + All_Bodies[i] + ' ::: ERROR')
  end;
  end;
  LogFile.Add('') ;
  Space;
  LogFile.Add(DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + AdamBodiesPath) ;
  writeln (DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + AdamBodiesPath );
  LogFile.Add('') ;
  Space;

  Sleep(1200) ;

  {Adam Bodies *****************************}

  For i := 0 to Length(Adam_Bodies) -1 do
  begin

  If Not (Pchar(AnsiUpperCase(Adam_Bodies[i])) = AnsiUpperCase('Ad_body1.nif')) Then
  begin


  If CopyF(source, fullpath + AdamBodiesPath + Adam_Bodies[i] ) Then
  begin
  writeln (BIGHEAD + ' ---> ' + '@' + Adam_Bodies[i] + ' ::: OK') ;
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Adam_Bodies[i] + ' ::: OK') ;
  end
  else
  begin
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Adam_Bodies[i] + ' ::: ERROR') ;
  writeln (BIGHEAD + ' ---> ' + '@' + Adam_Bodies[i] + ' ::: ERROR')
  end;
  end
  else
  begin
  {Ad_body1.nif}

  {Installing GM Monster Body}
  If FileExists(fullpath+AllBodiesPath+'Fboss.xor') Then
  begin

  If CopyF(fullpath+AllBodiesPath+'Fboss.xor', fullpath+AdamBodiesPath+'Ad_body1.nif') Then
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Adam_Bodies[i] + ' ::: OK // WARNING: Do not edit this body!!!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Adam_Bodies[i] + ' ::: OK // WARNING: Do not edit this body!!!') ;
  end
  else
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Adam_Bodies[i] + ' ::: Error while trying to copy!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Adam_Bodies[i] + ' ::: Error while trying to copy!') ;
  end;

  end
  else
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: FILE NOT FOUND!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: FILE NOT FOUND!') ;
  end;

  end;

  end;




  LogFile.Add('') ;
  Space;
  LogFile.Add(DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + CassieBodiesPath) ;
  writeln (DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + CassieBodiesPath );
  LogFile.Add('') ;
  Space;

  Sleep(50) ;

  {Cassie Bodies *****************************}

  For i := 0 to Length(Cassie_Bodies) -1 do
  begin

  If Not (Pchar(AnsiUpperCase(Cassie_Bodies[i])) = AnsiUpperCase('ca_body1.nif')) Then
  begin

  If CopyF(source, fullpath + CassieBodiesPath + Cassie_Bodies[i] ) Then
  begin
  writeln (BIGHEAD + ' ---> ' + '@' + Cassie_Bodies[i] + ' ::: OK') ;
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Cassie_Bodies[i] + ' ::: OK') ;
  end
  else
  begin
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Cassie_Bodies[i] + ' ::: ERROR') ;
  writeln (BIGHEAD + ' ---> ' + '@' + Cassie_Bodies[i] + ' ::: ERROR') ;
  end;
  end
  else
  begin
  {ca_body1.nif}

  {Installing GM Monster Body}
  If FileExists(fullpath+AllBodiesPath+'Fboss.xor') Then
  begin

  If CopyF(fullpath+AllBodiesPath+'Fboss.xor', fullpath+CassieBodiesPath+'ca_body1.nif') Then
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Cassie_Bodies[i] + ' ::: OK // WARNING: Do not edit this body!!!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Cassie_Bodies[i] + ' ::: OK // WARNING: Do not edit this body!!!') ;
  end
  else
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Cassie_Bodies[i] + ' ::: Error while trying to copy!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Cassie_Bodies[i] + ' ::: Error while trying to copy!') ;
  end;

  end
  else
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: FILE NOT FOUND!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: FILE NOT FOUND!') ;
  end;

  end;

  end;
  LogFile.Add('') ;
  Space;
  LogFile.Add(DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + ForceModelBase + 'forcemodel\') ;
  writeln (DateTimeToStr(Now)+' ::: Replacing the files in ' + fullpath + ForceModelBase + 'forcemodel\' );
  LogFile.Add('') ;
  Space;

  Sleep(50) ;

  {Force Model Bodies *****************************}

  For i := 0 to Length(ForceModel_Bodies) -1 do
  begin
  If CopyF(source, fullpath + ForceModelBase + ForceModel_Bodies_Path[i] + ForceModel_Bodies[i] ) Then
  begin
  writeln (BIGHEAD + ' ---> ' + '@'+ ForceModel_Bodies[i] + ' ::: OK') ;
  LogFile.Add(BIGHEAD + ' ---> ' + '@'+ ForceModel_Bodies[i] + ' ::: OK');
  end
  else
  begin
  LogFile.Add(BIGHEAD + ' ---> ' + '@'+ ForceModel_Bodies[i] + ' ::: ERROR') ;
  writeln (BIGHEAD + ' ---> ' + '@'+ ForceModel_Bodies[i] + ' ::: ERROR');
  end;
  end;
  LogFile.Add('') ;
  Space;
  LogFile.Add(DateTimeToStr(Now)+' ::: Replacing the files in ' + KeiBodiesPath) ;
  writeln (DateTimeToStr(Now)+' ::: Replacing the files in ' + KeiBodiesPath );
  Space;
  LogFile.Add('') ;

  Sleep(50) ;

  {Kei Bodies *****************************}

  For i := 0 to Length(Kei_Bodies) -1 do
  begin
  If CopyF(source, fullpath + KeiBodiesPath + Kei_Bodies[i] ) Then
  begin
  writeln (BIGHEAD + ' ---> ' + '@' + Kei_Bodies[i] + ' ::: OK') ;
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Kei_Bodies[i] + ' ::: OK') ;
  end
  else
  begin
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Kei_Bodies[i] + ' ::: ERROR') ;
  writeln (BIGHEAD + ' ---> ' + '@' + Kei_Bodies[i] + ' ::: ERROR')
  end;
  end;
  LogFile.Add('') ;
  Space;
  LogFile.Add(DateTimeToStr(Now)+' ::: Replacing the files in ' + ViolaBodiesPath) ;
  writeln (DateTimeToStr(Now)+' ::: Replacing the files in ' + ViolaBodiesPath );
  Space;
  LogFile.Add('') ;

  Sleep(50) ;

  {Viola Bodies *****************************}

  For i := 0 to Length(Viola_Bodies) -1 do
  begin
  If Not ( Pchar ( AnsiUpperCase(Viola_Bodies[i])) = AnsiUpperCase('vi_body1.nif') ) Then
  begin
  If CopyF(source, fullpath + ViolaBodiesPath + Viola_Bodies[i] ) Then
  begin
  writeln (BIGHEAD + ' ---> ' + '@' + Viola_Bodies[i] + ' ::: OK') ;
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Viola_Bodies[i] + ' ::: OK') ;
  end
  else
  begin
  LogFile.Add(BIGHEAD + ' ---> ' + '@' + Viola_Bodies[i] + ' ::: ERROR') ;
  writeln (BIGHEAD + ' ---> ' + '@' + Viola_Bodies[i] + ' ::: ERROR') ;
  end;
  end
  else
  begin

  Sleep(50) ;

  {Installing GM Monster Body}
  If FileExists(fullpath+AllBodiesPath+'Fboss.xor') Then
  begin

  If CopyF(fullpath+AllBodiesPath+'Fboss.xor', fullpath+ViolaBodiesPath+'vi_body1.nif') Then
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: OK // WARNING: Do not edit this body!!!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: OK // WARNING: Do not edit this body!!!') ;
  end
  else
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: Error while trying to copy!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: Error while trying to copy!') ;
  end;

  end
  else
  begin
  LogFile.Add('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: FILE NOT FOUND!') ;
  writeln ('...Fboss.xor' + '        ---> ' + '@' + Viola_Bodies[i] + ' ::: FILE NOT FOUND!') ;
  end;

  end;
  end;

  Sleep(50) ;

  {Copying flt/asi file ****************************************}

  If FileExists(fullpath+'system\'+Bypass) Then
  begin
  sourcebypass := fullpath+'system\'+asibypass+'.asi' ;
  Space ;
  LogFile.Add('');
  LogFile.Add('>>> Trying to duplicate the file "'+Bypass+'"...') ;
  writeln ('>>> Trying to duplicate the file "'+Bypass+'"...') ;
  If CopyF(fullpath+'system\'+Bypass, sourcebypass) Then
  begin
  LogFile.Add('>>> The file "'+Bypass+'" has duplicate for ...System\' + asibypass + '.asi') ;
  writeln ('>>> The file "'+Bypass+'" has duplicate for ...System\' + asibypass + '.asi') ;
  end
  else
  begin
  LogFile.Add('>>> Error while trying to duplicate file "'+Bypass+'".') ;
  writeln ('>>> Error while trying to duplicate file "'+Bypass+'".') ;
  end;
  end
  else
  begin
  LogFile.Add('>>> File flt not found! ' + '...system\'+Bypass) ;
  writeln ('>>> File flt not found! ' + '...system\'+Bypass) ;
  end;

  {Rename another SG/EU Character folder}
  If CheckBSSEA Then
  begin

  If DirectoryExists(fullpath+BSSEA) Then
  begin
  Space;
  LogFile.Add('');
  LogFile.Add('>>> The folder ...data\_sg\Character has been found!') ;
  writeln ('>>> The folder ...data\_sg\Character has been found!') ;

  If MoveFile(Pchar(fullpath+BSSEA),Pchar(fullpath+'Data\_sg\1.Character')) Then
  begin
  LogFile.Add('>>> The folder has been renamed successfully for ...data\_sg\1.Character!') ;
  writeln ('>>> The folder has been renamed successfully for ...data\_sg\1.Character!') ;
  end
  else
  begin
  LogFile.Add('');
  LogFile.Add('>>> Error while trying to rename folder ...data\_sg\Character!') ;
  writeln ('>>> Error while trying to rename folder ...data\_sg\Character!') ;
  end;

  end
  else
  begin
  If Not DirectoryExists(fullpath+'data\_sg\1.Character') Then
  begin
  Space ;
  LogFile.Add('');
  LogFile.Add('>>> The folder ...data\_sg\Character not found!') ;
  writeln ('>>> The folder ...data\_sg\Character not found!') ;
  end;
  end;

  end
  else
  begin

  If DirectoryExists(fullpath+BSEU) Then
  begin
  Space;
  LogFile.Add('');
  LogFile.Add('>>> The folder ...data\_eu\Character has been found!') ;
  writeln ('>>> The folder ...data\_eu\Character has been found!') ;

  If MoveFile(Pchar(fullpath+BSEU),Pchar(fullpath+'Data\_eu\1.Character')) Then
  begin
  LogFile.Add('>>> The folder has been renamed successfully for ...data\_eu\1.Character!') ;
  writeln ('>>> The folder has been renamed successfully for ...data\_eu\1.Character!') ;
  end
  else
  begin
  LogFile.Add('');
  LogFile.Add('>>> Error while trying to rename folder ...data\_eu\Character!') ;
  writeln ('>>> Error while trying to rename folder ...data\_eu\Character!') ;
  end;

  end
  else
  begin
  If Not DirectoryExists(fullpath+'data\_eu\1.Character') Then
  begin
  Space ;
  LogFile.Add('');
  LogFile.Add('>>> The folder ...data\_eu\Character not found!') ;
  writeln ('>>> The folder ...data\_eu\Character not found!') ;
  end;
  end;

  end;

  Sleep(50) ;

  LogFile.Add('');
  Space;
  LogFile.Add(DateTimeToStr(Now)+' ::: Installation complete O.o');
  writeln (DateTimeToStr(Now)+' ::: Installation complete O.o');
  writeln (DateTimeToStr(Now)+' ::: Note: If you have any problem with this program let me see the log file in the forum.');
  Space;
  LogFile.SaveToFile(fullpath+'Result.txt');
  If FileExists(fullpath+'Result.txt') Then
  writeln (DateTimeToStr(Now)+' ::: The log file was been created! ...Result.txt')
  else
  writeln (DateTimeToStr(Now)+' ::: The program dont have permission for create the log file.');
  Space;
  writeln (DateTimeToStr(Now)+' ::: Close this program and run your game, Enjoy!!! ');
  Sleep(500) ;
  Space;
  writeln ('Press Enter key for exit...');
  LogFile.Free ;
  readln;
  Halt;
end.




// v1.1
