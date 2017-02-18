#!/bin/bash

if test -d ~/.xcrysden
then
        echo ""
else
        mkdir ~/.xcrysden
fi


cat >> ~/.xcrysden/custom-definitions <<EOF
#------------------added by wan2xsf
addOption --wani ${PWD}/shwan2xsf.sh {
  load structure from wannier90 case.win format
}                                       
EOF

cat > shwan2xsf.sh << EOF
#! /bin/bash
${PWD}/wan2xsf \$1
EOF

chmod +x shwan2xsf.sh
chmod +x wan2xsf

echo "Now you can visualize case.win via xcrysden using the following command:"
echo "xcrysden --wani case.win"
