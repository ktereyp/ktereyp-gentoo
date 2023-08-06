# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop git-r3 cmake

DESCRIPTION="Gui for clash"
HOMEPAGE="https://github.com/ktereyp/bridge"
EGIT_REPO_URI="https://github.com/ktereyp/bridge.git"
EGIT_BRANCH="master"
EGIT_SUBMODULES=()

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_install() {
	local dir="/opt/${PN}"
	insinto ${dir}

	doins ${BUILD_DIR}/${PN}
	fperms 755 "${dir}"/${PN}

	local pngfile="assets/bridge.png"
	doins ${pngfile}

	newicon $pngfile "${PN}.png" || die "we died"
	make_desktop_entry "${dir}/${PN}" "Bridge" "${PN}"
}
