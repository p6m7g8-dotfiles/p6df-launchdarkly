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
# Function: p6df::modules::launchdarkly::external::brews()
#
#>
######################################################################
p6df::modules::launchdarkly::external::brews() {

  p6df::core::homebrew::cmd::brew tap launchdarkly/homebrew-tap
  p6df::core::homebrew::cmd::brew install ldcli

  p6_return_void
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
# Function: p6df::modules::launchdarkly::mcp()
#
#>
######################################################################
p6df::modules::launchdarkly::mcp() {

  p6_js_npm_global_install "@launchdarkly/mcp-server"

  p6df::modules::anthropic::mcp::server::add "launchdarkly" "npx" "-y" "@launchdarkly/mcp-server"
  p6df::modules::openai::mcp::server::add "launchdarkly" "npx" "-y" "@launchdarkly/mcp-server"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::launchdarkly::profile::on(profile, code)
#
#  Args:
#	profile -
#	code -
#
#  Environment:	 P6_DFZ_PROFILE_LAUNCHDARKLY
#>
######################################################################
p6df::modules::launchdarkly::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_LAUNCHDARKLY" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::launchdarkly::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 LAUNCHDARKLY_API_KEY LAUNCHDARKLY_SDK_KEY P6_DFZ_PROFILE_LAUNCHDARKLY P6_LD_ENV P6_LD_PROJECT
#>
######################################################################
p6df::modules::launchdarkly::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_LAUNCHDARKLY

  p6_return_void
}
