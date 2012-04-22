# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/sslsniff/sslsniff-0.6.ebuild,v 1.2 2009/12/21 13:20:56 ssuominen Exp $

EAPI=3
PYTHON_DEPEND="2"

inherit autotools eutils

DESCRIPTION="MITM all SSL connections on a LAN and dynamically generates certs"
HOMEPAGE="http://thoughtcrime.org/software/sslsniff/"
SRC_URI="http://thoughtcrime.org/software/sslsniff/${P}.tar.gz"

LICENSE="GPL-3" # plus OpenSSL exception
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/boost:1.46
	dev-libs/log4cpp
	dev-libs/openssl"
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.7-asneeded.patch
	# force boost-1.46
	sed \
		-e 's#-lboost_filesystem#$(libdir)/libboost_filesystem-1_46.so#g' \
		-e 's#-lboost_thread#$(libdir)/libboost_thread-1_46.so#g' \
		-i Makefile.am || die

	echo "AM_CPPFLAGS = -I/usr/include/boost-1_46" >> Makefile.am || die
	eautoreconf
}

src_install() {
	emake DESTDIR="${ED}" install || die
	dodoc AUTHORS README

	insinto /usr/share/sslsniff
	doins leafcert.pem IPSCACLASEA1.crt

	insinto /usr/share/sslsniff/updates
	doins updates/*xml

	insinto /usr/share/sslsniff/certs
	doins certs/*
}
