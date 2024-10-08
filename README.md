# P6's POSIX.2: p6df-launchdarkly

## Table of Contents

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)
[![Mergify](https://img.shields.io/endpoint.svg?url=https://gh.mergify.io/badges//p6df-launchdarkly/&style=flat)](https://mergify.io)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](<https://gitpod.io/#https://github.com//p6df-launchdarkly>)

## Summary

## Contributing

- [How to Contribute](<https://github.com//.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com//.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

### Functions

## p6df-launchdarkly

### p6df-launchdarkly/init.zsh

- p6df::modules::launchdarkly::deps()
- p6df::modules::launchdarkly::init(_module, dir)
- p6df::modules::launchdarkly::vscodes()
- str str = p6df::modules::launchdarkly::prompt::line()

## p6df-launchdarkly/lib

### p6df-launchdarkly/lib/auditlog.sh

- stream  = p6_launchdarkly_auditlog_for(flag, project, env, api_key)
- stream  = p6df::modules::launchdarkly::auditlog::for(flag, [project=$P6_LD_PROJECT], [env=$P6_LD_ENV], [api_key=$LAUNCHDARKLY_API_KEY])

## Hierarchy

```text
.
├── README.md
├── init.zsh
└── lib
    └── auditlog.sh

2 directories, 3 files
```

## Author

Philip M . Gollucci <pgollucci@p6m7g8.com>
