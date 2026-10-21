# Build Guide

This guide is organized as small milestones. Check off a step only after completing it and recording evidence.

## Milestone 1 — VirtualBox foundation

Reported complete:
- [x] Windows Server virtual machines installed.
- [x] Lab snapshots created.

Validation to keep on file:
- [ ] Record VM names, OS versions, memory, CPU, and virtual network mode.
- [ ] Capture a sanitized screenshot of the VM inventory.
- [ ] Confirm a clean snapshot exists before major changes.

## Milestone 2 — Active Directory

Reported complete:
- [x] AD domain configured as `skrillsam.org`.
- [x] Test identities created in on-premises AD.
- [x] Windows client joined to the domain.
- [x] Client domain-membership and secure-channel validation observed as successful.
- [x] DNS zone and lab records inspected.

Validation to retain:
- [ ] On the DC, run `Get-ADDomain`, `Get-ADForest`, and `dcdiag /test:dns /v`.
- [ ] On the client, run `nltest /dsgetdc:skrillsam.org`.
- [ ] Sign in using a dedicated standard test account.
- [ ] Capture AD Users and Computers and successful validation output with sensitive details redacted.

Known lab network values:
- Domain controller: `DC01`, Windows Server 2019, host-only address `192.168.56.10`.
- Windows client: `CLIENT01`, host-only address `192.168.56.20`.
- Domain: `skrillsam.org`.

## Milestone 3 — Microsoft Entra ID

**Status: Initial tenant and cloud objects created; hardening and evidence capture remain.**

Completed:
- [x] Accessed a Microsoft Entra ID Free tenant for lab work.
- [x] Created cloud-only test identity `Lab Cloud User`.
- [x] Created cloud security group `SG-Cloud-Lab-Users`.

Next steps:
1. Confirm the correct directory is selected in the Entra portal before making changes.
2. Review administrator access and recovery methods; keep recovery details outside Git.
3. Enable strong authentication for administrative identities where available.
4. Capture sanitized screenshots of the tenant context, cloud-only user, and group.
5. Confirm current licensing and supported prerequisites before selecting a synchronization method.

A cloud-only user or group is not synchronized from on-premises AD. Keep the local and cloud identities clearly distinguished until synchronization is configured and validated.

## Milestone 4 — Hybrid identity

**Current status: Connect Sync configuration wizard completed; end-to-end validation pending.** The wizard reported successful configuration and that synchronization was initiated. The displayed options included password hash synchronization and `mS-DS-ConsistencyGuid` as the source anchor.

Next validation steps:
- [ ] Confirm the correct tenant and forest connectors are configured.
- [ ] Check the Microsoft Entra Connect Sync service and scheduler state.
- [ ] Review Synchronization Service Manager / connector status for import, sync, and export errors.
- [ ] Confirm the intended pilot OU/user scope is correct. If the wizard was configured to synchronize all users and devices, review and narrow the scope before treating the lab as production-like.
- [ ] Trigger or inspect an initial synchronization cycle.
- [ ] Verify a known on-premises test identity appears in Entra ID and check its source/attributes.
- [ ] Document the actual observed result and any remediation.
- [ ] Capture sanitized screenshots of service health and successful pilot identity validation.

Do not claim end-to-end hybrid identity is working based only on the wizard's success message. Keep the initial sync scope small and intentional.

## Milestone 5 — Okta SSO

**Status: Planned.**

- [ ] Choose a test application and document its supported SSO protocol.
- [ ] Decide and diagram the intended relationship between Entra ID, Okta, and the application.
- [ ] Configure the application integration in a non-production environment.
- [ ] Test a permitted sign-in and a denied sign-in.
- [ ] Record the result, troubleshooting steps, and sanitized evidence.
- [ ] Never add client secrets, signing keys, or recovery codes to Git.

## Milestone 6 — Portfolio finish

- [ ] Add screenshots under `screenshots/`, grouped by milestone.
- [ ] Add exact validation steps and observed outputs to each lab.
- [ ] Update the status table in the README when evidence supports a status change.
- [ ] Review the repository for secrets before every public commit.
- [ ] Verify README links and Mermaid diagrams render on GitHub.
