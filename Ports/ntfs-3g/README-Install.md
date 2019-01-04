# Disclaimer

You are absolutely on your own. I don't even claim this works for me.
Test and report.

=
# Prerequisites

Install OSXFuse 3.7.1 or greater

```
sudo rudix install libintl
```
=
# Installation process

1. Install the package:

```
sudo rudix install ntfs-3g
```

2. Reboot into recovery mode
3. Disable CSR and reboot
4. Open a root shell

```
cd /sbin
mv mount_ntfs mount_ntfs.orig
ln -sf /usr/local/sbin/mount_ntfs
```

5. Reboot into recovery mode
6. Enable CSR again and reboot

