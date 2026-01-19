# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::launchdarkly::deps()
#
#>
######################################################################
p6df::modules::launchdarkly::deps() {
  ModuleDeps=()
}

######################################################################
#<
#
# Function: p6df::modules::launchdarkly::vscodes()
#
#>
######################################################################
p6df::modules::launchdarkly::vscodes() {

         code --install-extension LaunchDarklyOfficial.launchdarkly

         p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::launchdarkly::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::launchdarkly::init () {
	local _module="$1"
	local dir="$2"

	p6_bootstrap "$dir"

	p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::launchdarkly::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 LAUNCHDARKLY_API_KEY LAUNCHDARKLY_SDK_KEY P6_DFZ_PROFILE_LAUNCHDARKLY P6_LD_ENV P6_LD_PROJECT
#>
######################################################################
p6df::modules::launchdarkly::prompt::mod() {

  local str
  if ! p6_string_blank "$P6_DFZ_PROFILE_LAUNCHDARKLY"; then
    str="launchdarkly:\t  $P6_DFZ_PROFILE_LAUNCHDARKLY:"
    if ! p6_string_blank "$P6_LD_PROJECT"; then
      str=$(p6_string_append "$str" "$P6_LD_PROJECT" " ")
    fi
    if ! p6_string_blank "$P6_LD_ENV"; then
      str=$(p6_string_append "$str" "$P6_LD_ENV" "/")
    fi
    if ! p6_string_blank "$LAUNCHDARKLY_API_KEY"; then
      str=$(p6_string_append "$str" "api" "/")
    fi
    if ! p6_string_blank "$LAUNCHDARKLY_SDK_KEY"; then
      str=$(p6_string_append "$str" "sdk" "/")
    fi
  fi

  p6_return_str "$str"
}
