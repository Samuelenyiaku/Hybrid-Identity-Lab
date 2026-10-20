# VirtualBox Lab Inventory Evidence

## Screenshot: `01-virtualbox-lab-inventory.png`

This real screenshot shows the VirtualBox VM inventory, including:

- Windows Server 2022 — powered off at the time of capture
- Windows Server 2019 — selected VM, powered off in the inventory view
- Windows Server 2025 — powered off at the time of capture
- Ubuntu — powered off at the time of capture
- Windows 11 Client-01 — powered off at the time of capture

The selected Windows Server 2019 details show 2,048 MB RAM, a 50 GB virtual disk, a NAT adapter, and a host-only adapter. These settings are evidence of the VM configuration at the time of capture; they may change as the lab develops.

**What this proves:** multiple operating-system VMs are present in the lab and the selected Server 2019 VM is configured with NAT and host-only networking.

**What it does not prove by itself:** that Server 2022 is domain-joined, has a particular server role, or is fully configured. Capture the actual Server 2022 setup screens separately if documenting those steps.

## Redaction

Keep the VM names, Windows Server versions, RAM/disk details, and adapter modes visible. Redact only unrelated personal or host-specific information if it appears in a later screenshot. Do not blur the technical details that demonstrate the lab build.
