# Screenshot Evidence

This folder contains actual screenshots captured from the lab. Keep useful technical proof visible while removing secrets and unrelated private information.

## Evidence index

| File | Destination | What it demonstrates |
|---|---|---|
| `01-virtualbox-lab-inventory.png` | [01-virtualbox](01-virtualbox/) | VM inventory and visible network/configuration details |
| `02-active-directory-lab-users.png` | [02-active-directory](02-active-directory/) | AD domain, LabUsers OU, and test users |
| `03-windows-client-domain-membership.png` | [02-active-directory](02-active-directory/) | Windows client and domain membership |
| `04-powershell-domain-validation.png` | [02-active-directory](02-active-directory/) | PowerShell domain discovery and validation |
| `05-domain-controller-dns-records.png` | [02-active-directory](02-active-directory/) | DNS zone and lab records |
| `08-image(20261026-141818).png` | [02-active-directory](02-active-directory/08-image%2820261026-141818%29.png) | Additional lab milestone evidence; individual caption pending visual review |
| `09-image(20261026-145124).png` | [02-active-directory](02-active-directory/09-image%2820261026-145124%29.png) | Additional lab milestone evidence; individual caption pending visual review |
| `10-image(20261026-145236).png` | [02-active-directory](02-active-directory/10-image%2820261026-145236%29.png) | Additional lab milestone evidence; individual caption pending visual review |
| `11-image(20261026-145851).png` | [02-active-directory](02-active-directory/11-image%2820261026-145851%29.png) | Additional lab milestone evidence; individual caption pending visual review |

## Evidence folders

- `01-virtualbox/` — VM foundation
- `02-active-directory/` — AD DS, DNS, client validation, GPO, and gMSA
- `03-entra-id/` — Entra tenant and identity evidence
- `04-hybrid-sync/` — Connect Sync and hybrid identity evidence
- `05-okta-sso/` — future Okta configuration and SSO tests

## Publication state

- [x] Foundation AD evidence files present
- [x] Four additional image files committed under `02-active-directory/`
- [ ] Individually inspect the four new images for subject, legibility, and redaction
- [ ] Rename images based on actual contents and add meaningful captions
- [ ] Open each new image in GitHub and confirm it renders
- [ ] Add relevant Entra/hybrid synchronization evidence as it becomes available
- [ ] Keep Okta evidence for future SSO milestones

The repository listing verifies that the files are present. It does not establish their individual contents or visual rendering.

## Redaction standard

**Keep visible when useful:** OS versions, lab VM/server names, `skrillsam.org`, lab test identities, private VirtualBox host-only addresses, commands, and validation results.

**Redact:** passwords, tokens, recovery codes, private keys, authentication cookies, product keys, unnecessary public IPs, personal email addresses, and unrelated employer/customer details.

Lab test objects and private lab IPs can remain visible when they support the technical demonstration. Avoid masking useful context unnecessarily.
