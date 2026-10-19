# Scripts

PowerShell validation scripts will live in this directory. Scripts should be read-only by default, include comments explaining each check, and return clear pass/fail results where practical.

Planned additions:
- Active Directory / DNS health checks
- Domain-joined client checks
- Hybrid synchronization status checks
- Repository secret-review helper

Review every script before running it with elevated privileges. Do not store credentials in scripts or commit real secrets. The initial validation commands are documented in [the network design guide](../docs/network-design.md).
