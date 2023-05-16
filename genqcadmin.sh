#!/bin/bash

set -e

tag=${1}
[ -d /tmp/quickon ] && rm -rf /tmp/quickon || true
git clone https://github.com/easysoft/quickon_cli /tmp/quickon
cp /tmp/quickon/docs/qcadmin.rb .
git add .
version=$(cat qcadmin.rb | grep "version " | awk -F\" '{print $2}')
echo "tag: ${tag} version: ${version}"
datetime=$(date +%F-%H-%M)
git commit -m "release qcadmin(quickon) ${version} by bot ${datetime}"
git push origin master
rm -rf /tmp/quickon
