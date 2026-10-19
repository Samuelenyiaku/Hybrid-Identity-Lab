# Project Roadmap

Update this checklist only after testing the corresponding milestone.

## Local foundation
- [x] VirtualBox lab installed
- [x] Snapshots created
- [x] AD DS domain `skrillsam.org` configured
- [x] Test identities created
- [x] Windows client joined to the domain
- [ ] Capture and commit sanitized evidence

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
- [ ] Add architecture and network screenshots
- [ ] Add validation scripts with comments and safe defaults
- [ ] Verify README links and diagram rendering
- [ ] Scan repository for secrets before public commits
- [ ] Refresh status badges and milestone status
