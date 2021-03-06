#!/bin/bash
#
# Copyright (C) 2022, 7ym0n
#
# Author: 7ym0n <bb.qnyd@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

install()
{
    is_installed java
    if [ $FNRET = 1 ]; then
        install_package openjdk
    else
        if [ $FNRET = 1 ]; then
            crit "openjdk install failed."
        else
            ok "openjdk installed."
        fi
    fi
    warn "maven package manager, you need manual download https://maven.apache.org/download.cgi"
    warn "setting your shell environment variable. \nexport MAVEN_HOME=/usr/local/apache-maven-\${version}
export PATH=\$PATH:/Users/admin/repos/go/bin:\${MAVEN_HOME}/bin"
}

upgrade()
{
    upgrade_package openjdk
}

remove()
{
    remove_package openjdk
}

if [ -z "$DOTFAIRY_ROOT_DIR" ]; then
    echo "Cannot source DOTFAIRY_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (install, upgrade, remove)
if [ -r $DOTFAIRY_ROOT_DIR/lib/main.sh ]; then
    . $DOTFAIRY_ROOT_DIR/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory?"
    exit 128
fi
