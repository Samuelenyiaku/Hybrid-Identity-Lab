# Screenshot Evidence

This folder contains real screenshots captured from the lab. Preserve useful technical evidence: VM names and versions, lab domain names, lab user objects, private lab IP addresses, DNS records, PowerShell commands, and validation results should remain visible when they help demonstrate the build.

## Evidence index

| File | Destination | What it demonstrates |
|---|---|---|
| `01-virtualbox-lab-inventory.png` | [01-virtualbox](01-virtualbox/) | VirtualBox inventory: Windows Server 2022, Windows Server 2019, Windows Server 2025, Ubuntu, and Windows 11 client VMs; selected VM configuration and network adapters |
| `02-active-directory-lab-users.png` | [02-active-directory](02-active-directory/) | Active Directory Users and Computers, the lab domain, LabUsers OU, and created test users |
| `03-windows-client-domain-membership.png` | [02-active-directory](02-active-directory/) | Windows client computer name and successful domain membership |
| `04-powershell-domain-validation.png` | [02-active-directory](02-active-directory/) | PowerShell domain discovery, domain-participation result, and secure-channel validation |
| `05-domain-controller-dns-records.png` | [02-active-directory](02-active-directory/) | DNS forward lookup zone and lab host records |

### Additional committed files (October 26, 2026)

The following additional image files were found in `screenshots/02-active-directory/`. Their presence is verified by the GitHub directory listing; their visual contents and redaction quality have not been independently inspected in this review.

- [08-image(20261026-141818).png](02-active-directory/08-image%2820261026-141818%29.png)
- [09-image(20261026-145124).png](02-active-directory/09-image%2820261026-145124%29.png)
- [10-image(20261026-145236).png](02-active-directory/10-image%2820261026-145236%29.png)
- [11-image(20261026-145851).png](02-active-directory/11-image%2820261026-145851%29.png)

Rename or caption these using what each actually demonstrates after visually reviewing them. Do not infer the screenshot subject from timestamps or numbering.

## Redaction approach

Use minimal, targeted redaction. Keep the lab evidence readable and technically meaningful.

**Keep visible when useful:** server operating-system versions, VM names, the `skrillsam.org` lab domain, lab test-user objects, private VirtualBox host-only addresses, DNS records, PowerShell commands, and successful/failed test results.

**Redact only where appropriate:** personal email addresses, unrelated Windows profile paths, public IP addresses, product keys, passwords, tokens, recovery codes, private keys, authentication cookies, and unrelated personal or employer/customer information. Do not redact the Active Directory test-user list simply because it contains lab user names; the user has explicitly asked to keep those visible.

## Windows Server 2022 evidence

The VirtualBox inventory screenshot shows a Windows Server 2022 VM alongside Windows Server 2019, Windows Server 2025, Ubuntu, and Windows 11. This proves the VM is present in the lab inventory, but does not by itself prove every Server 2022 setup or configuration step. Add additional real screenshots from the Server 2022 setup sequence as they are available, and caption each with the actual step shown.

## Publication checklist

- [x] Confirm four additional dated image files exist in `02-active-directory/` via GitHub directory listing.
- [ ] Visually inspect each new image and verify redactions and legibility.
- [x] Earlier foundation evidence files exist in the destination folder.
- [ ] Add meaningful captions/descriptions for the four new images.
- [ ] Locate and publish the reviewed Entra Connect wizard screenshots; `04-hybrid-sync/` currently contains only its README.
- [ ] Open each newly committed image from GitHub to verify it renders.

These are real lab screenshots, not generated illustrations. Do not claim a milestone is complete unless the screenshot or test output supports it.
