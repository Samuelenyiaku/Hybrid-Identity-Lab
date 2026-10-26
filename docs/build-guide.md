# Hybrid Identity Lab Build Guide

Follow the phases in order. Separate configured settings from observed outcomes, and retain a rollback point before high-impact changes.

## Milestone overview

1. VirtualBox foundation — prepared (reported)
2. Active Directory + DNS — core foundation validated
3. Microsoft Entra ID — tenant and cloud-only test objects established
4. Microsoft Entra Connect Sync — pilot provisioning, attribute flow, and group membership validated; scope review remains
5. KDS / gMSA — core usability and scheduled-task test validated; runtime identity audit remains
6. Okta SSO — planned; tenant not yet created

## 1. VirtualBox foundation

**Status: Prepared (reported).**

- [x] Windows Server VMs and snapshots prepared
- [ ] Keep a concise inventory of VM names, OS versions, memory, CPU, and network modes
- [ ] Confirm rollback snapshot before high-impact changes

## 2. Active Directory and DNS

**Status: Core setup complete.**

- [x] AD DS configured on Windows Server 2019 domain controller
- [x] Lab domain `skrillsam.org`
- [x] On-premises lab identities created
- [x] Windows client `CLIENT01` joined to the domain
- [x] Domain membership and secure-channel validation observed
- [x] DNS zone and lab records inspected

Lab reference addresses: DC `192.168.56.10`; client `192.168.56.20`.

Suggested checks on DC (elevated PowerShell):

```powershell
Get-ADDomain
Get-ADForest
Get-Service DNS, NTDS, Netlogon
dcdiag /test:dns /v
```

On the client:

```powershell
ipconfig /all
nslookup skrillsam.org
nltest /dsgetdc:skrillsam.org
Test-ComputerSecureChannel -Verbose
(Get-CimInstance Win32_ComputerSystem).PartOfDomain
```

## 3. Microsoft Entra ID

**Status: Initial tenant and test objects established.**

- [x] Accessed Entra ID Free lab tenant
- [x] Created cloud-only user `Lab Cloud User`
- [x] Created cloud security group `SG-Cloud-Lab-Users`
- [ ] Confirm selected tenant before administrative changes
- [ ] Review administrator authentication and recovery
- [ ] Record relevant licensing/prerequisites

Cloud-only objects must not be presented as AD-synchronized identities.

## 4. Microsoft Entra Connect Sync

**Status: Pilot validation achieved; scope and recurring health review remain.**

Observed outcomes:
- Configuration wizard completed; Password Hash Synchronization selected.
- Source anchor shown as `mS-DS-ConsistencyGuid`.
- Connect Sync service and scheduler checks reported running/enabled.
- Successful connector import, synchronization, and export operations observed.
- Pilot user Ephraim Boss appeared in Entra as synchronized.
- AD Department change to `IT-Lab` was observed in Entra.
- `PasswordHashSync=True` observed.
- User reported successful cloud sign-in, including following an AD password reset and delta sync. A sign-in event isolating the exact PHS path was not captured.
- `Hybrid Test User` was provisioned from AD and appeared in Entra.
- AD global security group `IAM-Lab-Users` synchronized with two direct members: Ephraim Boss and Hybrid Test User.

### Remaining work

1. Inspect the actual configured synchronization scope. A wizard page showed “Synchronize all users and devices”; determine if this is the active scope.
2. If narrowing scope, plan carefully and preserve recovery/rollback options.
3. Review connector health and recent errors.
4. Capture sanitized evidence for connector state and pilot validation.

Wizard completion by itself is not proof of end-to-end sync; the pilot results above were observed separately.

## 5. KDS root key and gMSA

**Status: Core usability and scheduled-task test validated; runtime identity audit pending.**

Existing gMSA reused: `gmsaLabSvc`.

- [x] Existing KDS root key discovered; `IsFormatValid=True`
- [x] Retrieval group `gMSA-Server2022-Hosts` contained `WIN-7UDT986C0L5`
- [x] Server 2022 `Test-ADServiceAccount gmsaLabSvc` returned `True`
- [x] Task `gMSA-Lab-Test` registered with configured principal `gmsaLabSvc`
- [x] Manual run completed with `LastTaskResult=0`
- [x] Timestamp output observed in `C:\\gMSA-Lab\\gmsa-test.txt`

Task principal inspection showed `UserId=gmsaLabSvc`, `LogonType=Password`, `RunLevel=Limited`. This validates the configured task and successful test result; independently proving runtime identity remains open.

Follow-up:
- Review Task Scheduler Operational and appropriate security evidence.
- Visually inspect and caption the published screenshots; verify they render.
- Decide whether to retain or remove the temporary task, script, and output file.

## 6. Okta SSO

**Status: Planned. No Okta tenant or app integration exists yet.**

1. Evaluate the available Okta tenant signup options and actual plan eligibility.
2. Create/access a dedicated lab organization.
3. Choose a non-production SAML test application and target architecture.
4. Decide the authoritative identity source and provisioning direction before connecting AD or Entra.
5. Configure SAML endpoints, issuer/entity ID, audience, claims, certificate, and assignment per the app's supported settings.
6. Test a permitted assigned user and a user without assignment.
7. Record the sign-in results and relevant safe logs.
8. Document troubleshooting and certificate lifecycle.

Do not assume features or licensing until confirmed in the actual tenant.

## 7. Portfolio polish

- [x] Architecture, roadmap, troubleshooting, and session-log documents
- [x] AD foundation evidence files committed
- [x] Four additional dated evidence images committed under `screenshots/02-active-directory/`
- [ ] Individually inspect new screenshots and rename based on their actual content
- [ ] Verify the new images render
- [ ] Add relevant Entra/hybrid evidence as available
- [ ] Check internal links and diagrams
- [ ] Scan updates for secrets and unnecessary private information
- [ ] Refresh status only when supported by observed results
