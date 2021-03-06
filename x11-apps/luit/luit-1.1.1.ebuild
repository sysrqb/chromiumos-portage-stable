# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/luit/luit-1.1.1.ebuild,v 1.11 2013/04/12 12:05:43 chithanh Exp $

EAPI=4
XORG_EAUTORECONF=yes

inherit xorg-2

DESCRIPTION="Locale and ISO 2022 support for Unicode terminals"

KEYWORDS="*"
IUSE=""
RDEPEND="sys-libs/zlib
	x11-libs/libX11
	x11-libs/libfontenc"
DEPEND="${RDEPEND}"

src_prepare() {
	# posix_openpt() call needs POSIX 2004, bug #415949
	sed -i 's/-D_XOPEN_SOURCE=500/-D_XOPEN_SOURCE=600/' configure.ac || die
	xorg-2_src_prepare
}
