######################################################################
#<
#
# Function: stream  = p6df::modules::launchdarkly::auditlog::for(flag, [project=$P6_LD_PROJECTt], [env=$P6_LD_ENV], [api_token=$LAUNCH_DARKLY_API_TOKEN])
#
#  Args:
#	flag -
#	OPTIONAL project - [$P6_LD_PROJECTt]
#	OPTIONAL env - [$P6_LD_ENV]
#	OPTIONAL api_token - [$LAUNCH_DARKLY_API_TOKEN]
#
#  Returns:
#	stream - 
#
#  Environment:	 LAUNCH_DARKLY_API_TOKEN P6_LD_ENV P6_LD_PROJECT
#>
######################################################################
p6df::modules::launchdarkly::auditlog::for() {
  local flag="$1"
  local project="${2:-$P6_LD_PROJECT}"
  local env="${3:-$P6_LD_ENV}"
  local api_key="${4:-$LAUNCHDARKLY_API_KEY}"

  p6_launchdarkly_auditlog_for "$flag" "$project" "$env" "$api_key"

  p6_return_stream
}

######################################################################
#<
#
# Function: stream  = p6_launch_darkly_auditlog_for(flag, project, env, api_token)
#
#  Args:
#	flag -
#	project -
#	env -
#	api_token -
#
#  Returns:
#	stream - 
#
#  Environment:	 MPOSIX
#>
######################################################################
p6_launchdarkly_auditlog_for() {
  local flag="$1"
  local project="$2"
  local env="$3"
  local api_key="$4"

       #--location https://app.launchdarkly.com/api/v2/auditlog?spec=proj%2Fdefault%3Aenv%2Fproduction%3Aflag/foo
  curl -s \
	--location "https://app.launchdarkly.com/api/v2/auditlog?spec=proj%2F{$project}%3Aenv%2F${env}%3Aflag/${flag}"  \
	--header "authorization: $api_key" | \
	jq -r '.items[] | "\(.date)\t\(.title)"' | \
	perl -MPOSIX -pe 'if (/(\d+)/) { $t = $1 / 1000; s/\d+/strftime("%Y-%m-%d %H:%M:%S %Z", localtime($t))/e }'

  p6_return_stream
}