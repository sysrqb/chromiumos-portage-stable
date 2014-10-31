# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Text-WrapI18N/Text-WrapI18N-0.60.0-r1.ebuild,v 1.1 2014/08/23 00:23:57 axs Exp $

EAPI=5

MODULE_AUTHOR=KUBOTA
MODULE_VERSION=0.06
inherit perl-module

DESCRIPTION="Internationalized substitute of Text::Wrap"

SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="dev-perl/Text-CharWidth"
DEPEND="${RDEPEND}"

SRC_TEST="do"