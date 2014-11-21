# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-embedded/u-boot-tools/u-boot-tools-2014.01.ebuild,v 1.4 2014/05/03 14:44:01 zlogene Exp $

EAPI="5"

inherit eutils toolchain-funcs

MY_P="u-boot-${PV/_/-}"
DESCRIPTION="utilities for working with Das U-Boot"
HOMEPAGE="http://www.denx.de/wiki/U-Boot/WebHome"
SRC_URI="ftp://ftp.denx.de/pub/u-boot/${MY_P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i "s:-g ::" tools/Makefile || die
	# Make sure we find local u-boot headers first #429302
	ln -s ../include/image.h tools/ || die
	epatch "${FILESDIR}"/u-boot-no-config.h.patch
}

src_compile() {
	emake \
		HOSTSTRIP=: \
		HOSTCC="$(tc-getCC)" \
		HOSTCFLAGS="${CFLAGS} ${CPPFLAGS}"' $(HOSTCPPFLAGS)' \
		HOSTLDFLAGS="${LDFLAGS}" \
		CONFIG_ENV_OVERWRITE=y \
		tools-all
}

src_install() {
	cd tools
	dobin bmp_logo gen_eth_addr img2srec mkimage
	dobin easylogo/easylogo
	dobin env/fw_printenv
	dosym fw_printenv /usr/bin/fw_setenv
	insinto /etc
	doins env/fw_env.config
}