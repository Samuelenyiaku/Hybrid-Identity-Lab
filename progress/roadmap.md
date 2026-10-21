# Project Roadmap

Update this checklist only after completing the corresponding test and recording evidence. Cloud-only objects do not count as synchronized on-premises identities.

## Local foundation
- [x] VirtualBox lab installed
- [x] Snapshots created
- [x] AD DS domain `skrillsam.org` configured
- [x] Test identities created in on-premises AD
- [x] Windows client joined to the domain
- [x] Client domain membership and secure-channel checks observed as successful
- [x] DNS zone and lab records inspected
- [ ] Add the five local screenshot files to the repository and verify they render on GitHub

## Active Directory service-account practice
- [ ] Check existing KDS root-key state
- [ ] Confirm the root key is effective after the applicable safety interval
- [ ] Create a dedicated test gMSA if needed
- [ ] Validate gMSA retrieval on an authorized test host
- [ ] Add sanitized KDS/gMSA evidence and troubleshooting notes

See [KDS root key and gMSA readiness](../docs/kds-gmsa-readiness.md).

## Microsoft Entra ID — current progress
- [x] Select/access Microsoft Entra ID Free lab tenant
- [x] Create cloud-only test user: `Lab Cloud User`
- [x] Create cloud security group: `SG-Cloud-Lab-Users`
- [ ] Verify tenant context and administrative recovery details
- [ ] Confirm strong authentication for admin identities
- [ ] Capture sanitized screenshots of the tenant, user, and group
- [ ] Document licensing and supported integration prerequisites

## Hybrid identity synchronization
- [x] Inspect the Entra Cloud Sync Agents area
- [x] Record observed result: **No results**; no provisioning agent is currently installed
- [ ] Choose a supported synchronization architecture for the actual tenant and lab requirements
- [ ] Verify current Microsoft prerequisites, permissions, licensing, and supported server OS
- [ ] Install and register the required agent on a supported, domain-joined server
- [ ] Confirm agent health in the Entra portal
- [ ] Define a dedicated pilot OU and a small test-user scope
- [ ] Configure synchronization
- [ ] Validate a pilot identity and sync health end-to-end
- [ ] Document rollback and troubleshooting

**Status:** synchronization is not configured. Do not describe the environment as hybrid-synchronized until a pilot identity successfully synchronizes and the result is verified.

## Okta SSO
- [ ] Choose a non-production test application
- [ ] Document target sign-in architecture and protocol
- [ ] Configure application integration
- [ ] Validate successful and denied sign-ins
- [ ] Add sanitized evidence and troubleshooting notes

## Portfolio quality
- [x] Add architecture and network design documentation
- [x] Add validation scripts with comments and safe defaults
- [x] Record current Entra tenant, cloud user, group, and sync-agent discovery state
- [ ] Verify README links and diagram rendering
- [ ] Scan repository for secrets before public commits
- [ ] Add sanitized screenshots and verify them on GitHub
- [ ] Refresh status badges and milestone status
