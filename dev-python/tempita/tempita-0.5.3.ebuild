# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/tempita/tempita-0.5.3.ebuild,v 1.2 2014/06/06 13:29:38 djc Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy )

inherit distutils-r1

MY_PN="Tempita"
MY_P="${MY_PN}-${PV}dev"

DESCRIPTION="A very small text templating language"
HOMEPAGE="http://pythonpaste.org/tempita http://pypi.python.org/pypi/Tempita"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}dev"
# Source for tests incomplete
