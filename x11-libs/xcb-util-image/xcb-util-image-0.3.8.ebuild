# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/xcb-util-image/xcb-util-image-0.3.8.ebuild,v 1.9 2011/08/20 15:47:43 jer Exp $

EAPI=4

XORG_MODULE=/
XORG_BASE_INDIVIDUAL_URI=http://xcb.freedesktop.org/dist
XORG_DOC=doc
inherit xorg-2

EGIT_REPO_URI="git://anongit.freedesktop.org/git/xcb/util-image"
EGIT_HAS_SUBMODULES=yes

# This package uses the MIT license inherited from Xorg but fails to provide
# any license file in its source, so we add X as a license, which lists all
# the Xorg copyright holders and allows license generation to pick them up.
LICENSE="|| ( MIT X )"

DESCRIPTION="X C-language Bindings sample implementations"
HOMEPAGE="http://xcb.freedesktop.org/"

KEYWORDS="*"
IUSE="test"

RDEPEND=">=x11-libs/xcb-util-${PV}
	x11-proto/xproto"
DEPEND="${RDEPEND}
	>=dev-util/gperf-3.0.1
	test? ( >=dev-libs/check-0.9.4 )"

pkg_setup() {
	XORG_CONFIGURE_OPTIONS=(
		$(use_with doc doxygen)
	)

	xorg-2_pkg_setup
}
