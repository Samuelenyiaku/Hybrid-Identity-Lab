# Project Roadmap



This checklist reflects documented progress. Mark validation tasks complete only after observing and recording the result. A cloud-only object is not proof of a synchronized identity.

## Current milestone — Hybrid identity synchronization and groups

**Current state (October 26, 2026):** Pilot user provisioning, a sample attribute update, PHS feature configuration, and hybrid security group membership sync are validated through observed portal/PowerShell results and user-reported sign-in testing. Scope review and ongoing evidence-based health checks remain.

- [x] Run Microsoft Entra Connect Sync configuration wizard
- [x] Wizard reported configuration succeeded
- [x] Wizard reported synchronization process initiated
- [x] Record password hash synchronization selection and `mS-DS-ConsistencyGuid` source anchor
- [x] Confirm Connect Sync service is running and scheduler settings enabled (observed)
- [x] Observe successful AD import, sync, and export operations in Synchronization Service Manager
- [x] Verify on-premises pilot user Ephraim Boss appears in Entra with on-premises sync enabled
- [x] Verify `Department=IT-Lab` attribute flow from AD to Entra
- [x] Observe PasswordHashSync feature set to True
- [x] User reported successful Ephraim cloud sign-in using current AD password, including following password reset and delta sync (specific PHS sign-in log not captured)
- [x] Provision `Hybrid Test User` from AD and confirm it appears in Entra
- [x] Create AD Global Security group `IAM-Lab-Users` in `OU=LabUsers,DC=SkrillSam,DC=org`
- [x] Add `Ephraim.boss` and `hybrid.test`; PowerShell membership query confirms both
- [x] Run delta sync; result returned `Success`
- [x] Confirm Entra `IAM-Lab-Users` group has two direct members: Ephraim Boss and Hybrid Test User
- [ ] Review synchronization scope (wizard showed “Synchronize all users and devices” selected); narrow to intended lab scope if appropriate
- [ ] Continue periodic connector/sync health and error review
- [x] Confirm four additional dated image files committed under `screenshots/02-active-directory/` (individual visual review, captions, and rendered previews remain pending)
- [ ] Upload remaining sanitized sync/user/group evidence where available; the four gMSA-related image files have been committed, but their individual contents still need review
- [ ] Document scope decision and applicable recovery/rollback considerations

## Local foundation
- [x] VirtualBox lab and snapshots prepared (reported)
- [x] AD DS domain `skrillsam.org` configured
- [x] On-premises test identities created
- [x] Windows client joined to domain
- [x] Client membership and secure-channel validation observed successful
- [x] DNS zone and lab records inspected
- [ ] Add/index fresh sanitized validation evidence and verify image rendering
- [ ] Locate and publish the five reviewed Entra Connect wizard screenshots (not present in `screenshots/04-hybrid-sync/` as of this check)

## Active Directory service accounts — gMSA practice
**Status: Core gMSA usability and scheduled-task exercise validated; runtime identity audit pending. Four additional image files are committed; individual review remains pending.**

