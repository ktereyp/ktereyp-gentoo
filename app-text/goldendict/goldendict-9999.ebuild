# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PLOCALES="ar_SA ay_BO be_BY bg_BG crowdin cs_CZ de_CH de_DE el_GR eo_UY es_AR es_BO es_ES fa_IR fi_FI fr_FR hi_IN hu_HU ie_001 it_IT ja_JP jbo_EN ko_KR lt_LT mk_MK nl_NL pl_PL pt_BR pt_PT qt_extra_es qt_extra_it qt_extra_lt qtwebengine_zh_CN qu_PE ru_RU sk_SK sq_AL sr_SP sv_SE tg_TJ tk_TM tr_TR uk_UA vi_VN zh_CN zh_TW"

inherit desktop git-r3 cmake xdg-utils

DESCRIPTION="Feature-rich dictionary lookup program"
HOMEPAGE="http://goldendict.org/"
EGIT_REPO_URI="https://github.com/xiaoyifang/goldendict-ng.git"
EGIT_COMMIT="v24.09.0-Release.316ec900"
EGIT_SUBMODULES=()

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug ffmpeg opencc multimedia wayland xapian zim"

RDEPEND="
	app-arch/bzip2
	app-arch/xz-utils
	virtual/libiconv
	>=app-text/hunspell-1.2:=
	dev-libs/eb
	dev-libs/lzo
	dev-qt/qtbase:6[X,concurrent,gui,network,sql,widgets,xml]
	dev-qt/qtmultimedia:6
	dev-qt/qtspeech:6
	dev-qt/qtsvg:6
	dev-qt/qtwebengine:6[widgets]
	dev-qt/qtdeclarative:6
	dev-qt/qt5compat:6
	media-libs/libvorbis
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXtst
	virtual/opengl
	ffmpeg? (
		media-libs/libao
		media-video/ffmpeg:0=
	)
	app-i18n/opencc
	multimedia? ( dev-qt/qtmultimedia[gstreamer] )
	dev-libs/xapian
	zim? ( app-arch/libzim )
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-qt/qttools:6[assistant,linguist]
	virtual/pkgconfig
"

src_configure() {
        local mycmakeargs=(
			-DWITH_ZIM=OFF
        )
		cmake_src_configure
}

