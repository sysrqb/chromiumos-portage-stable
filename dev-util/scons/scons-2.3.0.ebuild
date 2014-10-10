# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/scons/scons-2.3.0.ebuild,v 1.18 2014/06/10 00:48:55 vapier Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1

DESCRIPTION="Extensible Python-based build utility"
HOMEPAGE="http://www.scons.org/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz
	doc? ( http://www.scons.org/doc/${PV}/PDF/${PN}-user.pdf -> ${P}-user.pdf
	       http://www.scons.org/doc/${PV}/HTML/${PN}-user.html -> ${P}-user.html )"

LICENSE="MIT"
SLOT="0"
KEYWORDS="*"
IUSE="doc"

python_prepare_all() {
	local PATCHES=(
		"${FILESDIR}/scons-1.2.0-popen.patch"
		"${FILESDIR}/${PN}-2.1.0-jython.patch"
	)

	# https://bugs.gentoo.org/show_bug.cgi?id=361061
	sed -i -e "s|/usr/local/bin:/opt/bin:/bin:/usr/bin|${EPREFIX}/usr/local/bin:${EPREFIX}/opt/bin:${EPREFIX}/bin:${EPREFIX}/usr/bin:/usr/local/bin:/opt/bin:/bin:/usr/bin|g" engine/SCons/Platform/posix.py || die
	# and make sure the build system doesn't "force" /usr/local/ :(
	sed -i -e "s/'darwin'/'NOWAYdarwinWAYNO'/" setup.py || die

	distutils-r1_python_prepare_all
}

python_install() {
	distutils-r1_python_install \
		--standard-lib \
		--no-version-script \
		--install-data "${EPREFIX}"/usr/share
}

python_install_all() {
	local DOCS=( {CHANGES,README,RELEASE}.txt )
	distutils-r1_python_install_all

	use doc && dodoc "${DISTDIR}"/${P}-user.{pdf,html}
}

src_install() {
	distutils-r1_src_install

	# Build system does not use build_scripts properly.
	# http://scons.tigris.org/issues/show_bug.cgi?id=2891
	python_replicate_script "${ED}"usr/bin/scons{,ign,-time}
}
