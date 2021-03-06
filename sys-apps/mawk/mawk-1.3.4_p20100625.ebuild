# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/mawk/mawk-1.3.4_p20100625.ebuild,v 1.2 2011/10/20 15:04:10 vapier Exp $

EAPI="2"

inherit toolchain-funcs eutils

MY_P=${P/_p/-}
DESCRIPTION="an (often faster than gawk) awk-interpreter"
HOMEPAGE="http://invisible-island.net/mawk/mawk.html"
SRC_URI="ftp://invisible-island.net/mawk/${MY_P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-1.3.4-cross-compile.patch
	tc-export BUILD_CC
}

src_install() {
	emake install DESTDIR="${D}" || die
	dodoc ACKNOWLEDGMENT CHANGES INSTALL README

	exeinto /usr/share/doc/${PF}/examples
	doexe examples/*  # avoid compression of dodoc + make executable
}
