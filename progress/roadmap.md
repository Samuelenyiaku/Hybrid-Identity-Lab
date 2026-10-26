# Project Roadmap

Last reviewed: October 26, 2026

This checklist distinguishes validated outcomes from configuration, reported testing, and unfinished work.

## Current checkpoint

**Validated:** AD DS/DNS foundation and Windows client domain join; hybrid pilot provisioning, sample attribute flow, and group membership sync; core gMSA usability and scheduled-task exercise.

**Next major workstream:** Okta SSO. Okta tenant setup has not begun.

## Workstream status

| Workstream | Status | Evidence / limitation |
|---|---|---|
| VirtualBox foundation | Prepared (reported) | Lab VM/snapshot setup established; detailed inventory can be expanded |
| AD DS + DNS | Core foundation validated | Server 2019 DC; `skrillsam.org`; DNS/client checks documented |
| Windows client | Validated | `CLIENT01` domain membership and secure-channel validation observed |
| Entra tenant | Initial setup | Cloud-only `Lab Cloud User` and `SG-Cloud-Lab-Users` created |
| Entra Connect Sync | Pilot validated | Service/scheduler and connector operations observed; pilot identity and attribute/group results confirmed |
| Password Hash Sync | Configured; sign-in reported | Feature output True; successful cloud sign-ins reported, but no isolated PHS sign-in event captured |
| Hybrid security group | Validated | AD `IAM-Lab-Users`; Ephraim Boss and Hybrid Test User confirmed as direct Entra members |
| gMSA exercise | Core test validated | Reused `gmsaLabSvc`; host validation True; task result 0 and output observed |
| gMSA runtime identity audit | Pending | Configured principal known; independent event-level confirmation incomplete |
| App assignment / RBAC | Not tested | No enterprise app access allow/deny test recorded |
| Conditional Access | Not configured | Policy creation unavailable due to tenant licensing |
| Okta SSO | Planned | No tenant, integration, or end-to-end test yet |
| Screenshot evidence | Partially published | Four additional images uploaded; per-image content, captions, redaction, and rendering review pending |

## Next actions

1. Begin Okta enrollment and confirm actual plan and feature eligibility.
2. Define the intended SSO architecture and authoritative identity source before connecting systems.
3. Configure a non-production SAML application and test assigned and unassigned access.
4. Review actual Entra Connect scope. The wizard displayed “Synchronize all users and devices”; determine whether this remains the configured scope and consider a limited pilot with a recovery plan.
5. Continue connector health/error review.
6. Audit gMSA task runtime identity; decide whether to retain or remove temporary task/test artifacts.
7. Individually inspect, rename, caption, and verify rendering of the new evidence images.

## Hybrid sync validation

- [x] Complete Microsoft Entra Connect Sync configuration wizard
- [x] Record PHS selection and `mS-DS-ConsistencyGuid` source anchor
- [x] Observe Connect Sync service running and scheduler enabled
- [x] Observe successful connector import, synchronization, and export operations
- [x] Confirm Ephraim Boss appears in Entra as synchronized
- [x] Verify AD `Department=IT-Lab` flows to Entra
- [x] Observe `PasswordHashSync=True`
- [x] Record user-reported successful cloud sign-in, including after AD password reset and delta sync
- [x] Provision `Hybrid Test User` from AD and confirm Entra presence
- [x] Create AD Global Security group `IAM-Lab-Users` in `OU=LabUsers,DC=SkrillSam,DC=org`
- [x] Add `Ephraim.boss` and `hybrid.test`; membership output confirms both
- [x] Run delta sync; result `Success`
- [x] Confirm Entra group has two direct members
- [ ] Review configured scope and document decision
- [ ] Continue health/error review
- [ ] Capture sign-in evidence isolating auth path if feasible

## Local foundation

- [x] VirtualBox lab and snapshots prepared (reported)
- [x] AD DS domain `skrillsam.org` configured
- [x] On-premises lab users created
- [x] Windows client joined to domain
- [x] Domain membership and secure-channel checks observed successful
- [x] DNS zone/records inspected
- [ ] Add further fresh sanitized evidence if useful

## gMSA practice

- [x] Discover existing KDS root key; `IsFormatValid=True`
- [x] Reuse enabled `gmsaLabSvc` (no duplicate)
- [x] Confirm `gMSA-Server2022-Hosts` contains `WIN-7UDT986C0L5`
- [x] `Test-ADServiceAccount gmsaLabSvc` returned `True` on Server 2022
- [x] Register `gMSA-Lab-Test` with configured principal `gmsaLabSvc`
- [x] Manual run returned `LastTaskResult=0`
- [x] Timestamp output observed in `C:\\gMSA-Lab\\gmsa-test.txt`
- [ ] Independently confirm runtime identity using appropriate task/security evidence
- [ ] Decide whether to retain or remove test task and files

## Entra ID

- [x] Access Entra ID Free lab tenant
- [x] Create cloud-only `Lab Cloud User`
- [x] Create cloud security group `SG-Cloud-Lab-Users`
- [ ] Review tenant context, admin recovery, and authentication
- [ ] Capture sanitized tenant/user/group evidence
- [ ] Record relevant licensing limitations

## IAM application access

- [x] Create synchronized `IAM-Lab-Users` with two direct members
- [ ] Select a supported non-production enterprise app
- [ ] Assign group access if supported by tenant licensing
- [ ] Test allowed and denied access paths

## Okta SSO

- [ ] Choose eligible tenant enrollment path and create/access lab org
- [ ] Select a non-production test application
- [ ] Document identity source, provisioning direction, and architecture
- [ ] Configure SAML integration and claims/attributes
- [ ] Test assigned and unassigned sign-ins
- [ ] Document results, certificate lifecycle, and sanitized evidence

## Portfolio quality

- [x] Architecture and network design documentation
- [x] Validation scripts, build guide, and troubleshooting playbook
- [x] Current README and screenshot inventory
- [x] Four additional image files committed under `screenshots/02-active-directory/`
- [ ] Inspect, caption, and verify rendering of newly committed images
- [ ] Publish relevant hybrid sync evidence
- [ ] Verify links and diagram rendering
- [ ] Scan changes for secrets before public updates
- [ ] Keep milestone status aligned with observed results

## Status definitions

- **Validated:** successful result observed and recorded
- **Configured:** setting applied; end-to-end outcome may remain unverified
- **Reported:** user described the outcome; independent artifact not captured
- **Pending / planned:** work or validation remains
