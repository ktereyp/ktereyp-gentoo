# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/goldendict/goldendict-1.0.1.ebuild,v 1.9 2013/03/02 19:42:28 hwoarang Exp $

EAPI=6

inherit l10n qmake-utils

DESCRIPTION="Feature-rich dictionary lookup program"
HOMEPAGE="http://goldendict.org/"
SRC_URI="https://github.com/shadowsocks/libQtShadowsocks/archive/v${PV}.tar.gz -> libQtShadowsocks-${PV}.tar.gz"


LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug"


DEPEND="${RDEPEND}
	>=dev-libs/botan-1.10
	>=dev-qt/qtcore-5.2:5
"
src_prepare() {
	default
}

src_configure() {
	PREFIX="${EPREFIX}"/usr eqmake5
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
