# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::launchdarkly::deps()
#
#>
######################################################################
p6df::modules::launchdarkly::deps() {
  ModuleDeps=(
	  p6m7g8-dotfiles/p6df-ruby
	  p6m7g8-dotfiles/p6df-python
  )
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
# Function: str str = p6df::modules::launchdarkly::prompt::line()
#
#  Returns:
#	str - str
#
#  Environment:	 LAUNCHDARKLY_API_KEY LAUNCHDARKLY_SDK_KEY P6_LD_PROJECT
#>
######################################################################
p6df::modules::launchdarkly::prompt::line() {

  local str="launchdarkly:     $P6_LD_PROJECT/$P6_LD_ENV"
  if ! p6_string_blank "$LAUNCHDARKLY_API_KEY"; then
    str="$str [api]"
  fi
  if ! p6_string_blank "$LAUNCHDARKLY_SDK_KEY"; then
    str="$str [sdk]"
  fi

  p6_return_str "$str"
}
