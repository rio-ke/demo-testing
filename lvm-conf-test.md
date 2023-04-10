# testing lvm configuration on drbd-clustern centos7


**lvm disk resize on /mnt folder**


* Use ‘lvextend’ to use all of the new space.

This command used for extending the existing logical volume with the newly added disk space. Here we have a logical volume (/dev/Volgroup01/root) with 44GB extend with the new added disk (/dev/sdd1) with disk space 8.5 GB

We can extend the LVM with the full disk space of the newly added diskbythe below command

```
lvextend /dev/Volgroup01/root /dev/sdd1
```

Extending logical volume rootto8.5G

Also, you can use the partial disk space available in the newly added disk space for extending the LVM through the below command

```
lvextend –L +5GB /dev/Volgroup01/root /dev/sdd1
```

It will extend the existing LVM with 5GB free space available in the disk /dev/sdd1

* Extend File system using command “resize2fs”

  This command is usually used for the file system ext3/4.Command will vary according to the file system which you need.

```
resize2fs /dev/Volgroup01/root
```

* Finally, check disk space to see the expanded disk space

```cmd
df-Th
```
