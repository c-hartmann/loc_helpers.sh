#! /usr/bin/env bash
# get_strings.sh
# get translations for a string of <id>

_echo_exit ()
{
	printf '%s' "$*" >&2
	exit 1
}

test $# -ge 2 || _echo_exit "usage: $0 <appid> <query> [<template>]"

appid=$1
query=$2
tmplt=${3:-'%s %s\n'}

# tranlations are in:
locale_base_dir='/usr/share/locale'

# get a list of all locales therein
_all_locales ()
{
	cd $locale_base_dir
	echo *
}

# store all locales inside a simple indexed array
declare all_locales=( $(_all_locales) )

# this is what an (decompiled) german entry as for dolphin Reload looks like
#
# msgid "Reload"
# msgstr "Aktualisieren"
#

_main ()
{
	for loc in ${all_locales[*]}; do

		mo="$locale_base_dir/$loc/LC_MESSAGES/${appid}.mo"
		if [[ -r "${mo}" ]]; then
			msgstr_line=$(msgunfmt "${mo}" | grep -A1 "${query}" | tail -1)
			msgstr="${msgstr_line#"msgstr "}"
			msgstr="${msgstr//\"}"
			printf "${tmplt}" "${loc}" "${msgstr}"
		else
			: # ignore that silent. just too many of these
		fi

	done
}

_main
