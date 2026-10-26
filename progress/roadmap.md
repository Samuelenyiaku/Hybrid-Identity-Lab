# Project Roadmap

> **Documentation checkpoint · October 26, 2026:** Status reviewed against available recorded evidence. No new validation result was recorded; open checks below remain open.

This checklist reflects documented progress. Mark validation tasks complete only after observing and recording the result. A cloud-only object is not proof of a synchronized identity.

## Current milestone — Hybrid identity synchronization

**Current state:** Microsoft Entra Connect Sync configuration wizard succeeded and reported synchronization was initiated (October 21, 2026). End-to-end synchronization remains **unvalidated**.

- [x] Run Microsoft Entra Connect Sync configuration wizard
- [x] Wizard reported configuration succeeded
- [x] Wizard reported synchronization process initiated
- [x] Record password hash synchronization selection and `mS-DS-ConsistencyGuid` source anchor
- [ ] Review synchronization scope (wizard showed “Synchronize all users and devices” selected); narrow to an intentional pilot if appropriate
- [ ] Confirm Connect Sync service and scheduler are healthy
- [ ] Inspect connector import/synchronization/export status and errors
- [ ] Run or inspect initial synchronization cycle
- [ ] Verify a known on-premises pilot identity appears in Entra ID with expected source and attributes
- [ ] Document outcome, troubleshooting, and rollback
- [ ] Capture sanitized sync-health and pilot-validation screenshots

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
