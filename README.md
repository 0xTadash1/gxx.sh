# gxx.sh

> Sets shell aliases based on the aliases in git config.
> For example, if `l` is set as an alias for git `log`, a shell alias `gl` will be created.

## Usage

This script does not actually define any aliases. It outputs a list of alias commands for `eval`.

Therefore, use it as follows:

```sh
eval "$(source ./path/to/gxx.sh)"
```

Or, if you want to configure it using the environment variables mentioned later:

```sh
eval "$(GXX_NO_OVERRIDE=true source ./path/to/gxx.sh)"
```

## Environment Variables

### `GXX_NO_OVERRIDE`

(Default: unset)

If set to `true`, existing commands, functions, and aliases will not be overridden.

For example, when running `gxx`, if a command named `gc` already exists, the alias `gc` will not be created.

### `GXX_VERBOSE`

(Default: unset)

If set to `true`, skipped aliases and their reasons will be printed as shell comments when `GXX_NO_OVERRIDE` is `true`.

This is useful for reviewing before `eval`. This setting has no effect if `GXX_NO_OVERRIDE` is disabled.
