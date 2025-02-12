# This script is intended to be `source`, as it allows referencing aliases,
# functions, and commands based on `PATH` in the actual shell environment.
# However, this is not necessary if `GXX_NO_OVERRIDE` is not enabled.

for alias in $(git config --name-only --get-regexp 'alias' | cut -d'.' -f2); do
	alias_cmd="alias g${alias}=\"git ${alias}\""

	if [[ "${GXX_NO_OVERRIDE}" == true ]] && type "g${alias}" >/dev/null 2>&1; then
		if [[ "${GXX_VERBOSE}" == true ]]; then
			reason="$(type "g${alias}" | head -n1)"
			echo "#${alias_cmd} # ${reason}"
		fi
		continue
	fi

	echo "${alias_cmd}"
done

unset alias
unset alias_cmd
unset reason
