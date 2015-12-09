is_true () {
	egrep -qi 'on|true|yes'
}

is_false () {
	egrep -qi 'off|false|no'
}

info () {
	echo "[i] $*" >&2
}

warn () {
	echo "[w] $*" >&2
}

err () {
	echo "[!] $*" >&2
}

fatal () {
	err "$@"
	exit 1
}

