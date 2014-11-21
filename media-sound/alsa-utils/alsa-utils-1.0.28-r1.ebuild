# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/alsa-utils/alsa-utils-1.0.28-r1.ebuild,v 1.1 2014/11/19 19:16:08 vapier Exp $

EAPI=5
inherit eutils systemd udev

DESCRIPTION="Advanced Linux Sound Architecture Utils (alsactl, alsamixer, etc.)"
HOMEPAGE="http://www.alsa-project.org/"
SRC_URI="mirror://alsaproject/utils/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0.9"
KEYWORDS="*"
IUSE="doc +libsamplerate +ncurses nls selinux"

CDEPEND=">=media-libs/alsa-lib-${PV}
	libsamplerate? ( media-libs/libsamplerate )
	ncurses? ( >=sys-libs/ncurses-5.7-r7 )"
DEPEND="${CDEPEND}
	virtual/pkgconfig
	doc? ( app-text/xmlto )"
RDEPEND="${CDEPEND}
	selinux? ( sec-policy/selinux-alsa )"

src_prepare() {
	epatch "${FILESDIR}"/${P}-aplay-return.patch
	epatch "${FILESDIR}"/${P}-va-end.patch
	epatch "${FILESDIR}"/${P}-{mixer,monitor}-proto.patch
	epatch_user
}

src_configure() {
	local myconf
	use doc || myconf='--disable-xmlto'

	# --disable-alsaconf because it doesn't work with sys-apps/kmod wrt #456214
	econf \
		--disable-maintainer-mode \
		$(use_enable libsamplerate alsaloop) \
		$(use_enable nls) \
		$(use_enable ncurses alsamixer) \
		--disable-alsaconf \
		"$(systemd_with_unitdir)" \
		--with-udev-rules-dir="$(get_udevdir)"/rules.d \
		${myconf}
}

src_install() {
	default
	dodoc seq/*/README.*

	newinitd "${FILESDIR}"/alsasound.initd-r6 alsasound
	newconfd "${FILESDIR}"/alsasound.confd-r4 alsasound

	insinto /etc/modprobe.d
	newins "${FILESDIR}"/alsa-modules.conf-rc alsa.conf

	keepdir /var/lib/alsa

	# ALSA lib parser.c:1266:(uc_mgr_scan_master_configs) error: could not
	# scan directory /usr/share/alsa/ucm: No such file or directory
	# alsaucm: unable to obtain card list: No such file or directory
	keepdir /usr/share/alsa/ucm
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog
		elog "To take advantage of the init script, and automate the process of"
		elog "saving and restoring sound-card mixer levels you should"
		elog "add alsasound to the boot runlevel. You can do this as"
		elog "root like so:"
		elog "# rc-update add alsasound boot"
		ewarn
		ewarn "The ALSA core should be built into the kernel or loaded through other"
		ewarn "means. There is no longer any modular auto(un)loading in alsa-utils."
	fi
}