# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A lightweight secured scoks5 proxy for embedded devices and low end boxes."
HOMEPAGE="https://github.com/madeye/shadowsocks-libev"
SRC_URI="https://github.com/madeye/${PN}/archive/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/libev"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install

	dodir /etc/shadowsocks
	cp "${FILESDIR}"/config.json "${ED}"/etc/shadowsocks/config.json || die

	newinitd "${FILESDIR}"/ss-server.initd ss-server

	dodoc Changes README.md
	doman shadowsocks.8
}

