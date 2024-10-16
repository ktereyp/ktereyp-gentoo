# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake
DESCRIPTION="GTK+ GUI configuration tool for Fcitx"

HOMEPAGE="https://github.com/fcitx/fcitx5-configtool/"

SRC_URI="https://github.com/fcitx/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2+"

SLOT="5"

KEYWORDS="~amd64"

IUSE="+kcm +qt -test"

RDEPEND="
sys-devel/gettext
x11-libs/libX11
x11-libs/libXext
x11-misc/xkeyboard-config
x11-libs/libxkbfile
app-text/iso-codes
app-i18n/fcitx
app-i18n/fcitx-qt
dev-qt/qtx11extras
dev-qt/qtgui
dev-qt/qtwidgets
dev-qt/qtcore
dev-qt/qtconcurrent
dev-qt/qtcore
qt? ( kde-frameworks/kitemviews )
kcm? ( kde-frameworks/kcoreaddons kde-frameworks/ki18n kde-frameworks/kpackage kde-frameworks/kdeclarative kde-frameworks/kirigami x11-libs/libxkbcommon )
"

DEPEND="${RDEPEND}"

BDEPEND="virtual/pkgconfig
kde-frameworks/extra-cmake-modules"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_FULL_LIBDIR="${EPREFIX}/usr/$(get_libdir)"
		-DCMAKE_INSTALL_FULL_SYSCONFDIR="${EPREFIX}/etc"
		-DENABLE_KCM=$(usex kcm)
		-DENABLE_CONFIG_QT=$(usex qt)
		-DUSE_QT6=Off
		-DENABLE_TEST=$(usex test)
	)

	cmake_src_configure
}
