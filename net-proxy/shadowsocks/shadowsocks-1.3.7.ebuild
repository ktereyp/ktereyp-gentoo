# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/autopep8/autopep8-0.5.2-r1.ebuild,v 1.2 2012/06/16 13:39:00 sping Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="a lightweight tunnel proxy"
HOMEPAGE="http://pypi.python.org/pypi/shadowsocks"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="AS IS"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/setuptools
		 dev-python/m2crypto
		 dev-python/gevent"
DEPEND="${RDEPEND}"
