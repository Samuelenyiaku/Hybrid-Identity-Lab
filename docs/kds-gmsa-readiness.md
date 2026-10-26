# KDS Root Key and gMSA Readiness

## Current status

**Status: Core usability test validated; independent audit and evidence publication pending.**

The lab reused existing enabled gMSA `gmsaLabSvc`. Server 2022 (`WIN-7UDT986C0L5`) discovered the KDS root key and `Test-ADServiceAccount gmsaLabSvc` returned `True`. Scheduled task `gMSA-Lab-Test`, configured with principal `gmsaLabSvc# KDS Root Key and gMSA Readiness

## Current status

, completed with result `0` and wrote timestamp output. Runtime identity auditing and sanitized evidence upload remain follow-ups.

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

- [x] Confirm lab domain and DC discovery (one DC returned).
- [x] Check existing KDS root key; key was present and `IsFormatValid=True`.
- [x] Confirm key visible from Server 2022.
- [x] Inspect existing gMSAs and reuse `gmsaLabSvc` rather than create a duplicate.
- [x] Confirm retrieval group `gMSA-Server2022-Hosts` contains `WIN-7UDT986C0L5# KDS Root Key and gMSA Readiness

## Current status

**Status: Core usability test validated; independent audit and evidence publication pending.**

The lab reused existing enabled gMSA `gmsaLabSvc`. Server 2022 (`WIN-7UDT986C0L5`) discovered the KDS root key and `Test-ADServiceAccount gmsaLabSvc` returned `True`. Scheduled task `gMSA-Lab-Test`, configured with principal `gmsaLabSvc# KDS Root Key and gMSA Readiness

## Current status

, completed with result `0` and wrote timestamp output. Runtime identity auditing and sanitized evidence upload remain follow-ups.

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

.
- [x] Validate `Test-ADServiceAccount gmsaLabSvc` returned `True` on the authorized host.
- [x] Run scheduled task `gMSA-Lab-Test`; result `0` and timestamp output observed.
- [ ] Independently audit scheduled-task runtime identity.
- [ ] Capture/upload sanitized evidence and verify it renders.
- [ ] Decide whether to retain or remove the temporary task and test files.

## Observed lab evidence (October 26, 2026)

- Existing gMSA: `gmsaLabSvc` (enabled); DNS name `gmsaLabSvc.SkrillSam.org`.
- Authorized retrieval group: `gMSA-Server2022-Hosts`; confirmed member `WIN-7UDT986C0L5# KDS Root Key and gMSA Readiness

## Current status

**Status: Core usability test validated; independent audit and evidence publication pending.**

The lab reused existing enabled gMSA `gmsaLabSvc`. Server 2022 (`WIN-7UDT986C0L5`) discovered the KDS root key and `Test-ADServiceAccount gmsaLabSvc` returned `True`. Scheduled task `gMSA-Lab-Test`, configured with principal `gmsaLabSvc# KDS Root Key and gMSA Readiness

## Current status

, completed with result `0` and wrote timestamp output. Runtime identity auditing and sanitized evidence upload remain follow-ups.

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

- [x] Confirm lab domain and DC discovery (one DC returned).
- [x] Check existing KDS root key; key was present and `IsFormatValid=True`.
- [x] Confirm key visible from Server 2022.
- [x] Inspect existing gMSAs and reuse `gmsaLabSvc` rather than create a duplicate.
- [x] Confirm retrieval group `gMSA-Server2022-Hosts` contains `WIN-7UDT986C0L5# KDS Root Key and gMSA Readiness

## Current status

**Status: Core usability test validated; independent audit and evidence publication pending.**

The lab reused existing enabled gMSA `gmsaLabSvc`. Server 2022 (`WIN-7UDT986C0L5`) discovered the KDS root key and `Test-ADServiceAccount gmsaLabSvc` returned `True`. Scheduled task `gMSA-Lab-Test`, configured with principal `gmsaLabSvc# KDS Root Key and gMSA Readiness

## Current status

, completed with result `0` and wrote timestamp output. Runtime identity auditing and sanitized evidence upload remain follow-ups.

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

.
- [x] Validate `Test-ADServiceAccount gmsaLabSvc` returned `True` on the authorized host.
- [x] Run scheduled task `gMSA-Lab-Test`; result `0` and timestamp output observed.
- [ ] Independently audit scheduled-task runtime identity.
- [ ] Capture/upload sanitized evidence and verify it renders.
- [ ] Decide whether to retain or remove the temporary task and test files.

.
- Host validation: `Test-ADServiceAccount gmsaLabSvc` returned `True`.
- Scheduled task `gMSA-Lab-Test`: configured `UserId=gmsaLabSvc# KDS Root Key and gMSA Readiness

## Current status

**Status: Core usability test validated; independent audit and evidence publication pending.**

The lab reused existing enabled gMSA `gmsaLabSvc`. Server 2022 (`WIN-7UDT986C0L5`) discovered the KDS root key and `Test-ADServiceAccount gmsaLabSvc` returned `True`. Scheduled task `gMSA-Lab-Test`, configured with principal `gmsaLabSvc# KDS Root Key and gMSA Readiness

## Current status

, completed with result `0` and wrote timestamp output. Runtime identity auditing and sanitized evidence upload remain follow-ups.

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

- [x] Confirm lab domain and DC discovery (one DC returned).
- [x] Check existing KDS root key; key was present and `IsFormatValid=True`.
- [x] Confirm key visible from Server 2022.
- [x] Inspect existing gMSAs and reuse `gmsaLabSvc` rather than create a duplicate.
- [x] Confirm retrieval group `gMSA-Server2022-Hosts` contains `WIN-7UDT986C0L5# KDS Root Key and gMSA Readiness

## Current status

**Status: Core usability test validated; independent audit and evidence publication pending.**

The lab reused existing enabled gMSA `gmsaLabSvc`. Server 2022 (`WIN-7UDT986C0L5`) discovered the KDS root key and `Test-ADServiceAccount gmsaLabSvc` returned `True`. Scheduled task `gMSA-Lab-Test`, configured with principal `gmsaLabSvc# KDS Root Key and gMSA Readiness

## Current status

, completed with result `0` and wrote timestamp output. Runtime identity auditing and sanitized evidence upload remain follow-ups.

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

.
- [x] Validate `Test-ADServiceAccount gmsaLabSvc` returned `True` on the authorized host.
- [x] Run scheduled task `gMSA-Lab-Test`; result `0` and timestamp output observed.
- [ ] Independently audit scheduled-task runtime identity.
- [ ] Capture/upload sanitized evidence and verify it renders.
- [ ] Decide whether to retain or remove the temporary task and test files.

, `LogonType=Password`, `RunLevel=Limited`; `LastTaskResult=0`; timestamp output observed.
- This validates account usability and successful task execution with the configured principal. Event-level runtime identity confirmation remains pending. Screenshots were shown in chat but are not confirmed committed here.

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
