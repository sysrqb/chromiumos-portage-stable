# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-apps/xrdb/xrdb-1.0.9.ebuild,v 1.7 2011/04/11 17:42:43 xarthisius Exp $

EAPI=3

inherit xorg-2

DESCRIPTION="X server resource database utility"
KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libXmu
	x11-libs/libX11"
DEPEND="${RDEPEND}"
