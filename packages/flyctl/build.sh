TERMUX_PKG_HOMEPAGE=https://fly.io
TERMUX_PKG_DESCRIPTION="Command line tools for fly.io services"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="Yaksh Bariya <yakshbari4@gmail.com>"
TERMUX_PKG_VERSION="0.0.334"
TERMUX_PKG_SRCURL=https://github.com/superfly/flyctl/archive/v$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=884fdb81b741262c59a57118f230a8ae7f8a227f6bcd616208069958b6a17a13
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_BLACKLISTED_ARCHES="i686, arm"


termux_step_post_get_source() {
	termux_setup_golang
	export GOPATH=$TERMUX_PKG_SRCDIR/go
	go get
	chmod +w $GOPATH -R
}

termux_step_make() {
	export GOPATH=$TERMUX_PKG_SRCDIR/go
	go build -o bin/flyctl
}

termux_step_make_install() {
	install -Dm700 -t "$TERMUX_PREFIX"/bin "$TERMUX_PKG_SRCDIR/bin/flyctl"
}
