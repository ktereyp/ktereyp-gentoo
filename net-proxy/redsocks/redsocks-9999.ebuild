# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="Transparent redirector of any TCP connection to proxy"
HOMEPAGE="http://darkk.net.ru/redsocks/"
EGIT_REPO_URI="git://github.com/darkk/${PN}.git"
#EGIT_COMMIT="27b17889a43e32b0c1162514d00967e6967d41bb"
EGIT_COMMIT="release-0.5"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/libevent
	net-firewall/iptables"
DEPEND="virtual/pkgconfig
	${RDEPEND}"

src_compile() {
	emake
}

src_install() {
	dobin redsocks
	dodoc README doc/*
	insinto /etc/redsocks
	newins redsocks.conf.example redsocks.conf
}
