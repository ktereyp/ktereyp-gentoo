# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils multilib git-r3 mercurial

DESCRIPTION="Ryzom depence lib"
HOMEPAGE=""

EHG_REPO_URI="http://hg.kervala.net/squish"
#CMAKE_REPO_URI="http://hg.kervala.net/cmake" 

LICENSE="Aladdin Boost-1.0 LGPL-3 MIT public-domain"

SLOT="0"
KEYWORDS="amd64"
IUSE=""

src_prepare() {
	default
}

src_configure() {
	export CMAKE_MODULE_PATH=${FILESDIR}/cmake/modules
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
