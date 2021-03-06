# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/trollius/trollius-1.0.4.ebuild,v 1.1 2015/02/25 17:49:15 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy )
inherit distutils-r1

DESCRIPTION="A port of the Tulip project (asyncio module, PEP3156)"
HOMEPAGE="https://bitbucket.org/enovance/trollius/ https://pypi.python.org/pypi/trollius/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="*"

RDEPEND="virtual/python-futures[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_test() {
	"${PYTHON}" runtests.py || die "Testing failed under ${EPYTHON}"
}
