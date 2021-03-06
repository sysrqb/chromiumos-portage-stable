# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/rubygems/rubygems-9.ebuild,v 1.1 2015/01/19 20:38:51 graaff Exp $

EAPI=5
USE_RUBY="ruby19 ruby20"

inherit ruby-ng

DESCRIPTION="Virtual ebuild for rubygems"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="
	ruby_targets_ruby19? ( >=dev-ruby/rubygems-1.8.10-r1[ruby_targets_ruby19] )
	ruby_targets_ruby20? ( >=dev-ruby/rubygems-2.0.2[ruby_targets_ruby20] )"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }
