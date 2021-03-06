# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/m2crypto/m2crypto-0.21.1-r2.ebuild,v 1.3 2015/04/08 08:05:00 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

MY_PN="M2Crypto"

DESCRIPTION="M2Crypto: A Python crypto and SSL toolkit"
HOMEPAGE="http://chandlerproject.org/bin/view/Projects/MeTooCrypto http://pypi.python.org/pypi/M2Crypto"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="doc examples"

# swig-3.0.5 results in broken constants, #538920
RDEPEND=">=dev-libs/openssl-0.9.8"
DEPEND="${RDEPEND}
	<dev-lang/swig-3.0.5
	>=dev-lang/swig-1.3.28
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? ( dev-python/epydoc[${PYTHON_USEDEP}] )"

S="${WORKDIR}/${MY_PN}-${PV}"

# Tests access network, and fail randomly. Bug #431458.
RESTRICT=test

python_prepare_all() {
	epatch "${FILESDIR}"/${P}-cross-compile.patch

	# use pre-swigged sources
	sed -i -e '/sources/s:\.i:_wrap.c:' setup.py || die

	distutils-r1_python_prepare_all
}

python_configure_all() {
	set -- swig -python -includeall -I/usr/include \
		-o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i

	echo "${@}" >&2
	"${@}" || die 'swig failed'
}

python_compile_all() {
	if use doc; then
		cd doc || die
		epydoc --html --output=api --name=M2Crypto M2Crypto || die
	fi
}

python_test() {
	esetup.py test
}

python_install_all() {
	use doc && local HTML_DOCS=( doc/. )

	distutils-r1_python_install_all

	if use examples; then
		docinto examples
		dodoc -r demo/.
		docompress -x /usr/share/doc/${PF}/examples
	fi
}
