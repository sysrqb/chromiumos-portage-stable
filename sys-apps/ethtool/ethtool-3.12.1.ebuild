# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-apps/ethtool/ethtool-3.12.1.ebuild,v 1.4 2014/01/03 14:45:40 pinkbyte Exp $

EAPI="4"

DESCRIPTION="Utility for examining and tuning ethernet-based network interfaces"
HOMEPAGE="http://www.kernel.org/pub/software/network/ethtool/"
SRC_URI="mirror://kernel/software/network/ethtool/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"

DEPEND="app-arch/xz-utils"
