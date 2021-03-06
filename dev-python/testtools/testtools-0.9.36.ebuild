# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/testtools/testtools-0.9.36.ebuild,v 1.12 2015/04/08 08:05:13 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_3,3_4} pypy )

inherit distutils-r1 versionator

#SERIES="$(get_version_component_range 1-2)"
SERIES="trunk"

DESCRIPTION="Extensions to the Python unittest library"
HOMEPAGE="https://launchpad.net/testtools http://pypi.python.org/pypi/testtools"
SRC_URI="http://launchpad.net/${PN}/${SERIES}/${PV}/+download/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="doc test"

RDEPEND="dev-python/mimeparse[${PYTHON_USEDEP}]
		dev-python/extras[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	test? ( $(python_gen_cond_dep 'dev-python/twisted-core[${PYTHON_USEDEP}]' python2_7) )"

python_compile_all() {
	use doc && emake -C doc html
}

python_prepare_all() {
	# Take out failing tests
	# https://bugs.launchpad.net/testtools/+bug/1380918
	sed -e 's:test_test_module:_&:' -e 's:test_test_suite:_&:' \
		-i testtools/tests/test_distutilscmd.py || die

	distutils-r1_python_prepare_all
}

src_test() {
	 # Required to allow / ensure all impls to pass run of testsuite
	local DISTUTILS_NO_PARALLEL_BUILD=1
	distutils-r1_src_test
}

python_test() {
	esetup.py test
}

python_install_all() {
	use doc && HTML_DOCS=( doc/_build/html/. )
	distutils-r1_python_install_all
}
