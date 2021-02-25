@echo off
md sysinternals
cd sysinternals

set sys_tools[0] = "accesschk.exe"
set sys_tools[1] = "AccessEnum.exe"
set sys_tools[2] = "ADExplorer.exe"
set sys_tools[3] = "ADInsight.exe"

(for %%t in (%sys_tools%) do (
  IF NOT EXIST %%t (
    certutil -urlcache -split -f "http://live.sysinternals.com/%%t" %%t
    echo "downloaded %%t"
  )
))
