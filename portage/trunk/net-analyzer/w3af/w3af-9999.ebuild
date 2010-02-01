# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion

DESCRIPTION="Web Application Attack and Audit Framework"
HOMEPAGE="http://w3af.sourceforge.net/"
ESVN_REPO_URI="https://w3af.svn.sourceforge.net/svnroot/w3af/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/fpconst-0.7.2
	 dev-python/pygoogle
	 dev-python/pyPdf
	 dev-python/utidylib
	 dev-python/soappy
	 dev-python/beautifulsoup
	 dev-python/pyopenssl
	 net-analyzer/scapy"

src_compile() {
	einfo "Nothing to compile"
}

src_install() {
	dodir /usr/lib/
	# should be as simple as copying everything into the target...
	cp -pPR "${S}" "${D}"usr/lib/w3af || die
	dobin "${FILESDIR}"/w3af_gui
	dobin "${FILESDIR}"/w3af_console
	chown -R root:0 "${D}"
}
