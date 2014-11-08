# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="IntelliJ IDEA"
HOMEPAGE="http://www.jetbrains.com/idea/"
SRC_URI="http://download-cf.jetbrains.com/idea/ideaIC-${PV}.tar.gz
			-> ideaIC-${PV}.tar.gz"

LICENSE="Apache License Version 2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S=${WORKDIR}

src_unpack(){
	unpack ideaIC-${PV}.tar.gz || die
}

src_install(){
	insinto /opt/IntelliJ/
	doins -r *
	fperms +x /opt/IntelliJ/idea-IC-135.1230/bin/fsnotifier64
	fperms +x /opt/IntelliJ/idea-IC-135.1230/bin/idea.sh
	fperms +x /opt/IntelliJ/idea-IC-135.1230/bin/inspect.sh
	fperms +x /opt/IntelliJ/idea-IC-135.1230/bin/fsnotifier
}
