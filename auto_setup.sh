#!/bin/bash

bash /etc/pkgship/auto_install_pkgship_requires.sh redis
bash /etc/pkgship/auto_install_pkgship_requires.sh elasticsearch
su -c "pkgshipd start" pkgshipuser
su -c "pkgship-paneld start" pkgshipuser
su -c "pkgship-panel &" pkgshipuser
su -c "pkgship init" pkgshipuser
pkgship init
