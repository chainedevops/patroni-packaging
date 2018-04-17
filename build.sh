#!/bin/sh
mkdir -p /root/rpmbuild/SOURCES
tar -czf /root/rpmbuild/SOURCES/patroni-customizations.tar.gz patroni.2.service patroni-watchdog.service postgres-telia.yml 
curl -L https://github.com/zalando/patroni/archive/v1.3.6.tar.gz -o /root/rpmbuild/SOURCES/patroni-1.3.6.tar.gz
cp telia-patch.diff /root/rpmbuild/SOURCES/
rpmbuild -bb patroni.spec
mkdir -p rpms
cp /root/rpmbuild/RPMS/x86_64/patroni-*.rpm rpms/
