# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/cheetah/cheetah-2.4.4-r1.ebuild,v 1.11 2015/04/08 08:04:59 mgorny Exp $

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

MY_PN="Cheetah"
MY_P="${MY_PN}-${PV/_}"

DESCRIPTION="Python-powered template engine and code generator"
HOMEPAGE="http://www.cheetahtemplate.org/ http://rtyler.github.com/cheetah/ http://pypi.python.org/pypi/Cheetah"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="MIT"
IUSE=""
KEYWORDS="*"
SLOT="0"

RDEPEND="dev-python/markdown[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S="${WORKDIR}/${MY_P}"

DOCS=( CHANGES README.markdown TODO )
# Race in the test suite
DISTUTILS_IN_SOURCE_BUILD=1

python_prepare_all() {
	# Disable broken tests.
	sed \
		-e "/Unicode/d" \
		-e "s/if not sys.platform.startswith('java'):/if False:/" \
		-e "/results =/a\\    sys.exit(not results.wasSuccessful())" \
		-i cheetah/Tests/Test.py || die "sed failed"

	distutils-r1_python_prepare_all
}

python_test() {
	"${PYTHON}" cheetah/Tests/Test.py || die "Testing failed with ${EPYTHON}"
}
