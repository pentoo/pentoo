subarch: amd64
version_stamp: 2012.0
target: livecd-stage1
rel_type: default
profile: default/linux/amd64/10.0
snapshot: 20120515
source_subpath: default/stage4-amd64-2012.0
portage_confdir: /usr/src/pentoo/livecd/trunk/portage
portage_overlay: /usr/src/pentoo/portage/trunk
cflags: -Os -mtune=nocona -pipe
cxxflags: -Os -mtune=nocona -pipe

# This allows the optional directory containing the output packages for
# catalyst.  Mainly used as a way for different spec files to access the same
# cache directory.  Default behavior is for this location to be autogenerated
# by catalyst based on the spec file.
# example:
# pkgcache_path: /tmp/packages
pkgcache_path: /mnt/storage/catalyst/tmp/packages

livecd/use: aufs X livecd gtk -kde -eds gtk2 cairo pam firefox gpm dvdr oss
mmx sse sse2 mpi wps offensive dwm -doc -examples
wifi injection lzma speed gnuplot pyx test-programs fwcutter qemu
-quicktime -qt -qt3 qt3support qt4 -webkit -cups -spell lua curl -dso
png jpeg gif dri svg aac nsplugin xrandr consolekit -ffmpeg fontconfig
alsa esd gstreamer jack mp3 vorbis wavpack wma
dvd mpeg ogg rtsp x264 xvid sqlite truetype nss
opengl dbus binary-drivers hal acpi usb subversion libkms
analyzer bluetooth cracking databse exploit forensics mitm proxies
scanner rce footprint forging fuzzers voip wireless pentoo
-stage2

# This is the set of packages that we will merge into the CD's filesystem.  They
# will be built with the USE flags configured above.  These packages must not
# depend on a configured kernel.  If the package requires a configured kernel,
# then it will be defined elsewhere.
# example:
livecd/packages:
pentoo/pentoo
