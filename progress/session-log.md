# Lab Session Log

## October 26, 2026 — Existing gMSA and scheduled-task test

### Existing configuration inspected
- Domain: `SkrillSam.org` (`SKRILLSAM`); DC discovery returned one controller, `WIN-FQBK0UD08AU.SkrillSam.org` at `192.168.56.10`.
- Existing enabled gMSAs found: `provAgentgMSA` and `gmsaLabSvc`. Reused `gmsaLabSvc`; no duplicate was created.
- gMSA DNS host name: `gmsaLabSvc.SkrillSam.org`.
- Password retrieval principal: `gMSA-Server2022-Hosts`; membership output showed computer `WIN-7UDT986C0L5.
- Server 2022 (`WIN-7UDT986C0L5`) discovered the existing KDS root key. `IsFormatValid=True`; creation/effective time displayed as October 20, 2026 11:30:33 AM.
- On Server 2022, `Test-ADServiceAccount gmsaLabSvc` returned `True`.

### Scheduled-task exercise
- Created `C:\\gMSA-Lab\\gmsa-test.ps1`, which appends a timestamp to `C:\\gMSA-Lab\\gmsa-test.txt`.
- Registered task `gMSA-Lab-Test` using configured principal `gmsaLabSvc, `LogonType=Password`, `RunLevel=Limited`.
- Manually started the task. `Get-ScheduledTaskInfo` showed `LastTaskResult=0`; output file showed `gMSA scheduled task ran at 10/26/2026 10:40:30`.
- Principal inspection confirmed configured `UserId=gmsaLabSvc.
- **Observed milestone:** host-side gMSA validation and scheduled-task execution succeeded. Task configuration plus result/output support the test; independent event-level confirmation of runtime identity remains outstanding.

### Policy inspection and caveats
- Server 2022 security export listed `SKRILLSAM\\pGMSA_79da0118, `NT SERVICE\\ALL SERVICES`, and `NT SERVICE\\ADSync` for `SeServiceLogonRight`; `gmsaLabSvc` was not directly listed.
- The `SeDenyServiceLogonRight` search produced no matching line in that export.
- Default Domain Policy editor showed `Log on as a service` and `Deny log on as a service` as `Not Defined`. `gpresult /scope computer /r` showed Default Domain Policy applied.
- A remote RSoP report attempt failed because user logging data was unavailable. No security policy was edited. Service-logon rights are distinct from batch-logon rights relevant to scheduled tasks.

### Evidence and follow-up
- User supplied screenshots in the mentoring conversation showing command results and task output. Screenshots are not yet confirmed uploaded/rendering in the repository.
- Next: review Task Scheduler operational/security evidence for execution identity; decide whether to retain or remove the test task/files; upload sanitized screenshots.


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
