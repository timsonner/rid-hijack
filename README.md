# rid-hijack

POC to see if automating modification of registry keys was possible for the purpose of persistence using the RID hijacking technique. This is a good example in general of writing bytes to a registry key if you know the offset of the values you want to modify.

## Table of Contents
1. [Overview](#overview)
2. [File Descriptions](#file-descriptions)
3. [Getting Started](#getting-started)
4. [Usage](#usage)

---

## Overview

Scripts that enable assigning local admin privileges to unprivileged accounts without using groups (Admininstrators, Backup Operators, etc). This enables persistence by having an admin account that looks like a regular user account.  

For more information on the RID hijacking technique:
https://www.ired.team/offensive-security/persistence/rid-hijacking  

---

## File Descriptions

| **File/Folder**       | **Description**                                                                 |
|------------------------|---------------------------------------------------------------------------------|
| `rid-hijack.ps1`       | RID Hijack script. Run as admin. Used for persistance, hiding in plain sight.   |
| `rid-hijack.cs`        | RID Hijack script. Run as admin. Used for persistance, hiding in plain sight.   |
| `dec-to-hex.ps1`       | Decimal to hex converter. Run with -LittleEndian flag for reversed output.      |

---

## Getting Started  

Run .ps1 files in PowerShell. Compile as a binary with .cs files. Must be run with elevated privileges... at least enough to be able to modify the registry (Backup Operator or better).

---

## Usage

Lookup the SID of the target account. The last octet of the SID is the RID. Convert the RID to hex. Give that 3 digit hex string to the script. Script modifies the registry key for the target account giving it the same RID as the 'Administrator' account. Thus regular user has admin privs.

---
