# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/re2c/re2c-0.13.6.ebuild,v 1.1 2014/04/25 23:36:44 radhermit Exp $

EAPI=5

DESCRIPTION="tool for generating C-based recognizers from regular expressions"
HOMEPAGE="http://re2c.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="*"

src_install() {
	dobin re2c
	doman re2c.1
	dodoc README CHANGELOG doc/*
	docinto examples
	dodoc examples/*.c examples/*.re
}