- [x] Check existing KDS root-key state; key present and `IsFormatValid=True`
- [x] Discover one domain controller in lab inventory
- [x] Reuse existing enabled gMSA `gmsaLabSvc` (no duplicate created)
- [x] Confirm retrieval group `gMSA-Server2022-Hosts` contains `WIN-7UDT986C0L5# Project Roadmap



This checklist reflects documented progress. Mark validation tasks complete only after observing and recording the result. A cloud-only object is not proof of a synchronized identity.

## Current milestone — Hybrid identity synchronization and groups

**Current state (October 26, 2026):** Pilot user provisioning, a sample attribute update, PHS feature configuration, and hybrid security group membership sync are validated through observed portal/PowerShell results and user-reported sign-in testing. Scope review and ongoing evidence-based health checks remain.

- [x] Run Microsoft Entra Connect Sync configuration wizard
- [x] Wizard reported configuration succeeded
- [x] Wizard reported synchronization process initiated
- [x] Record password hash synchronization selection and `mS-DS-ConsistencyGuid` source anchor
- [x] Confirm Connect Sync service is running and scheduler settings enabled (observed)
- [x] Observe successful AD import, sync, and export operations in Synchronization Service Manager
- [x] Verify on-premises pilot user Ephraim Boss appears in Entra with on-premises sync enabled
- [x] Verify `Department=IT-Lab` attribute flow from AD to Entra
- [x] Observe PasswordHashSync feature set to True
- [x] User reported successful Ephraim cloud sign-in using current AD password, including following password reset and delta sync (specific PHS sign-in log not captured)
- [x] Provision `Hybrid Test User` from AD and confirm it appears in Entra
- [x] Create AD Global Security group `IAM-Lab-Users` in `OU=LabUsers,DC=SkrillSam,DC=org`
- [x] Add `Ephraim.boss` and `hybrid.test`; PowerShell membership query confirms both
- [x] Run delta sync; result returned `Success`
- [x] Confirm Entra `IAM-Lab-Users` group has two direct members: Ephraim Boss and Hybrid Test User
- [ ] Review synchronization scope (wizard showed “Synchronize all users and devices” selected); narrow to intended lab scope if appropriate
- [ ] Continue periodic connector/sync health and error review
- [x] Commit four additional dated image files to `screenshots/02-active-directory/`
- [ ] Individually inspect, caption, and verify rendering of the four new images
- [ ] Document scope decision and applicable recovery/rollback considerations

## Local foundation
- [x] VirtualBox lab and snapshots prepared (reported)
- [x] AD DS domain `skrillsam.org` configured
- [x] On-premises test identities created
- [x] Windows client joined to domain
- [x] Client membership and secure-channel validation observed successful
- [x] DNS zone and lab records inspected
- [ ] Retain a fresh, sanitized set of validation evidence
- [ ] Upload the five reviewed Entra Connect wizard screenshots and verify they render


- [x] Confirm Server 2022 can discover the existing KDS root key
- [x] Validate `Test-ADServiceAccount gmsaLabSvc` returned `True` on `WIN-7UDT986C0L5`
- [x] Register task `gMSA-Lab-Test` with configured principal `gmsaLabSvc# Project Roadmap



This checklist reflects documented progress. Mark validation tasks complete only after observing and recording the result. A cloud-only object is not proof of a synchronized identity.

## Current milestone — Hybrid identity synchronization and groups

**Current state (October 26, 2026):** Pilot user provisioning, a sample attribute update, PHS feature configuration, and hybrid security group membership sync are validated through observed portal/PowerShell results and user-reported sign-in testing. Scope review and ongoing evidence-based health checks remain.

- [x] Run Microsoft Entra Connect Sync configuration wizard
- [x] Wizard reported configuration succeeded
- [x] Wizard reported synchronization process initiated
- [x] Record password hash synchronization selection and `mS-DS-ConsistencyGuid` source anchor
- [x] Confirm Connect Sync service is running and scheduler settings enabled (observed)
- [x] Observe successful AD import, sync, and export operations in Synchronization Service Manager
- [x] Verify on-premises pilot user Ephraim Boss appears in Entra with on-premises sync enabled
- [x] Verify `Department=IT-Lab` attribute flow from AD to Entra
- [x] Observe PasswordHashSync feature set to True
- [x] User reported successful Ephraim cloud sign-in using current AD password, including following password reset and delta sync (specific PHS sign-in log not captured)
- [x] Provision `Hybrid Test User` from AD and confirm it appears in Entra
- [x] Create AD Global Security group `IAM-Lab-Users` in `OU=LabUsers,DC=SkrillSam,DC=org`
- [x] Add `Ephraim.boss` and `hybrid.test`; PowerShell membership query confirms both
- [x] Run delta sync; result returned `Success`
- [x] Confirm Entra `IAM-Lab-Users` group has two direct members: Ephraim Boss and Hybrid Test User
- [ ] Review synchronization scope (wizard showed “Synchronize all users and devices” selected); narrow to intended lab scope if appropriate
- [ ] Continue periodic connector/sync health and error review
- [ ] Capture/organize sanitized evidence files in GitHub and verify rendering
- [ ] Document scope decision and applicable recovery/rollback considerations

## Local foundation
- [x] VirtualBox lab and snapshots prepared (reported)
- [x] AD DS domain `skrillsam.org` configured
- [x] On-premises test identities created
- [x] Windows client joined to domain
- [x] Client membership and secure-channel validation observed successful
- [x] DNS zone and lab records inspected
- [ ] Retain a fresh, sanitized set of validation evidence
- [ ] Upload the five reviewed Entra Connect wizard screenshots and verify they render


