# boot VM Manually (RAW QEMU)
qemu-system-x86_64 \
  -enable-kvm \
  -m 2048 \
  -smp 2 \
  -cpu host \
  -drive file=labvm.qcow2,format=qcow2 \
  -cdrom ./iso_images/ubuntu-25.10-live-server-amd64.iso \
  -boot d \ 
  -netdev user,id=net0 \
  -device e1000,netdev=net0

