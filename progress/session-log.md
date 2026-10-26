# Lab Session Log

## October 26, 2026 — Hybrid identity pilot and group sync validation

### Pilot user and attribute validation
- Confirmed provisioned AD pilot identity Ephraim Boss appears in Microsoft Entra ID, with on-premises synchronization enabled.
- Changed the user's Department attribute in AD to `IT-Lab`; later observed `IT-Lab` in Entra, demonstrating attribute flow.
- Observed Connect Sync feature output with `PasswordHashSync : True`.
- User reported successful cloud sign-in for Ephraim Boss using the current AD password. Following an AD password reset and delta sync, the user again reported successful sign-in.
- Qualification: this is reported practical sign-in testing; no sign-in log evidence was captured here to isolate the precise password hash authentication path.

### Additional synced identity
- Created on-premises user `Hybrid Test User`, SamAccountName `hybrid.test`, UPN `hybrid.test@SkrillSam.org`, Department `IT-Lab`.
- User ran delta sync and confirmed the new account became visible in Entra.

### Hybrid security group membership
- Created AD Global Security group `IAM-Lab-Users` in `OU=LabUsers,DC=SkrillSam,DC=org`.
- Added `Ephraim.boss` and `hybrid.test`.
- PowerShell `Get-ADGroupMember` output showed Ephraim Boss and Hybrid Test User as members.
- Ran `Start-ADSyncSyncCycle -PolicyType Delta`; result returned `Success`.
- Entra `IAM-Lab-Users` Members page displayed **2 group members found**, both Ephraim Boss and Hybrid Test User under Direct members.
- **Milestone validated:** pilot user provisioning, sample attribute synchronization, and group membership synchronization have demonstrated expected results.

### Status / limitations / next action
- Existing checks reported the ADSync service running, scheduler enabled, and successful connector import/synchronization/export operations.
- Synchronization wizard had selected “Synchronize all users and devices.” Scope appropriateness still needs review.
- Enterprise application group assignment/access tests have not been performed.
- Conditional Access creation was unavailable due to tenant licensing; do not represent Conditional Access as configured.
- Next planned core roadmap work: review sync scope/health, then inspect KDS root-key state/readiness before deciding whether to proceed with gMSA practice.
- Screenshot evidence was supplied during lab mentoring, including the recent Entra Members view. Reuse available conversation evidence where possible; this does not establish that image files are committed/rendering in GitHub.


## October 26, 2026 — Progress documentation checkpoint

- Reviewed README, roadmap, and prior session evidence against the currently recorded lab state.
- No new command output, synchronization health result, or pilot identity validation was available to substantiate a new technical milestone.
- Retained the October 21 state: Connect Sync wizard succeeded and reported synchronization initiated; end-to-end synchronization is still unverified.
- Kept sync scope review, service/scheduler and connector health checks, pilot identity confirmation, and screenshot upload verification outstanding.
- Next working step: inspect intended synchronization scope and validate Connect Sync health, then test one designated on-premises pilot identity.


A chronological record of completed work, observed results, and outstanding validation. “Configured” does not mean “verified end-to-end.”

## October 21, 2026 — Microsoft Entra Connect Sync configuration

### Observed completion
- Completed the Microsoft Entra Connect Sync configuration wizard.
- The final wizard screen reported that configuration succeeded and synchronization was initiated.
- Password hash synchronization was selected.
- The displayed source anchor was `mS-DS-ConsistencyGuid`.
- The wizard displayed on-premises forest `SkrillSam.org` and the lab Entra tenant domain.
- The wizard's filtering step showed **Synchronize all users and devices** selected.

### Important scope and status notes
- Review scope and consider a deliberately limited pilot before proceeding.
- A prior check of the Entra **Cloud Sync Agents** page returned **No results**. That earlier observation was specific to that Cloud Sync agent view; it should not be read as a contradiction of the later Microsoft Entra Connect Sync wizard configuration.
- Wizard success and initiation do not prove export success or that a pilot identity is visible in Entra ID.
- Do not describe cloud-only `Lab Cloud User` as synchronized from AD unless verified separately.

### Still to validate
- Confirm Connect Sync service and scheduler are healthy.
- Review connector import/synchronization/export status and errors.
- Inspect/trigger an initial cycle as appropriate.
- Confirm intended forest/tenant and pilot scope.
- Verify a known on-premises pilot identity appears in Entra ID with expected source and attributes.
- Capture sanitized service-health and pilot-validation evidence.

### Screenshot status
- Reviewed wizard screenshots showing identity matching, filtering, optional features, readiness, and successful configuration.
- Screenshots have **not yet been confirmed in the GitHub repository**. Upload them under `screenshots/entra-connect/` and verify rendering before marking the evidence task complete.

## October 21, 2026 — Microsoft Entra ID setup

### Completed
- Accessed the Microsoft Entra ID Free tenant used for lab practice.
- Created cloud-only test user `Lab Cloud User`.
- Created cloud security group `SG-Cloud-Lab-Users`.

### Observed troubleshooting
- Opened the Entra Cloud Sync Agents area; it returned **No results** at that time.
- This was a discovery observation for that agent view, not a final statement about all possible sync architectures.

## October 19–20, 2026 — Active Directory foundation and client validation

### Completed
- Configured Windows Server 2019 domain controller `DC01` for AD DS and DNS.
- Configured lab domain `skrillsam.org`.
- Created on-premises lab test users.
- Joined Windows client `CLIENT01` to the domain.
- Observed PowerShell domain membership as `PartOfDomain = True` and successful secure-channel validation.
- Inspected DNS zone and lab records.

### Lab network reference
| Component | Value |
|---|---|
| Domain | `skrillsam.org` |
| Domain controller | `DC01` |
| Domain controller OS | Windows Server 2019 |
| DC host-only IP | `192.168.56.10` |
| Windows client | `CLIENT01` |
| Client host-only IP | `192.168.56.20` |

## Evidence and security standards
- Upload sanitized screenshots under `screenshots/` and verify that images render before checking evidence tasks off.
- Never commit passwords, access tokens, recovery codes, private keys, client secrets, or credential exports.
- Avoid unnecessary personal details, tenant identifiers, public IPs, and employer/customer information.
- Record objective, actions, expected result, observed result, and remediation.
- Keep actual observations distinct from plans and assumptions.
