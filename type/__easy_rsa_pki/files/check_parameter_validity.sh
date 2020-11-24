#!/bin/sh

fail_parameter_value() {
    printf 'Unsupported parameter for "%s": %s\n' "$1" "$2" >&2
    exit 1

}

matches() {
   # $1 value
   # $2 pattern
   value="$1"
   regex_allowed_values="$2"
   if echo "${value}" | grep -E "${regex_allowed_values}"; then
      return 0
   else
      return 1
   fi
}

# check_parameter() {
#    # $1 parameter-name supplied to cdist
#    # $2 regex accepting parameter values
#    parameter_name="$1"
#    regex_allowed_values="$2"
#    is_supplied=$(test -f "${__object:?}/parameter/${parameter_name}" && echo yes || echo no)
#    if [ "${is_supplied}" = "yes" ]; then
#       supplied_value=$(cat "${__object:?}/parameter/${parameter_name}")
#       if ! matches "${supplied_value}" "${regex_allowed_values}"; then
#          fail_parameter_value "${parameter_name}" "${supplied_value}"
#       fi
#    fi
# }
# 
# check_parameter_validity_digest() {
#    check_parameter "digest" "md5|sha1|sha256|sha224|sha384|sha512"
# }
# 
# check_parameter_validity_usealgo(){
#    check_parameter "use-algo" "rsa|ec"
# }
# 
# check_parameter_validity_dnmode(){
#    check_parameter "dn-mode" "cn_only|org"
# }

check_parameter_validity_digest() {
parameter_name="digest"
if [ -f "${__object:?}/parameter/${parameter_name}" ]; then
   supplied_value=$(cat "${__object:?}/parameter/${parameter_name}")
   case ${supplied_value} in
      (md5|sha1|sha256|sha224|sha384|sha512)
      ;; # ok
      (*)
         fail_parameter_value "${parameter_name}" "${supplied_value}"
      ;;
   esac
fi
}

check_parameter_validity_usealgo(){
parameter_name="use-algo"
if [ -f "${__object:?}/parameter/${parameter_name}" ]; then
   supplied_value=$(cat "${__object:?}/parameter/${parameter_name}")
   case ${supplied_value} in
      (rsa|ec)
      ;; # ok
      (*)
         fail_parameter_value "${parameter_name}" "${supplied_value}"
      ;;
   esac
fi

}
check_parameter_validity_dnmode(){
parameter_name="dn-mode"
if [ -f "${__object:?}/parameter/${parameter_name}" ]; then
   supplied_value=$(cat "${__object:?}/parameter/${parameter_name}")
   case ${supplied_value} in
      (cn_only|org)
      ;; # ok
      (*)
         fail_parameter_value "${parameter_name}" "${supplied_value}"
      ;;
   esac
fi
}

