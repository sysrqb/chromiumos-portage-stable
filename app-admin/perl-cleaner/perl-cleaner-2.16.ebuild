# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/perl-cleaner/perl-cleaner-2.16.ebuild,v 1.4 2014/07/26 20:50:21 zlogene Exp $

EAPI=5

DESCRIPTION="User land tool for cleaning up old perl installs"
HOMEPAGE="http://www.gentoo.org/proj/en/perl/"

if [[ "${PV}" == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="http://github.com/gentoo-perl/perl-cleaner.git"
	KEYWORDS="*"
else
	SRC_URI="mirror://gentoo/${P}.tar.bz2 http://dev.gentoo.org/~dilfridge/distfiles/${P}.tar.bz2"
	KEYWORDS="*"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

[[ "${PV}" == "9999" ]] && DEPEND="sys-apps/help2man"

RDEPEND="app-shells/bash
	|| ( >=sys-apps/coreutils-8.15 app-misc/realpath sys-freebsd/freebsd-bin )
	dev-lang/perl"

src_install() {
	dosbin perl-cleaner
	doman perl-cleaner.1
}
