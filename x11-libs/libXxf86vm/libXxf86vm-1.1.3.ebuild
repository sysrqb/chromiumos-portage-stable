# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXxf86vm/libXxf86vm-1.1.3.ebuild,v 1.1 2013/06/01 03:22:17 chithanh Exp $

EAPI=4

XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xxf86vm library"

KEYWORDS="*"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	>=x11-proto/xf86vidmodeproto-2.3
	x11-proto/xextproto
	x11-proto/xproto"
DEPEND="${RDEPEND}"
