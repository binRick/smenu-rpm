#!/bin/bash
mkdir -p ~/rpmbuild/SOURCES
wget wget https://github.com/p-gen/smenu/archive/v0.9.15.tar.gz -O ~/rpmbuild/SOURCES/v0.9.15.tar.gz
rpmbuild -bb smenu.spec
