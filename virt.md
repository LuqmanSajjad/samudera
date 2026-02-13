
```
====================
	SAFETY NET 
====================
```

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

* Install: `qemu-kvm`, `libvirt-daemon-system`, `virt-manager`
* Verify virtualization support:

  * `egrep -c '(vmx|svm)' /proc/cpuinfo`
  * `lsmod | grep kvm`

**Goal:** Confirm your CPU and kernel support KVM.

---

## 4. Create a VM Using Raw QEMU CLI

Start without libvirt so you understand the mechanics.

Tasks:

* Create a disk image:

  * `qemu-img create -f qcow2 testvm.qcow2 20G`
* Boot from ISO:

  * `qemu-system-x86_64 -enable-kvm -m 2048 -drive file=testvm.qcow2 ...`

Learn:

* `-m` memory
* `-smp` CPU cores
* `-drive`
* `-netdev`
* `-device`

**Goal:** Manually create and boot a VM.

---

# Phase 3 – KVM Architecture Deep Dive

## 5. Understand the KVM Stack

Architecture layers:

```
Hardware (CPU VT-x / AMD-V)
↓
Linux Kernel (KVM module)
↓
QEMU (userspace VM process)
↓
libvirt (management layer)
↓
virt-manager / virsh
```

Study:

* kvm.ko kernel module
* vhost-net
* virtio drivers
* qemu-system-x86_64 process model

**Goal:** Explain what happens when you start a VM via `virsh`.

---

# Phase 4 – Libvirt & VM Management

## 6. Learn libvirt

Install and use:

* `virsh`
* `virt-install`
* `virt-manager`

Core commands:

* `virsh list`
* `virsh define`
* `virsh start`
* `virsh shutdown`
* `virsh dumpxml`

Learn how XML defines:

* CPU topology
* Memory
* Disks
* Network interfaces
* Graphics (VNC/SPICE)

**Goal:** Create, manage, and inspect VMs using `virsh`.

---

# Phase 5 – Networking for Virtualization

This is critical for system engineers.

## 7. Linux Networking Basics

Master:

* Linux bridges (`brctl` / `ip link`)
* TAP interfaces
* NAT via iptables/nftables
* macvtap
* Open vSwitch (basic knowledge)

Understand libvirt network types:

* NAT (default)
* Bridge
* Isolated
* Host-only

**Goal:** Manually create a bridge and attach a VM to it.

---

# Phase 6 – Storage for VMs

## 8. Disk Formats

Understand:

* raw vs qcow2
* backing files
* snapshots
* thin provisioning

Use:

* `qemu-img info`
* `qemu-img convert`
* `qemu-img snapshot`

## 9. Advanced Storage

Learn integration with:

* LVM
* iSCSI
* NFS
* Ceph RBD (important in enterprise)

**Goal:** Store VM disks on LVM and attach them.

---

# Phase 7 – Performance & Optimization

## 10. Virtio

Study:

* virtio-net
* virtio-blk
* virtio-scsi
* balloon driver

Understand why virtio is faster than emulated hardware.

---

## 11. CPU & Memory Tuning

Learn:

* CPU pinning
* NUMA awareness
* Hugepages
* Memory overcommit
* I/O tuning

Use tools:

* `virsh vcpupin`
* `numactl`
* `htop`
* `perf`

---

# Phase 8 – Enterprise-Level Concepts

## 12. Live Migration

Understand:

* Shared storage requirements
* Pre-copy migration
* Post-copy migration

Practice:

* Migrate VMs between two hosts.

---

## 13. Security

Study:

* sVirt
* SELinux with libvirt
* AppArmor
* VM isolation boundaries

---

## 14. Ecosystem Awareness

Know how KVM fits into:

* **Proxmox VE**
* **OpenStack**
* **oVirt**

You don’t need to master them yet—just understand the architecture.

---

# Hands-On 30-Day Learning Plan

### Week 1

* Virtualization theory
* Install KVM
* Create VM via QEMU CLI

### Week 2

* libvirt + virsh
* VM XML deep dive
* Virtual networking (bridges + NAT)

### Week 3

* Storage formats
* Snapshots
* LVM-backed VMs
* Virtio optimization

### Week 4

* Live migration lab (2 hosts)
* CPU pinning
* Security basics
* Performance benchmarking

---

# Recommended Lab Setup

Minimum:

* 16GB RAM
* 4+ cores
* SSD storage

Optional:

* Second machine (for migration practice)
* Or nested virtualization inside a cloud VM

---

# What “Job-Ready” Looks Like

You should be able to:

* Build KVM hosts from scratch
* Diagnose VM performance problems
* Configure bridged networking
* Perform live migrations
* Tune CPU and memory
* Explain virtualization architecture clearly

---

If you want, I can next:

* Create a **hands-on lab guide for today (step-by-step practical exercises)**
* Or design a **6-month full Linux System Engineer roadmap beyond virtualization**

