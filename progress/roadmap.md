# Project Roadmap

Update this checklist only after completing the corresponding test and recording evidence.

## Local foundation
- [x] VirtualBox lab installed
- [x] Snapshots created
- [x] AD DS domain `skrillsam.org` configured
- [x] Test identities created
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

## Cloud identity
- [ ] Create/select a dedicated Microsoft Entra lab tenant
- [ ] Verify tenant context and administrative recovery
- [ ] Enable strong authentication for admin identities
- [ ] Document licensing and supported integration prerequisites

## Hybrid identity
- [ ] Select supported synchronization architecture
- [ ] Define pilot OU and test scope
- [ ] Configure synchronization
- [ ] Validate pilot identity and sync health
- [ ] Document rollback and troubleshooting

## Okta SSO
- [ ] Choose a non-production test application
- [ ] Document target sign-in architecture and protocol
- [ ] Configure application integration
- [ ] Validate successful and denied sign-ins
- [ ] Add sanitized evidence and troubleshooting notes

## Portfolio quality
- [x] Add architecture and network design documentation
- [x] Add validation scripts with comments and safe defaults
- [ ] Verify README links and diagram rendering
- [ ] Scan repository for secrets before public commits
- [ ] Refresh status badges and milestone status
