# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libxkbfile/libxkbfile-1.0.7.ebuild,v 1.9 2011/02/14 18:47:09 xarthisius Exp $

EAPI=3
inherit xorg-2

DESCRIPTION="X.Org xkbfile library"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-proto/kbproto"
DEPEND="${RDEPEND}"
