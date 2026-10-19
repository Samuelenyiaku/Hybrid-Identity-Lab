# Troubleshooting Playbook

Use the same incident structure for every failure so the repository shows your reasoning, not just a list of commands.

## Incident record template

- **Date / milestone:**
- **Goal:**
- **Expected result:**
- **Observed result / exact error:**
- **Scope affected:**
- **Commands and evidence:**
- **Root cause:**
- **Resolution:**
- **Retest result:**
- **Rollback performed (if any):**

Redact usernames, tenant identifiers, IPs, tokens, and other details that are not needed to explain the issue.

## Domain join or domain-controller discovery fails

1. Run `ipconfig /all` and confirm the client uses the lab AD DNS server.
2. Run `nslookup skrillsam.org`.
3. Run `nltest /dsgetdc:skrillsam.org`.
4. On the DC, check `Get-Service DNS, NTDS, Netlogon`.
5. Run `dcdiag /test:dns /v` and review the actual errors.
6. Verify the client and DC have sensible time settings and can reach each other on the intended virtual network.

Avoid resetting the machine account or rejoining the domain before preserving the exact error and checking DNS/network prerequisites.

## Domain secure-channel test fails

On the client:

```powershell
Test-ComputerSecureChannel -Verbose
```

Check domain-controller reachability, DNS, time, and the computer account state. Treat repair commands as a later step, after capturing diagnostics and confirming you have appropriate administrative access.

## Entra tenant or portal confusion

- Confirm the signed-in account and selected directory in the portal.
- Distinguish a personal Microsoft account from a work/school identity in an organizational tenant.
- Confirm that the selected tenant is the dedicated lab tenant before creating objects or applications.
- Check current licensing and trial eligibility in Microsoft's official portal; do not rely on outdated screenshots or assumptions.

## Synchronization issues (future milestone)

- Confirm the sync component is supported and meets prerequisites.
- Confirm the pilot scope includes the intended test object.
- Check connector/service health and synchronization errors in the official admin interface.
- Verify source attributes and matching behavior before making changes.
- Do not expand sync scope to troubleshoot a single user until the cause is understood.

## SSO issues (future milestone)

- Confirm the application URL, identifier/entity ID, reply/ACS URL, and protocol settings match the application's documentation.
- Check the test user's assignment and relevant access policy.
- Review the IdP and application sign-in logs for the same test attempt and timestamp.
- Check clock, certificate validity, and claim/attribute mapping where applicable.
- Capture both successful and intentionally denied test cases.

## Safety note

Do not paste credentials, access tokens, cookies, private keys, or unredacted authentication traces into issues or commits. Keep experiments isolated and preserve a rollback point before high-impact changes.
