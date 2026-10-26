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

## Active Directory service accounts
- [ ] Check current KDS root-key state
- [ ] Confirm key readiness and applicable safety interval
- [ ] Create a dedicated test gMSA if needed
- [ ] Validate gMSA retrieval on authorized test host
- [ ] Add sanitized evidence and troubleshooting notes

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
- [ ] Upload and verify screenshot evidence
- [ ] Verify repository links and diagram rendering
- [ ] Scan for secrets before public updates
- [ ] Refresh status summaries as evidence changes

## Status definitions
- **Complete / validated:** observed successful result recorded
- **Configured:** setup applied; operational result may remain unverified
- **In progress / validating:** active work with validation outstanding
- **Planned:** not implemented yet
