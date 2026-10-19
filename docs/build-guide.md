# Build Guide

This guide is organized as small milestones. Check off a step only after completing it and recording evidence.

## Milestone 1 — VirtualBox foundation

Reported complete:
- [x] Windows Server virtual machines installed.
- [x] Lab snapshots created.

Validation to keep on file:
- [ ] Record VM names, OS versions, memory, CPU, and virtual network mode.
- [ ] Capture a sanitized screenshot of the VM inventory.
- [ ] Confirm a clean snapshot exists before major changes.

## Milestone 2 — Active Directory

Reported complete:
- [x] AD domain configured as `skrillsam.org`.
- [x] Test identities created.
- [x] Windows client joined to the domain.

Validation:
- [ ] On the DC, run `Get-ADDomain`, `Get-ADForest`, and `dcdiag /test:dns /v`.
- [ ] On the client, run `nltest /dsgetdc:skrillsam.org`.
- [ ] Sign in using a dedicated standard test account.
- [ ] Capture AD Users and Computers and successful validation output with sensitive details redacted.

## Milestone 3 — Microsoft Entra tenant

Status: **Next**

1. Sign in to Microsoft using the personal account and review the available Entra tenant / trial options in the official Microsoft portal.
2. Create or select a dedicated lab organizational tenant if eligible. A personal Microsoft account by itself is not an organizational directory.
3. Record the tenant's verified domain and initial administrative access recovery method in a private, secure location—not in this repository.
4. Configure MFA for administrators and use a separate standard test identity for lab tests where possible.
5. Confirm the portal opens the intended directory before configuring integrations.

Do not assume a free trial or license is available until the portal confirms current eligibility and terms.

## Milestone 4 — Hybrid identity

Status: **Planned**

Before installing or configuring synchronization:
- [ ] Choose the supported Microsoft synchronization approach for the lab's requirements.
- [ ] Review current Microsoft prerequisites and supported OS versions.
- [ ] Define a dedicated pilot OU and a small test-user scope.
- [ ] Take a VM snapshot and record rollback steps.
- [ ] Configure the synchronization component using official guidance.
- [ ] Validate one pilot identity end-to-end and check sync health.
- [ ] Document the observed result and any remediation.

Do not sync every lab object by default. Keep the initial scope small and intentional.

## Milestone 5 — Okta SSO

Status: **Planned**

- [ ] Choose a test application and document its supported SSO protocol.
- [ ] Decide and diagram the intended relationship between Entra ID, Okta, and the application.
- [ ] Configure the application integration in a non-production environment.
- [ ] Test a permitted sign-in and a denied sign-in.
- [ ] Record the result, troubleshooting steps, and sanitized evidence.
- [ ] Never add client secrets, signing keys, or recovery codes to Git.

## Milestone 6 — Portfolio finish

- [ ] Add screenshots under `screenshots/`, grouped by milestone.
- [ ] Add exact validation steps and observed outputs to each lab.
- [ ] Update the status table in the README when evidence supports a status change.
- [ ] Review the repository for secrets before every public commit.
