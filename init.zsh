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

         p6df::modules::vscode::extension::install LaunchDarklyOfficial.launchdarkly

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
  if p6_string_blank_NOT "$P6_DFZ_PROFILE_LAUNCHDARKLY"; then
    if p6_string_blank_NOT "$P6_LD_PROJECT"; then
      str="launchdarkly:\t  $P6_DFZ_PROFILE_LAUNCHDARKLY:"
      str=$(p6_string_append "$str" "$P6_LD_PROJECT" " ")
    fi
    if p6_string_blank_NOT "$P6_LD_ENV"; then
      str=$(p6_string_append "$str" "$P6_LD_ENV" "/")
    fi
    if p6_string_blank_NOT "$LAUNCHDARKLY_API_KEY"; then
      str=$(p6_string_append "$str" "api" "/")
    fi
    if p6_string_blank_NOT "$LAUNCHDARKLY_SDK_KEY"; then
      str=$(p6_string_append "$str" "sdk" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::launchdarkly::profile::on(profile, project, env, [api_key=], [sdk_key=])
#
#  Args:
#	profile -
#	project -
#	env -
#	OPTIONAL api_key - []
#	OPTIONAL sdk_key - []
#
#  Environment:	 LAUNCHDARKLY_API_KEY LAUNCHDARKLY_SDK_KEY P6_DFZ_PROFILE_LAUNCHDARKLY P6_LD_ENV P6_LD_PROJECT
#>
######################################################################
p6df::modules::launchdarkly::profile::on() {
  local profile="$1"
  local env="$2"

  p6_run_code "$env"

  p6_env_export "P6_DFZ_PROFILE_LAUNCHDARKLY" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::launchdarkly::profile::off()
#
#  Environment:	 LAUNCHDARKLY_API_KEY LAUNCHDARKLY_SDK_KEY P6_DFZ_PROFILE_LAUNCHDARKLY P6_LD_ENV P6_LD_PROJECT
#>
######################################################################
p6df::modules::launchdarkly::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_LAUNCHDARKLY
  p6_env_export_un P6_LD_PROJECT
  p6_env_export_un P6_LD_ENV
  p6_env_export_un LAUNCHDARKLY_API_KEY
  p6_env_export_un LAUNCHDARKLY_SDK_KEY

  p6_return_void
}
