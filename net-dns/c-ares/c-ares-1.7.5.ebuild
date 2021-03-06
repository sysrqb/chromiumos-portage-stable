# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-dns/c-ares/c-ares-1.7.5.ebuild,v 1.1 2011/08/21 11:23:15 angelos Exp $

EAPI=4

DESCRIPTION="C library that resolves names asynchronously"
HOMEPAGE="http://c-ares.haxx.se/"
SRC_URI="http://${PN}.haxx.se/download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="static-libs"

DOCS=( AUTHORS CHANGES README README.cares RELEASE-NOTES TODO )

src_configure() {
	econf \
		--enable-nonblocking \
		--enable-symbol-hiding \
		$(use_enable static-libs static)
}

src_install() {
	default
	find "${ED}" -name "*.la" -exec rm {} + || die
}
