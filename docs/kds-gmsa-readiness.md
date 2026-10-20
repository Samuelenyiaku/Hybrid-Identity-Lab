# KDS Root Key and gMSA Readiness

## Current status

**Status: In progress — waiting period / validation pending.**

The lab is preparing for a Group Managed Service Account (gMSA) exercise. The KDS root key is a prerequisite for gMSA password generation in Active Directory. Do not mark this milestone complete until the key state and gMSA functionality have been validated on the lab domain controller.

## Before proceeding

1. Confirm you are working on the intended lab domain controller and domain.
2. Check whether a KDS root key already exists before creating another one.
3. Record the creation time and the domain controller used.
4. Allow the documented KDS root-key safety interval for replication in a multi-DC environment. In a single-DC lab, follow Microsoft's current guidance rather than assuming a wait is or is not required.
5. Do not use the production-only shortcut of backdating a root key in a multi-DC environment.

## Read-only checks

Run in an elevated PowerShell session on a domain controller with the Active Directory module available:

```powershell
Get-KdsRootKey
```

Review the returned key identifiers and effective dates. Do not paste sensitive environment details into public issues or screenshots unnecessarily.

## Validation checklist

- [ ] Confirm the intended domain and domain controller.
- [ ] Check existing KDS root keys.
- [ ] Create a root key only if needed and according to current Microsoft guidance.
- [ ] Wait for the applicable safety interval.
- [ ] Confirm the root key is visible and effective.
- [ ] Create a dedicated test gMSA with least privilege.
- [ ] Validate that the intended host can retrieve the managed password.
- [ ] Document the observed results and any errors.
- [ ] Capture sanitized evidence before marking the milestone complete.

## Evidence to capture

- A redacted output of `Get-KdsRootKey` showing the key is present and effective.
- The relevant gMSA configuration and permitted host/group, with unnecessary identifiers hidden.
- A successful host-side validation result such as `Test-ADServiceAccount` returning `True`.
- A short note describing the test, expected result, actual result, and remediation if needed.

## Safety notes

- Never commit passwords, secrets, private keys, recovery codes, or exported credentials.
- Do not expose the gMSA managed password; Windows manages it automatically.
- Keep the test scope limited to the lab and a dedicated security group.
- Use current Microsoft documentation for supported commands and prerequisites.
