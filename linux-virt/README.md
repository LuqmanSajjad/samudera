new commands learned 
- `lsmod` 	: list kernel modules status and other info
```
lmsmod | grep kvm 
```

The Tools installed 

qemu-desktop: The emulator.
libvirt: The management daemon.
virt-manager: A GUI (good for visualizing what you do in the CLI).
edk2-ovmf: For UEFI support (modern OS booting).
virt-install:


# Phase 1 – Virtualization Fundamentals (Foundation)

## 1. Core Concepts

**Goal:** Be able to explain how a VM boots and how it maps to host CPU, memory, disk, and network.

* Type 1 vs Type 2 hypervisors
	- type 1 has direct access to the hardware, type 2 runs as a software/app on top of the OS (higher latency).

* Full virtualization vs paravirtualization
	- Full: VM is unaware of virtualisation, Hardware virtualization (Intel VT-x / AMD-V)
	- Para: Vm is aware, guest OS is modified to make hypercalls

* CPU virtualization extensions

* Memory virtualization (ballooning, overcommit)

* Virtual networking 
	- bridges, br0
	- NAT
	- tap devices (software-defined eth int)

* Storage backends 
	- raw	: virtual disk > simple uncompressed, 
	- qcow2	: virtual disk > qemu cow, support encr + snapshots
	- LVM	:  
	- Ceph	: Software-defined > 
	- NFS	: Network attached > 


---

# Phase 2 – QEMU Fundamentals

## 2. What is QEMU?

Understand the difference between:

* **QEMU** (machine emulator)
* **KVM** (kernel acceleration)

QEMU alone = full emulation (slow)
QEMU + KVM = hardware-accelerated virtualization (fast)

---

## 3. Install and Verify KVM

On a Debian/Ubuntu-based system:

