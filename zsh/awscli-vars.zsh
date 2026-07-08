#
# Defines awscli functions.
#
# Authors:
#   Eric Czarny <eczarny@gmail.com>
#

# Skip (cleanly) if requirements are not found. A non-zero return here makes
# zplug report the whole ~/.zsh local repo as "failed to load".
if (( ! $+commands[aws] )); then
  return 0
fi

function export_aws_credentials() {
  profile="${1:-default}"
  export AWS_ACCESS_KEY_ID=`aws configure get aws_access_key_id --profile $profile`
  export AWS_SECRET_ACCESS_KEY=`aws configure get aws_secret_access_key --profile $profile`
}
