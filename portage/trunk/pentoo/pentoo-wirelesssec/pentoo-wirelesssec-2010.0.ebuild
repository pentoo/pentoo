# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
KEYWORDS="-*"
DESCRIPTION="Pentoo wireless meta ebuild"
HOMEPAGE="http://www.pentoo.ch"
SLOT="0"
LICENSE="GPL"
IUSE=""

DEPEND=""

RDEPEND="${DEPEND}
	app-crypt/asleap
	net-misc/karma
	net-wireless/gerix
	=net-dialup/freeradius-2.1.7[wpe]
	net-wireless/aircrack-ng
	net-wireless/airoscript
	net-wireless/airpwn
	net-wireless/b43-openfwwf
	net-wireless/broadcom-firmware-downloader
	x86? ( net-wireless/intel-wimax-network-service )
	net-wireless/karmetasploit
	net-wireless/kismet
	net-wireless/mdk
	net-wireless/rfkill
	net-wireless/spectools
	net-wireless/wepattack
	net-wireless/wepdecrypt
	net-wireless/wifi-radar
	net-wireless/wifitap
	net-wireless/wireless-tools
	net-wireless/wpa_supplicant
	net-wireless/cowpatty
	net-wireless/crda
	net-wireless/hostapd
	net-wireless/haraldscan"
	#net-wireless/wifiscanner

