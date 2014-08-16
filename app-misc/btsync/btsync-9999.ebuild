# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit unpacker

DESCRIPTION="sync tool based on the BitTorrent protocol"
HOMEPAGE="http://www.bittorrent.com/sync"
SRC_URI="amd64? ( http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
					-> btsync_x64.tar.gz )"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
S=${WORKDIR}

src_unpack(){
#add others
	unpacker btsync_x64.tar.gz || die 
}

src_install(){
	exeinto /usr/bin
	doexe btsync
}

pkg_postinst(){
	elog "type 127.0.0.1:8888 in your Web browser, then all has started"
}

