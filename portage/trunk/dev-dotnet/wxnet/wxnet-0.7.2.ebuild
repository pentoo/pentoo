# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils wxwidgets mono

DESCRIPTION="wxWidgets bindings for mono"
HOMEPAGE="http://wxnet.sf.net/"
SRC_URI="mirror://sourceforge/${PN}/wx.NET-${PV}-Source.tar.gz"

LICENSE="wxWinLL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="doc examples utils unicode"
RDEPEND=">=x11-libs/wxGTK-2.6.1"
DEPEND=">=dev-lang/mono-1.0.4-r1
	dev-lang/perl
	dev-util/premake"

S="${WORKDIR}/wx.NET-${PV}"

pkg_setup() {
	export WX_GTK_VER="2.6"

	# This would need a bit of tweaking or do we want to force gtk2-unicode version?
	need-wxwidgets unicode || die "Emerge wxGTK with unicode in USE"
}

src_unpack() {
	unpack ${A} || die "Unpacking the source failed"

	epatch "${FILESDIR}"/premake.patch
	epatch "${FILESDIR}"/premake.lua.patch

	# Call this conditonally only when arch is amd64?
	if use amd64;then
		 epatch "${FILESDIR}"/fpic.patch
	fi

	cd "${S}"/Build/Linux || die "Could not change directory"
	cp Defs.in.template Defs.in
	epatch "${FILESDIR}"/Defs.in.patch

	cd "${S}"/Build/Common || die "Could not change directory"
	epatch "${FILESDIR}"/wx-config-helper.patch
}

src_compile() {
	cd "${S}"/Build/Linux

	# Just satisfy the stupid wx-config-helper script
	mkdir -p "${S}"/wx/lib/wx/config

	cp ${WX_CONFIG} "${S}"/wx/lib/wx/config/ || \
		die "Could not copy wx-config file"

	export CONFIG="Release"
	emake wxnet-core || die "make wxnet-core failed"
	if use utils;then
		emake wxnet-utils || die "make wxnet-utils failed"
	fi
	if use examples; then
		emake wxnet-samples || die "make wxnet-samples failed"
	fi
}

src_install() {
	dolib Bin/libwx-c.so Bin/*dll

	if use utils; then
		exeinto /usr/bin
		doexe Bin/towxnet.exe
	fi
	# I delete the file so I can glob the samples
	rm "${S}"/Bin/towxnet.exe

	if use examples; then
		exeinto /usr/share/doc/${PF}/Samples
		doexe Bin/*.exe
	fi

	if use doc; then
		dodoc Bin/README.txt
		dohtml "${S}"/Docs/Manual/*
	fi
}
