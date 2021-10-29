#!/bin/sh

###########################################
#---------------) Colors (----------------#
###########################################

C=$(printf '\033')
RED="${C}[1;31m"
SED_RED="${C}[1;31m&${C}[0m"
GREEN="${C}[1;32m"
SED_GREEN="${C}[1;32m&${C}[0m"
YELLOW="${C}[1;33m"
SED_YELLOW="${C}[1;33m&${C}[0m"
SED_RED_YELLOW="${C}[1;31;103m&${C}[0m"
BLUE="${C}[1;34m"
SED_BLUE="${C}[1;34m&${C}[0m"
ITALIC_BLUE="${C}[1;34m${C}[3m"
LIGHT_MAGENTA="${C}[1;95m"
SED_LIGHT_MAGENTA="${C}[1;95m&${C}[0m"
LIGHT_CYAN="${C}[1;96m"
SED_LIGHT_CYAN="${C}[1;96m&${C}[0m"
LG="${C}[1;37m" #LightGray
SED_LG="${C}[1;37m&${C}[0m"
DG="${C}[1;90m" #DarkGray
SED_DG="${C}[1;90m&${C}[0m"
NC="${C}[0m"
UNDERLINED="${C}[5m"
ITALIC="${C}[3m"


printf ${DG}"This is how you use colour\n"${NC}
echo "how to use colour wiht sed" | sed "s,sed,${SED_RED_YELLOW},"

printf "Showing audit for file system\n"
printf ${DG}"-------------------------------------------------\n"${NC}
printf "here are the filesystem drivers on your system: \n"
ls -l /lib/modules/$(uname -r)/kernel/fs

printf "\ncramfs: \n"
if modprobe -n -v cramfs | grep -q "insmod"; then
  printf ${RED}"cramfs module exists\n"${NC}
fi
if lsmod | grep -q "cramfs"; then
  echo "cramfs is loaded" | sed "s,cramfs,${SED_RED_YELLOW},"
fi

printf "\nfreevxfs: \n"
if modprobe -n -v freevxfs | grep -q "insmod"; then
  printf ${RED}"freevxfs module exists\n"${NC}
fi
if lsmod | grep -q "freevxfs"; then
  echo "freevxfs is loaded" | sed "s,freevxfs,${SED_RED_YELLOW},"
fi

printf "\njffs2: \n"
if modprobe -n -v jffs2 | grep -q "insmod"; then
  printf ${RED}"jffs2 module exists\n"${NC}
fi
if lsmod | grep -q "jffs2"; then
  echo "jffs2 is loaded" | sed "s,jffs2,${SED_RED_YELLOW},"
fi

printf "\nhfs: \n"
if modprobe -n -v hfs | grep -q "insmod"; then
  printf ${RED}"hfs module exists\n"${NC}
fi
if lsmod | grep -q "hfs"; then
  echo "hfs is loaded" | sed "s,hfs,${SED_RED_YELLOW},"
fi

printf "\nhfsplus: \n"
if modprobe -n -v hfsplus | grep -q "insmod"; then
  printf ${RED}"hfsplus module exists\n"${NC}
fi
if lsmod | grep -q "hfsplus"; then
  echo "hfsplus is loaded" | sed "s,hfsplus,${SED_RED_YELLOW},"
fi

printf "\nsquashfs: \n"
if modprobe -n -v squashfs | grep -q "insmod"; then
  printf ${RED}"squashfs module exists\n"${NC}
fi
if lsmod | grep -q "squashfs"; then
  echo "squashfs is loaded" | sed "s,squashfs,${SED_RED_YELLOW},"
fi

printf "\nudf: \n"
if modprobe -n -v udf | grep -q "insmod"; then
  printf ${RED}"udf module exists\n"${NC}
fi
if lsmod | grep -q "udf"; then
  echo "udf is loaded" | sed "s,udf,${SED_RED_YELLOW},"
fi

printf "\nvfat: \n"
if modprobe -n -v vfat | grep -q "insmod"; then
  printf ${RED}"vfat module exists\n"${NC}
fi
if lsmod | grep -q "vfat"; then
  echo "vfat is loaded" | sed "s,vfat,${SED_RED_YELLOW},"
fi
