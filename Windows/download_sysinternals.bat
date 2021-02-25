@echo off
setlocal EnableDelayedExpansion
IF NOT EXIST sysinternals md sysinternals

set sys_tools[0]=accesschk.exe
set sys_tools[1]=AccessEnum.exe
set sys_tools[2]=ADExplorer.exe
set sys_tools[3]=ADInsight.exe
set sys_tools[4]=adrestore.exe
set sys_tools[5]=Autologon.exe

set "x=0"

:SymLoop
if defined sys_tools[%x%] (
  SET output_path=%~dp0sysinternals\!sys_tools[%x%]!
  IF NOT EXIST "%output_path%" (
    SET sys_url="http://live.sysinternals.com/!sys_tools[%x%]!"
    bitsadmin /transfer "%output_path%" /download /priority normal %sys_url% %output_path%
  ) ELSE (
    echo "%output_path% exists"
  )
  set /a "x+=1"
  GOTO :SymLoop
)
