# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-proto/fixesproto/fixesproto-5.0.ebuild,v 1.7 2011/04/16 18:07:21 armin76 Exp $

EAPI=4
inherit xorg-2

DESCRIPTION="X.Org Fixes protocol headers"

KEYWORDS="*"
IUSE=""

RDEPEND=">=x11-proto/xextproto-7.0.99.1"
DEPEND="${RDEPEND}"
