# Lab Session Log

This log records verified or directly observed milestones. Update it after meaningful lab accomplishments, and keep incomplete integrations explicitly marked as incomplete.

## October 21, 2026 — Microsoft Entra ID setup

### Completed
- Accessed the Microsoft Entra ID Free tenant used for lab practice.
- Created the cloud-only test user `Lab Cloud User`.
- Created the cloud security group `SG-Cloud-Lab-Users`.

### Observed troubleshooting result
- Opened the Entra Cloud Sync Agents area.
- The page returned **No results**.
- No provisioning/synchronization agent is installed at this point.

### Current interpretation
- Cloud identity object creation is working.
- Hybrid identity synchronization is **not configured or validated**.
- Do not describe the cloud-only test user as synced from Active Directory.
- Next: verify tenant context and administrative prerequisites, select the supported sync architecture, install/register its agent on a supported domain-joined server, confirm agent health, and validate a narrowly scoped pilot identity.

## October 19–20, 2026 — Active Directory foundation and client validation

### Completed
- Configured the Windows Server 2019 domain controller `DC01` for AD DS and DNS.
- Configured the lab domain `skrillsam.org`.
- Created on-premises lab test users.
- Joined the Windows client `CLIENT01` to the domain.
- Observed PowerShell domain membership as `PartOfDomain = True` and successful secure-channel validation.
- Inspected the DNS zone and lab records.

### Lab network reference
| Component | Value |
|---|---|
| Domain | `skrillsam.org` |
| Domain controller | `DC01` |
| Domain controller OS | Windows Server 2019 |
| DC host-only IP | `192.168.56.10` |
| Windows client | `CLIENT01` |
| Client host-only IP | `192.168.56.20` |

## Evidence and security notes
- Add sanitized screenshots to the repository's `screenshots/` directory and verify they render before checking off screenshot tasks.
- Never commit passwords, tokens, recovery codes, private keys, or other secrets.
- Do not include tenant identifiers or personal account details unless there is a clear portfolio need.
- Record actual observed outputs; do not mark a milestone complete based only on opening a portal or starting a wizard.


## October 21, 2026 — Microsoft Entra Connect Sync configuration

### Completed
- Completed the Microsoft Entra Connect Sync configuration wizard.
- The final wizard screen explicitly reported: configuration succeeded and the synchronization process had been initiated.
- The wizard selected password hash synchronization and displayed `mS-DS-ConsistencyGuid` as the source anchor attribute.
- The wizard showed the on-premises forest `SkrillSam.org` and the lab Entra tenant domain.

### Validation still required
- Check the synchronization service and scheduler are running and healthy.
- Review connector import/synchronization/export status and any errors.
- Verify a known on-premises test user appears in Entra ID with the expected attributes.
- Confirm the synchronization scope is appropriate for a lab. One wizard screen showed the option to synchronize all users and devices selected; review that choice and narrow the scope if needed.
- Do not mark end-to-end hybrid synchronization complete until the pilot identity has been verified.

### Screenshot evidence
- The lab screenshots from the Connect Sync wizard include the user/device filtering, optional features, ready-to-configure, and successful configuration screens. Add these screenshots to `screenshots/` after binary upload is completed and verify they render on GitHub.
