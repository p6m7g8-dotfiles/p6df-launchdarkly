# shellcheck shell=bash
######################################################################
p6df::modules::launchdarkly::deps() {
  ModuleDeps=(p6m7g8-dotfiles/p6common)
}

######################################################################
p6df::modules::launchdarkly::external::brews() {

  p6df::core::homebrew::cmd::brew tap launchdarkly/homebrew-tap
  p6df::core::homebrew::cmd::brew install ldcli

  p6_return_void
}

######################################################################
p6df::modules::launchdarkly::mcp() {

  p6_js_npm_global_install "@launchdarkly/mcp-server"

  p6df::modules::anthropic::mcp::server::add "launchdarkly" "npx" "-y" "@launchdarkly/mcp-server"
  p6df::modules::openai::mcp::server::add "launchdarkly" "npx" "-y" "@launchdarkly/mcp-server"

  p6_return_void
}

######################################################################
p6df::modules::launchdarkly::vscodes() {

         p6df::modules::vscode::extension::install LaunchDarklyOfficial.launchdarkly

         p6_return_void
}

######################################################################
p6df::modules::launchdarkly::profile::mod() {

  local str
  if p6_string_blank_NOT "$P6_LD_PROJECT"; then
    str="$(p6_string_space_pad "launchdarkly:" 16)$P6_LD_PROJECT"
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

  p6_return_str "$str"
}
######################################################################
#<
#
# Function: p6df::modules::launchdarkly::deps()
#
#>
######################################################################
#<
#
# Function: p6df::modules::launchdarkly::external::brews()
#
#>
######################################################################
#<
#
# Function: p6df::modules::launchdarkly::vscodes()
#
#>
######################################################################
#<
#
# Function: p6df::modules::launchdarkly::mcp()
#
#>
######################################################################
#<
#
# Function: words launchdarkly $LAUNCHDARKLY_API_KEY = p6df::modules::launchdarkly::profile::mod()
#
#  Returns:
#	words - launchdarkly $LAUNCHDARKLY_API_KEY
#
#  Environment:	 LAUNCHDARKLY_API_KEY
#>
