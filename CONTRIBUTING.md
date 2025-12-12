# Contributing to Wild Blue platform administration scripts 🖥️

## Conventions

- Script arguments are immediately assigned names, for clarity, e.g. `VARIABLE=$1`
- Prefer to perform modifications as a super user, rather than a root or system user
- Scripts intended to be run (by a super user) via a privilege escalation mechanism, e.g. `sudo`, are prefixed like `root.SCRIPT.sh` or `system.SCRIPT.ps1`
- Complex scripts may have their own directories, with `/config`, `/lib`, and `/state` sub-directories

## Ubuntu conventions

- Operate from: Absolute directories (typically admin user home)
- Operate on: Own state and system state, via absolute directories and other mechanisms
- Assume system ownership, i.e. precedence over other configurations
- Assume Bash + Ubuntu environment (for now)
- Flags `-e` and `-a` are always set, except during early execution and explicit exceptions, e.g. `set +a; UNEXPORTED_VAR=value; set -a`
- Idempotent/repeatable operations are preferred, otherwise completed operations must be remembered to prevent repetition
- Existing configurations and state are backed up before modification, with suffix `.backup`
- Minimal permissions are the default for sensitive files (`600`) and all directories (`700`)
- Crypto-quality secrets are the default for automated or infrequent, manual processes
- Password-like secrets are the default for frequent, manual processes