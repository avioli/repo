#/usr/bin/env bash
_repo_url_completions()
{
	local CUR=${COMP_WORDS[COMP_CWORD]}
	local PREV=${COMP_WORDS[COMP_CWORD-1]}

	case "$PREV" in
	"clone" | "get-url")
		local NAMES=$(repo list)
		COMPREPLY=($(compgen -W "$NAMES" -- "$CUR"))
		;;
	"list")
		COMPREPLY=()
		;;
	*)
		COMPREPLY=($(compgen -W "list clone get-url" -- "$CUR"))
		;;
	esac
}

complete -F _repo_url_completions repo
