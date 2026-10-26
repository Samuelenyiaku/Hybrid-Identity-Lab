# Hybrid Identity Lab — Build Guide

This guide tracks the lab build sequence, verified outcomes, and remaining work.

**Documentation rule:** Mark a milestone complete only when supported by an observed result. Distinguish configuration, reported outcomes, and independently verified evidence. Use snapshots or another rollback point before high-impact changes.

## Milestone status

| Phase | Status |
|---|---|
| VirtualBox foundation | Prepared (reported); inventory review remains |
| Active Directory and DNS | Core foundation validated |
| Microsoft Entra ID | Tenant and test objects established |
| Entra Connect Sync | Pilot user, attribute, and group synchronization validated; scope review remains |
| KDS / gMSA | Account usability and scheduled-task test validated; runtime identity audit remains |
| Okta SSO | Planned; no tenant or integration established |

## 1. VirtualBox foundation

**Status: Prepared (reported).**

- Windows Server virtual machines and snapshots were prepared.
- Keep VM names, OS versions, assigned resources, and network modes in a concise inventory.
- Confirm a usable rollback point before significant configuration changes.

## 2. Active Directory and DNS

**Status: Core setup validated.**

- AD DS configured on Windows Server 2019.
- Lab domain: `skrillsam.org`.
- On-premises lab identities created.
- Windows client domain join and secure-channel validation observed.
- DNS zone and lab records inspected.

**Lab reference addresses:** DC `192.168.56.10`; client `192.168.56.20`.

Useful checks (run elevated where required).

On the domain controller:

```powershell
Get-ADDomain
Get-ADForest
Get-Service DNS, NTDS, Netlogon
dcdiag /test:dns /v
```

On a domain-joined client:

```powershell
ipconfig /all
nslookup skrillsam.org
nltest /dsgetdc:skrillsam.org
Test-ComputerSecureChannel -Verbose
(Get-CimInstance Win32_ComputerSystem).PartOfDomain
```

## 3. Microsoft Entra ID

**Status: Tenant and initial test objects established.**

- Entra ID Free lab tenant accessed.
- Cloud-only user `Lab Cloud User` created.
- Cloud security group `SG-Cloud-Lab-Users` created.

**Operational notes**
- Confirm the selected tenant before administrative changes.
- Review administrator authentication, recovery, and applicable licensing.
- Cloud-only identities are distinct from identities synchronized from AD.

## 4. Microsoft Entra Connect Sync

**Status: Pilot synchronization validated; scope and ongoing health review remain.**

### Observed results

- Configuration wizard completed with Password Hash Synchronization selected.
- Source anchor shown as `mS-DS-ConsistencyGuid`.
- Connect Sync service and scheduler checks reported running/enabled.
- Successful connector import, synchronization, and export operations observed.
- Pilot user Ephraim Boss appeared in Entra as synchronized.
- An AD Department update to `IT-Lab` appeared in Entra.
- `PasswordHashSync=True` observed.
- User reported successful cloud sign-in, including after an AD password reset and delta sync. An event independently isolating the exact PHS authentication path was not captured.
- `Hybrid Test User` was provisioned from AD and appeared in Entra.
- AD global security group `IAM-Lab-Users` synchronized with Ephraim Boss and Hybrid Test User as direct members.

### Remaining work

1. Inspect the active synchronization scope. A wizard page displayed “Synchronize all users and devices”; confirm whether this is the effective configured scope.
2. Review connector health and recent errors.
3. If changing scope, plan the change carefully and retain recovery/rollback options.
4. Capture and inspect sanitized evidence of connector state and pilot results.

Wizard completion alone is not proof of end-to-end synchronization; the pilot results listed above were observed separately.

## 5. KDS and group Managed Service Account (gMSA)

**Status: Account usability and scheduled-task test validated; runtime identity audit remains open.**

**Existing account reused:** `gmsaLabSvc`

- Existing KDS root key discovered; `IsFormatValid=True`.
- Retrieval group: `gMSA-Server2022-Hosts`.
- Group membership included test host `WIN-7UDT986C0L5`.
- `Test-ADServiceAccount gmsaLabSvc` returned `True` on Server 2022.
- Scheduled task `gMSA-Lab-Test` registered with configured principal `gmsaLabSvc`.
- Manual task run completed with `LastTaskResult=0`.
- Timestamp output observed in `C:\\gMSA-Lab\\gmsa-test.txt`.

The task principal inspection reported `UserId=gmsaLabSvc`, `LogonType=Password`, and `RunLevel=Limited`. The task's successful result validates the test execution, but does not by itself independently prove the process's runtime security identity.

### Remaining work

- Review Task Scheduler Operational events and suitable security evidence to establish runtime identity.
- Inspect and caption the published screenshots; verify they render.
- Decide whether to retain or remove the temporary task, script, and output file.

## 6. Okta SSO

**Status: Planned. No Okta tenant or application integration has been established.**

1. Review available Okta signup options and actual eligibility.
2. Create or access a dedicated lab organization, if available.
3. Choose a non-production SAML test application and define the target architecture.
4. Decide the authoritative identity source and provisioning direction before connecting AD or Entra.
5. Configure the application's SAML settings (issuer/entity ID, audience, endpoints, claims, and signing certificate) according to the app's requirements.
6. Test an assigned user and a user without assignment.
7. Capture relevant, sanitized sign-in evidence and document troubleshooting.
8. Record certificate lifecycle and maintenance considerations.

Do not assume tenant features, plan entitlements, or licensing before confirming them in the actual environment.

## 7. Portfolio quality and evidence

**Completed**
- Architecture, roadmap, troubleshooting, and session-log documentation established.
- Active Directory foundation evidence committed.
- Four additional evidence images committed under `screenshots/02-active-directory/`.

**Remaining**
- Inspect the four new screenshots and rename them to match their actual content.
- Verify the images render correctly in GitHub.
- Add relevant Entra and hybrid-sync evidence as available.
- Check internal links and diagrams.
- Review published files for secrets and unnecessary personal or environment details.
- Keep milestone status aligned with observed results.
