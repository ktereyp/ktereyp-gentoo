# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
inherit distutils-r1 git-2

DESCRIPTION="A lightweight secured scoks5 proxy for embedded devices and low end boxes."
HOMEPAGE="https://github.com/clowwindy/shadowsocks"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/clowwindy/shadowsocks.git"
	KEYWORDS="amd64"
else
	SRC_URI=""
fi

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RDEPEND="dev-python/setuptools
         dev-python/m2crypto
         dev-python/gevent"

DEPEND="${RDEPEND}"
#EPYTHON="python2.7"

python_install_all() {
    distutils-r1_python_install_all
	insinto "/etc/"
	newins "${FILESDIR}/shadowsocks.json" shadowsocks.json

	exeinto "/usr/bin"
	doexe "${FILESDIR}/shadowsocks.sh"
}

pkg_postinst(){
	elog "config file /etc/shadowsocks.json"
	elog "Run `ssserver -c /etc/shadowsocks.json` on your server. To run it in the
background, use [Supervisor].
On your client machine, use the same configuration as your server, and
start your client."
	elog "You can use args to override settings from `shadowsocks.json`.
sslocal -s server_name -p server_port -l local_port -k password -m bf-cfb
ssserver -p server_port -k password -m bf-cfb --workers 2
ssserver -c /etc/shadowsocks/config.json

List all available args with `-h`."
}
