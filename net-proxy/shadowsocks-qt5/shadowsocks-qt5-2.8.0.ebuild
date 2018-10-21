# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/goldendict/goldendict-1.0.1.ebuild,v 1.9 2013/03/02 19:42:28 hwoarang Exp $

EAPI=6

inherit  qmake-utils gnome2-utils

DESCRIPTION="A cross-platform shadowsocks GUI client"
HOMEPAGE="https://github.com/shadowsocks/shadowsocks-qt5"
SRC_URI="https://github.com/shadowsocks/shadowsocks-qt5/archive/v${PV}.tar.gz -> shadowsocks-qt5-${PV}.tar.gz"


LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"

DEPEND=">dev-libs/botan-1.10[threads]
		dev-libs/libappindicator:2
		>=dev-qt/libQtShadowsocks-1.10.0
		dev-qt/qtconcurrent
		dev-qt/qtcore:5
		dev-qt/qtdbus:5
		dev-qt/qtnetwork
		dev-qt/qtwidgets:5
		media-gfx/zbar
		media-gfx/qrencode"

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

src_compile() {
	eqmake5 INSTALL_PREFIX="${D}"/usr
}
