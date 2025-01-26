# rid-hijack

POC to see if automating modification of registry keys was possible for the purpose of persistence using the RID hijacking technique. This is a good example in general of writing bytes to a registry key if you know the offset of the values you want to modify. It also includes examples of Wscript to create desktop shortcuts that open regedit via psexec with hidden windows, there's also a decimal to hex converter for converting the last octet of a users SID to hex.

## Table of Contents
1. [Overview](#overview)
2. [File Descriptions](#file-descriptions)
3. [Getting Started](#getting-started)
4. [Usage](#usage)

---

## Overview

Scripts that enable local admin privileges with unprivileged accounts without using groups (Admininstrators, Backup Operators, etc). This enables persistence by having an admin account that looks like a regular user account. RID hijacking involves modifying bytes in a registry key value that's associated with a local user's account.  

For more information on the RID hijacking technique:
https://www.ired.team/offensive-security/persistence/rid-hijacking  

---

## File Descriptions

| **File/Folder**       | **Description**                                                                 |
|------------------------|---------------------------------------------------------------------------------|
| [rid-hijack.ps1](rid-hijack.ps1)       | PowerShell version. Run with psexec. Modifies registry key RID of target user. |
| [rid-hijack.cs](rid-hijack.cs)        | C# version. Run with psexec. Modifies registry key RID of target user. |
| [dec-to-hex.ps1](dec-to-hex.ps1)       | Convert last octet of SID to hex. Run with -LittleEndian flag for reversed output. |
| [create-psexec-regedit-shortcut.ps1](create-psexec-regedit-shortcut.ps1) | Create a desktop shortcut to run regedit via psexec. |
| [let-local-account-rdp-as-admin.ps1](let-local-account-rdp-as-admin.ps1) | Creat registry entry that allows RDP admin privs for local admins. |
| [psexec-variant-commands.md](psexec-variant-commands.md) | Variations of PsExec usage. Run command as other user by specifying script or process |

---

## Getting Started  

Run .ps1 files in PowerShell. Compile as a binary with .cs files. Must be run with elevated privileges... at least enough to be able to modify the registry (Backup Operator or better).

---

## Usage

Lookup the SID of the target account. The last octet of the SID is the RID. Convert the RID to hex. Give that 3 digit hex string to the script. Script modifies the registry key for the target account giving it the same RID as the 'Administrator' account. Thus regular user has admin privs.

---
