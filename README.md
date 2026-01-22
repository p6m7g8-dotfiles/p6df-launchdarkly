# P6's POSIX.2: p6df-launchdarkly

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

TODO: Add a short summary of this module.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-launchdarkly

##### p6df-launchdarkly/init.zsh

- `p6df::modules::launchdarkly::deps()`
- `p6df::modules::launchdarkly::init(_module, dir)`
- `p6df::modules::launchdarkly::profile::off()`
- `p6df::modules::launchdarkly::profile::on(profile, [project=], [env=], [api_key=], [sdk_key=])`
- `p6df::modules::launchdarkly::vscodes()`
- `str str = p6df::modules::launchdarkly::prompt::mod()`

#### p6df-launchdarkly/lib

##### p6df-launchdarkly/lib/auditlog.sh

- `stream  = p6_launchdarkly_auditlog_for(flag, project, env, api_key)`
- `stream  = p6df::modules::launchdarkly::auditlog::for(flag, [project=$P6_LD_PROJECT], [env=$P6_LD_ENV], [api_key=$LAUNCHDARKLY_API_KEY])`

## Hierarchy

```text
.
├── init.zsh
├── lib
│   └── auditlog.sh
└── README.md

2 directories, 3 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
