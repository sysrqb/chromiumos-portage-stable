# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/zip/zip-3.0-r1.ebuild,v 1.19 2014/01/18 01:45:41 vapier Exp $

EAPI="2"
inherit toolchain-funcs eutils flag-o-matic

MY_P="${PN}${PV//.}"
DESCRIPTION="Info ZIP (encryption support)"
HOMEPAGE="http://www.info-zip.org/"
SRC_URI="mirror://sourceforge/infozip/${MY_P}.zip"

LICENSE="Info-ZIP"
SLOT="0"
KEYWORDS="*"
IUSE="bzip2 crypt natspec unicode"

RDEPEND="bzip2? ( app-arch/bzip2 )
	natspec? ( dev-libs/libnatspec )"
DEPEND="${RDEPEND}
	app-arch/unzip"

S=${WORKDIR}/${MY_P}

src_prepare() {
	epatch "${FILESDIR}"/${PN}-3.0-no-crypt.patch #238398
	epatch "${FILESDIR}"/${PN}-3.0-pic.patch
	epatch "${FILESDIR}"/${PN}-3.0-exec-stack.patch
	epatch "${FILESDIR}"/${PN}-3.0-build.patch
	use natspec && epatch "${FILESDIR}"/${PN}-3.0-natspec.patch #275244
}

src_compile() {
	use bzip2 || append-flags -DNO_BZIP2_SUPPORT
	use crypt || append-flags -DNO_CRYPT
	use unicode || append-flags -DNO_UNICODE_SUPPORT
	emake \
		CC="$(tc-getCC)" \
		LOCAL_ZIP="${CFLAGS} ${CPPFLAGS}" \
		-f unix/Makefile generic \
		|| die
}

src_install() {
	dobin zip zipnote zipsplit || die
	doman man/zip{,note,split}.1
	if use crypt ; then
		dobin zipcloak || die
		doman man/zipcloak.1
	fi
	dodoc BUGS CHANGES README* TODO WHATSNEW WHERE proginfo/*.txt
}
