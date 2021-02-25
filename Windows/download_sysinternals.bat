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
