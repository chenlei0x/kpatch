## How to generate

1. prepare `tkernel4` project and determine the kernel tag against which your patch is applied.

2. prepare target kernel's corresponding **debuginfo** rpm.

3. prepare and **install** target kernel's corresponding **devel** rpms.

4. prepare your patch

5. prepare gcc for arm64 version **8.3.1**

   ```shell
   # install gcc 8.3.1
   yum install tlinux-release-sclo
   # switch to gcc 8.3.1
   scl enable devtoolset-8 bash
   # confirm gcc version
   gcc -v
   ```

6. clone `kpatch-public` project, and checkout `tkernel4_arm` branch

7. `cd kpatch-public/kpatch-build`

8. edit `demo_build.sh` as needed

   ```bash
   # your tkernel git dir
   GIT_PATH=/data/hotpatch/tkernel4
   
   # everything including log, extracted debuginfo rpm and
   # final patch.ko lies here
   CACHEDIR="/data/hotpatch-result"
   
   # your tkernel version against which your patch is applied.
   KERN_TAG=5.4.32-1-tlinux4_hotpatch_v6
   
   # your kernel debuginfo and devel rpm path
   KERN_DEBUGINFO=/data/kernel-debuginfo-5.4.32-1.tlinux4_hotpatch_v6.tl2.aarch64.rpm
   
   # your patch file
   YOUR_PATCH_LIST=/data/hotpatch/tkernel4/0001-xfs-hotpatch-test.patch
   
   CACHEDIR=$CACHEDIR ./kpatch-build-tlinux -g  "$GIT_PATH" -t "$KERN_TAG"  \
   	--skip-gcc-check --skip-cleanup --debuginfo $KERN_DEBUGINFO \
   	 $YOUR_PATCH_LIST
   ```

9. run `demo_build.sh`

10. the output will show you the  path of the hot patch (as a kernel module) 

## How to use

If everything goes will, your hot patch kernel module now is available. 

### To enable  your hotpatch

```shell
# insert kpatch kernel module (run once)
modprobe kpatch
# insert your hotpatch
insmode your-patch.ko
```

There exists **sysfs** entries for your hotpatch. Such as:

```shell
/sys/kernel/kpatch/your-patch/
```

### To confirm hot patch status

```shell
cd /sys/kernel/kpatch/your-patch/
cat enabled
```

### To disable your hot patch

```shell
cd /sys/kernel/kpatch/your-patch/
echo 0 > enabled
```

### To remove your hot patch

```shell
# disable your hot patch before removing
rmmod your-patch
```



