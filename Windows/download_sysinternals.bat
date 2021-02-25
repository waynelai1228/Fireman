@echo off
SETLOCAL EnableDelayedExpansion
IF NOT EXIST sysinternals md sysinternals

SET sys_tools[0]=accesschk.exe
SET sys_tools[1]=AccessEnum.exe
SET sys_tools[2]=ADExplorer.exe
SET sys_tools[3]=ADInsight.exe
SET sys_tools[4]=adrestore.exe
SET sys_tools[5]=Autologon.exe
SET sys_tools[6]=Autoruns.exe
SET sys_tools[7]=Bginfo.exe
SET sys_tools[8]=Cacheset.exe
SET sys_tools[9]=Clockres.exe
SET sys_tools[10]=Contig.exe
SET sys_tools[11]=Coreinfo.exe
SET sys_tools[12]=CPUSTRES.exe
SET sys_tools[13]=ctrl2cap.exe
SET sys_tools[14]=Dbgview.exe
SET sys_tools[15]=Desktops.exe
SET sys_tools[16]=disk2vhd.exe
SET sys_tools[17]=diskext.exe
SET sys_tools[18]=Diskmon.exe
SET sys_tools[19]=DiskView.exe
SET sys_tools[20]=du.exe
SET sys_tools[21]=efsdump.exe
SET sys_tools[22]=FindLinks.exe
SET sys_tools[23]=handle.exe
SET sys_tools[24]=hex2dec.exe
SET sys_tools[25]=junction.exe
SET sys_tools[26]=ldmdump.exe
SET sys_tools[27]=Listdlls.exe
SET sys_tools[28]=livekd.exe
SET sys_tools[29]=Load0rd.exe
SET sys_tools[30]=logonsessions.exe
SET sys_tools[31]=movefile.exe
SET sys_tools[32]=notmyfault.exe
SET sys_tools[33]=ntfsinfo.exe
SET sys_tools[34]=pagedfrg.exe
SET sys_tools[35]=pendmoves.exe
SET sys_tools[36]=pipelist.exe
SET sys_tools[37]=portmon.exe
SET sys_tools[38]=procdump.exe
SET sys_tools[39]=procexp.exe
SET sys_tools[40]=procmon.exe
SET sys_tools[41]=PsExec.exe
SET sys_tools[42]=psfile.exe
SET sys_tools[43]=PsGetsid.exe
SET sys_tools[44]=PsInfo.exe
SET sys_tools[45]=pskill.exe
SET sys_tools[46]=pslist.exe
SET sys_tools[47]=PsLoggedon.exe
SET sys_tools[48]=psloglist.exe
SET sys_tools[49]=pspasswd.exe
SET sys_tools[50]=psping.exe
SET sys_tools[51]=PsService.exe
SET sys_tools[52]=psshutdown.exe
SET sys_tools[53]=pssuspend.exe
SET sys_tools[54]=RAMMap.exe
SET sys_tools[55]=RegDelNull.exe
SET sys_tools[56]=Reghide.exe
SET sys_tools[57]=regjump.exe
SET sys_tools[58]=RootkitRevealer.exe
SET sys_tools[59]=ru.exe
SET sys_tools[60]=sdelete.exe
SET sys_tools[61]=ShareEnum.exe
SET sys_tools[62]=ShellRunas.exe
SET sys_tools[63]=sigcheck.exe
SET sys_tools[64]=streams.exe
SET sys_tools[65]=strings.exe
SET sys_tools[66]=sync.exe
SET sys_tools[67]=Sysmon.exe
SET sys_tools[68]=Tcpvcon.exe
SET sys_tools[69]=Tcpview.exe
SET sys_tools[70]=Testlimit.exe
SET sys_tools[71]=Vmmap.exe
SET sys_tools[72]=Volumeid.exe
SET sys_tools[73]=whois.exe
SET sys_tools[74]=Winobj.exe
SET sys_tools[75]=ZoomIt.exe
SET sys_tools[76]=readme.txt

SET "x=0"

:SymLoop
if defined sys_tools[%x%] (
  SET output_path=%~dp0sysinternals\!sys_tools[%x%]!
  IF NOT EXIST "%output_path%" (
    SET sys_url="http://live.sysinternals.com/!sys_tools[%x%]!"
    bitsadmin /transfer "%output_path%" /download /priority normal %sys_url% %output_path%
  ) ELSE (
    echo "%output_path% exists"
  )
  SET /a "x+=1"
  GOTO :SymLoop
)
