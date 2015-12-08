is_true () {
	egrep -qi 'on|true|yes'
}

is_false () {
	egrep -qi 'off|false|no'
}
