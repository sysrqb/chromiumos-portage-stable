# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/ruby-ssl/ruby-ssl-6.ebuild,v 1.1 2015/01/19 19:51:01 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20"

inherit ruby-ng

DESCRIPTION="Virtual ebuild for the Ruby OpenSSL bindings"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	ruby_targets_ruby19? ( dev-lang/ruby:1.9[ssl] )
	ruby_targets_ruby20? ( dev-lang/ruby:2.0[ssl] )"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }
