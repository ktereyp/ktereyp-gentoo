# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils autotools

DESCRIPTION="For test ebuild"
HOMEPAGE="/home/try/"
SRC_URI="//home/try/workspace/testebuild-1.1.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#src_unpack(){
#	if [ "${A}" != "" ];then
#		unpack ${A}
#	fi
#}

src_install() {
   einstall 
}
