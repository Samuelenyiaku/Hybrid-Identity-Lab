# Build Guide

Follow these milestones in order. Each phase includes a status and validation target. Do not mark an integration complete until the test result is recorded.

## At a glance

1. VirtualBox foundation — prepared
2. Active Directory + DNS — configured; key checks observed
3. Microsoft Entra ID — initial tenant and cloud objects created
4. Microsoft Entra Connect Sync — wizard configured; end-to-end validation pending
5. KDS / gMSA — readiness and validation pending
6. Okta SSO — planned

## Milestone 1 — VirtualBox foundation

**Status: Prepared (reported).**

- [x] Windows Server virtual machines installed
- [x] Lab snapshots created
- [ ] Record VM names, OS versions, memory, CPU, and network mode
- [ ] Capture sanitized VM inventory and network settings
- [ ] Confirm rollback snapshot before high-impact changes

## Milestone 2 — Active Directory and DNS

**Status: Core setup complete; further evidence recommended.**

- [x] AD DS domain `skrillsam.org` configured on Windows Server 2019 `DC01`
- [x] On-premises test identities created
- [x] `CLIENT01` joined to domain
- [x] PowerShell domain membership `PartOfDomain = True` observed
- [x] Successful client secure-channel validation observed
- [x] DNS zone and lab records inspected

Known lab addresses: DC01 `192.168.56.10`; CLIENT01 `192.168.56.20`.

**Suggested evidence checks**

On DC01 (elevated PowerShell):
```powershell
Get-ADDomain
Get-ADForest
Get-Service DNS, NTDS, Netlogon
dcdiag /test:dns /v
```

On CLIENT01:
```powershell
ipconfig /all
nslookup skrillsam.org
nltest /dsgetdc:skrillsam.org
Test-ComputerSecureChannel -Verbose
(Get-CimInstance Win32_ComputerSystem).PartOfDomain
```

Record outputs with sensitive identifiers redacted. Test with a dedicated standard user where appropriate.

## Milestone 3 — Microsoft Entra ID

**Status: Initial tenant access and cloud objects created.**

- [x] Accessed the Entra ID Free lab tenant
- [x] Created cloud-only test identity `Lab Cloud User`
- [x] Created cloud security group `SG-Cloud-Lab-Users`
- [ ] Confirm correct directory/tenant before administrative changes
- [ ] Review administrator authentication and recovery practices
- [ ] Capture sanitized tenant, user, and group evidence
- [ ] Confirm relevant licensing and supported prerequisites

Cloud-only objects are not synchronized from on-premises AD. Keep identity origins distinct until a synced pilot is confirmed.

## Milestone 4 — Microsoft Entra Connect Sync

**Status: Configured; operational and end-to-end validation pending.**

On October 21, 2026, the configuration wizard reported success and that synchronization was initiated. The wizard displayed password hash synchronization and `mS-DS-ConsistencyGuid` as the source anchor.

### Next: validate in this order

1. **Review sync scope first.** One wizard screen showed “Synchronize all users and devices” selected. Confirm exactly what is in scope. For a learning lab, use an intentionally limited pilot scope where supported and appropriate.
2. Confirm the correct forest and tenant connectors.
3. Check the Microsoft Entra Connect Sync service and scheduler.
4. Inspect Synchronization Service Manager connector import, sync, and export results. Note any errors without exposing account secrets.
5. Trigger or inspect an initial sync cycle following the applicable product guidance.
6. Verify one known on-premises pilot identity appears in Entra ID with expected source and attributes.
7. Document actual outcomes, errors, recovery/rollback, and sanitized evidence.

**Completion gate:** do not claim hybrid identity synchronization is validated until sync health and the pilot identity are both verified. Wizard success alone is insufficient.

## Milestone 5 — KDS root key and gMSA

**Status: In progress.**

- [ ] Check existing root-key state
- [ ] Understand key readiness/safety interval before relying on it
- [ ] Create a dedicated test gMSA if needed
- [ ] Validate from an authorized host
- [ ] Record sanitized output and troubleshooting

See [KDS/gMSA readiness guide](kds-gmsa-readiness.md).

## Milestone 6 — Okta SSO

**Status: Planned.**

- [ ] Choose a non-production application
- [ ] Document target identity and sign-in flow
- [ ] Select and document protocol
- [ ] Configure integration and test successful and denied sign-ins
- [ ] Record results, limitations, and sanitized evidence

Never commit app secrets, signing keys, or recovery codes.

## Milestone 7 — Portfolio polish

- [ ] Upload screenshots under `screenshots/` and verify the images load
- [ ] Link milestone evidence from README and relevant docs
- [ ] Add expected and observed results for each completed validation
- [ ] Verify internal links and diagrams render
- [ ] Scan for secrets before publishing
- [ ] Update roadmap and session log at each milestone