- [x] Run task; `LastTaskResult=0` and timestamp output observed in `C:\\gMSA-Lab\\gmsa-test.txt`
- [x] Inspect task principal: `UserId=gmsaLabSvc# Project Roadmap



This checklist reflects documented progress. Mark validation tasks complete only after observing and recording the result. A cloud-only object is not proof of a synchronized identity.

## Current milestone — Hybrid identity synchronization and groups

**Current state (October 26, 2026):** Pilot user provisioning, a sample attribute update, PHS feature configuration, and hybrid security group membership sync are validated through observed portal/PowerShell results and user-reported sign-in testing. Scope review and ongoing evidence-based health checks remain.

- [x] Run Microsoft Entra Connect Sync configuration wizard
- [x] Wizard reported configuration succeeded
- [x] Wizard reported synchronization process initiated
- [x] Record password hash synchronization selection and `mS-DS-ConsistencyGuid` source anchor
- [x] Confirm Connect Sync service is running and scheduler settings enabled (observed)
- [x] Observe successful AD import, sync, and export operations in Synchronization Service Manager
- [x] Verify on-premises pilot user Ephraim Boss appears in Entra with on-premises sync enabled
- [x] Verify `Department=IT-Lab` attribute flow from AD to Entra
- [x] Observe PasswordHashSync feature set to True
- [x] User reported successful Ephraim cloud sign-in using current AD password, including following password reset and delta sync (specific PHS sign-in log not captured)
- [x] Provision `Hybrid Test User` from AD and confirm it appears in Entra
- [x] Create AD Global Security group `IAM-Lab-Users` in `OU=LabUsers,DC=SkrillSam,DC=org`
- [x] Add `Ephraim.boss` and `hybrid.test`; PowerShell membership query confirms both
- [x] Run delta sync; result returned `Success`
- [x] Confirm Entra `IAM-Lab-Users` group has two direct members: Ephraim Boss and Hybrid Test User
- [ ] Review synchronization scope (wizard showed “Synchronize all users and devices” selected); narrow to intended lab scope if appropriate
- [ ] Continue periodic connector/sync health and error review
- [ ] Capture/organize sanitized evidence files in GitHub and verify rendering
- [ ] Document scope decision and applicable recovery/rollback considerations

## Local foundation
- [x] VirtualBox lab and snapshots prepared (reported)
- [x] AD DS domain `skrillsam.org` configured
- [x] On-premises test identities created
- [x] Windows client joined to domain
- [x] Client membership and secure-channel validation observed successful
- [x] DNS zone and lab records inspected
- [ ] Retain a fresh, sanitized set of validation evidence
- [ ] Upload the five reviewed Entra Connect wizard screenshots and verify they render

, `LogonType=Password`, `RunLevel=Limited`
- [ ] Independently verify runtime identity using Task Scheduler operational/security evidence
- [ ] Capture/upload sanitized screenshots and verify rendering in GitHub
- [ ] Decide whether to retain or remove the temporary task and test files

See [KDS root key and gMSA readiness](../docs/kds-gmsa-readiness.md).

## Microsoft Entra ID
- [x] Access Entra ID Free lab tenant
- [x] Create cloud-only test user `Lab Cloud User`
- [x] Create cloud security group `SG-Cloud-Lab-Users`
- [ ] Verify tenant context and administrative recovery practices
- [ ] Review strong authentication for administrator accounts
- [ ] Capture sanitized tenant/user/group evidence
- [ ] Document applicable licensing and supported integration prerequisites

## IAM / application access
- [x] Create and validate synchronized security group `IAM-Lab-Users` with two direct members
- [ ] Select a supported non-production enterprise application
- [ ] Assign group-based access if app and tenant licensing support it
- [ ] Test allowed and denied access paths; document boundaries

## Okta SSO — planned
- [ ] Select a non-production test app
- [ ] Document intended sign-in architecture and protocol
- [ ] Configure app integration
- [ ] Test permitted and denied sign-ins
- [ ] Document results and sanitized evidence

## Portfolio quality
- [x] Architecture and network design documentation
- [x] Validation scripts and build guide
- [x] Current progress and next actions reflected in README
- [ ] Individually inspect and verify newly uploaded screenshots; update evidence captions/index
- [ ] Verify repository links and diagram rendering
- [ ] Scan for secrets before public updates
- [ ] Refresh status summaries as evidence changes

## Status definitions
- **Complete / validated:** observed successful result recorded
- **Configured:** setup applied; operational result may remain unverified
- **In progress / validating:** active work with validation outstanding
- **Planned:** not implemented yet
