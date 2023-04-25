# shellcheck shell=sh

os=$(cat "${__global:?}/explorer/os")

if test -s "${__object:?}/parameter/common-name"
then
	common_name=$(cat "${__object:?}/parameter/common-name")
else
	common_name=${__object_id:?}
fi

cert_type=$(cat "${__object:?}/parameter/cert-type")

case ${os}
in
	(devuan|debian)
		easyrsa_bin='/usr/share/easy-rsa/easyrsa' ;;
	(*)
		easyrsa_bin='easyrsa' ;;
esac

easyrsa_base_cmd="${easyrsa_bin} --pki-dir=$(quote "${pki_dir:?}") --vars=$(quote "${pki_dir:?}/vars") --batch"


easyrsa_request_options() (
	while read -r param option
	do
		test -s "${__object:?}/parameter/${param}" || continue

		value=$(head -n 1 "${__object:?}/parameter/${param}")
		printf '%s--%s=%s' "${i:+ }" "${option}" "$(quote "${value}")"
		: $((i+=1))
	done <"${__type:?}/files/param_mapping.txt"
	printf '\n'
)

easyrsa_sign_options() (
	if test -s "${__object:?}/parameter/cert-expiration-days"
	then
		value=$(head -n 1 "${__object:?}/parameter/cert-expiration-days")
		# shellcheck disable=SC2234
		if ! (test $((value > 0)) -gt 0) 2>&-
		then
			printf 'Invalid --cert-expiration-days: %s\n' "${value}" >&2
			printf 'Value must be a positive integer.\n' >&2
			exit 1
		fi

		printf '%s--%s=%s' '' 'days' "$(quote "${value}")"
	fi
	printf '\n'
)

easyrsa_gen_req_cmd() {
	printf '%s --req-cn=%s %s gen-req %s nopass\n' \
		"${easyrsa_base_cmd}" \
		"$(quote "${common_name}")" \
		"$(easyrsa_request_options)" \
		"$(quote "${__object_id:?}")"
}

easyrsa_sign_req_cmd() {
	printf '%s %s sign-req %s %s\n' \
		"${easyrsa_base_cmd}" \
		"$(easyrsa_sign_options)" \
		"${cert_type:?}" \
		"$(quote "${__object_id:?}")"
}

easyrsa_build_cmd() {
	case ${state_is:?}
	in
		(absent)
			easyrsa_gen_req_cmd
			easyrsa_sign_req_cmd
			;;
		(unsigned)
			easyrsa_sign_req_cmd
			;;
	esac
}

easyrsa_update_db_cmd() {
	printf '%s update-db\n' "${easyrsa_base_cmd}"
}

easyrsa_renew_cmd() {
	printf '%s %s %s renew %s nopass\n' \
		"${easyrsa_base_cmd}" \
		"$(easyrsa_request_options)" \
		"$(easyrsa_sign_options)" \
		"${__object_id:?}"
}

easyrsa_revoke_cmd() {
	printf '%s revoke %s \n' "${easyrsa_base_cmd}" "$(quote "${__object_id:?}")"
	printf '%s gen-crl\n' "${easyrsa_base_cmd}"
}
