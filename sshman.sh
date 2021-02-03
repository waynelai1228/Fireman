#!/bin/bash

sshd_config_backup_loc=./backup_sshd_config
sshd_config_out_loc=./sshd_config

RED='\033[0;31m'
NC='\033[0m'

cp $sshd_config_out_loc $sshd_config_backup_loc
echo "Writing to $sshd_config_out_loc"
grep -q 'Protocol' $sshd_config_out_loc && sed -i 's/.*Protocol.*/Protocol 2/g' $sshd_config_out_loc || echo 'Protocol 2' >> $sshd_config_out_loc
echo "-set protocol to version 2"
grep -q '\([^"]\|\) *PermitRootLogin *\(without-password\|prohibit-password\|yes\|no\)' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *PermitRootLogin *\(without-password\|prohibit-password\|yes\|no\)/PermitRootLogin no/g' $sshd_config_out_loc || echo 'PermitRootLogin no' >> $sshd_config_out_loc
echo "-prohibit root login"
grep -q '\([^"]\|\) *PermitEmptyPasswords' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *PermitEmptyPasswords.*/PermitEmptyPasswords no/g' $sshd_config_out_loc || echo 'PermitEmptyPasswords no' >> $sshd_config_out_loc
echo "-prohibit empty passwords"
grep -q '\([^"]\|\) *PubkeyAuthentication' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *PubkeyAuthentication.*/PubkeyAuthentication yes/g' $sshd_config_out_loc || echo 'PubkeyAuthentication yes' >> $sshd_config_out_loc
echo "-turn on public key authentication"
grep -q '\([^"]\|\) *X11Forwarding' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *X11Forwarding.*/X11Forwarding no/g' $sshd_config_out_loc || echo 'X11Forwarding no' >> $sshd_config_out_loc
echo "-prohibit GUI"
grep -q '\([^"]\|\) *UsePAM' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *UsePAM.*/UsePAM yes/g' $sshd_config_out_loc || echo 'UsePAM yes' >> $sshd_config_out_loc
echo "-turn on PAM"
grep -q '\([^"]\|\) *ClientAliveInterval' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *ClientAliveInterval.*/ClientAliveInterval 300/g' $sshd_config_out_loc || echo 'ClientAliveInterval 300' >> $sshd_config_out_loc
echo "-set alive interval to 300s"
grep -q '\([^"]\|\) *ClientAliveCountMax' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *ClientAliveCountMax.*/ClientAliveCountMax 3/g' $sshd_config_out_loc || echo 'ClientAliveCountMax 3' >> $sshd_config_out_loc
echo "-set alive count to 3"
grep -q '\([^"]\|\) *MaxAuthTries' $sshd_config_out_loc && sed -i 's/\([^"]\|\) *MaxAuthTries.*/MaxAuthTries 3/g' $sshd_config_out_loc || echo 'MaxAuthTries 3' >> $sshd_config_out_loc
echo "-set maximum authentication tries to 3"

echo -e "${RED}please manually restart the service using - sudo systemctl restart ssh${NC}"
